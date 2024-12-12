import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/feedback/app_feedback.dart';
import 'package:nashmi_app/models/offer/offer_model.dart';
import 'package:nashmi_app/models/purchase/purchase_model.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/network/my_fields.dart';
import 'package:nashmi_app/screens/offers/offer_settings_selector.dart';
import 'package:nashmi_app/screens/offers/widgets/offer_header.dart';
import 'package:nashmi_app/screens/offers/widgets/purchases_bar.dart';
import 'package:nashmi_app/screens/offers/widgets/qr_code_scanner.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/custom_stream_builder.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';

class OfferScreen extends StatefulWidget {
  final String id;

  const OfferScreen({
    super.key,
    required this.id,
  });

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> with WidgetsBindingObserver {
  late StreamZip<DocumentSnapshot<Object>> _streams;

  DocumentReference<OfferModel> get _offerDocRef => FirebaseFirestore.instance.offers.doc(widget.id);
  CollectionReference<PurchaseModel> get _purchaseDocRef => context.userProvider.purchasesCollectionRef;

  void _initialize() {
    final offerStream = _offerDocRef.snapshots();
    final purchaseStream = _purchaseDocRef.doc(widget.id).snapshots();
    _streams = StreamZip([offerStream, purchaseStream]);
  }

  void _updateCurrentViews(int value) {
    FirebaseFirestore.instance.offers.doc(widget.id).update({
      MyFields.currentViews: FieldValue.increment(value),
    });
  }

  Future<void> _purchase(
    BuildContext context, {
    required String offerId,
    required DateTime offerTime,
    required bool alreadyPurchased,
    required int? total,
  }) async {
    ApiService.fetch(
      context,
      callBack: () async {
        await FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
          final purchaseRef = context.userProvider.purchasesCollectionRef.doc(offerId);
          transaction.set(
            purchaseRef,
            PurchaseModel(
              id: offerId,
              total: (total ?? 0) + 1,
              lastPurchaseAt: DateTime.now(),
            ),
          );
          transaction.update(_offerDocRef, {
            MyFields.purchasesCount: FieldValue.increment(1),
          });
          context.showSnackBar(context.appLocalization.successScanMsg);
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initialize();
    _updateCurrentViews(1);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _updateCurrentViews(-1);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _updateCurrentViews(1);
    } else if (state == AppLifecycleState.paused) {
      _updateCurrentViews(-1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfferSettingsSelector(builder: (context, offerSettings, _) {
        if (offerSettings == null) {
          return const SizedBox.shrink();
        }
        return CustomStreamBuilder(
          stream: _streams,
          withBackgroundColor: true,
          onComplete: (context, snapshot) {
            final offer = (snapshot.data![0] as DocumentSnapshot<OfferModel>).data()!;
            final purchase = snapshot.data![1] as DocumentSnapshot<PurchaseModel>;

            final alreadyPurchased = purchase.exists && purchase.data()!.lastPurchaseAt!.isAfter(offerSettings.lunchAt!);
            final outOfStock = offer.purchasesCount >= offer.purchaseLimit!;

            return Scaffold(
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kScreenMargin, vertical: kScreenMargin),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PurchasesBar(
                      count: offer.purchasesCount,
                      limit: offer.purchaseLimit!,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: StretchedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  const CustomSvg(MyIcons.locationOffer),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: CustomText(
                                      context.appLocalization.catchOffer,
                                      fontSize: 16,
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.bold,
                                      color: context.colorPalette.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: StretchedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  const CustomSvg(MyIcons.share),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: CustomText(
                                      context.appLocalization.share,
                                      textAlign: TextAlign.center,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: context.colorPalette.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: CustomScrollView(
                slivers: [
                  OfferHeader(offer: offer),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10).copyWith(top: 50),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  context.translate(textEN: offer.nameEn, textAR: offer.nameAr),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (offer.currentViews > 0)
                                Text(
                                  "${context.appLocalization.watchItNow} ${offer.currentViews}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                            ],
                          ),
                          Text.rich(
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            TextSpan(
                              children: [
                                TextSpan(text: context.appLocalization.onlyWith),
                                TextSpan(
                                  text: " ${offer.offerPrice} ${context.currency} ",
                                  style: TextStyle(
                                    color: context.colorPalette.redB31,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(text: context.appLocalization.insteadOf),
                                WidgetSpan(
                                  baseline: TextBaseline.alphabetic,
                                  alignment: PlaceholderAlignment.baseline,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                        " ${offer.originalPrice} ",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const CustomSvg(MyIcons.line),
                                    ],
                                  ),
                                ),
                                TextSpan(text: context.currency),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            context.appLocalization.offerDetails,
                            style: TextStyle(
                              color: context.colorPalette.red8B0,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            context.translate(textEN: offer.descriptionEn, textAR: offer.descriptionAr),
                          ),
                          if (!alreadyPurchased)
                            StretchedButton(
                              onPressed: outOfStock
                                  ? null
                                  : () {
                                      context.navigate((context) {
                                        return QrCodeScanner(id: offer.id!);
                                      }).then((value) {
                                        if (value != null && context.mounted) {
                                          _purchase(
                                            context,
                                            offerId: offer.id!,
                                            offerTime: offer.createdAt!,
                                            alreadyPurchased: alreadyPurchased,
                                            total: purchase.data()?.total,
                                          );
                                        }
                                      });
                                    },
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  const CustomSvg(MyIcons.scan),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      outOfStock ? context.appLocalization.offerEndedLabel : context.appLocalization.scanQR,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: context.colorPalette.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
