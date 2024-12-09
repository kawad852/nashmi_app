import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/models/offer/offer_model.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/network/my_fields.dart';
import 'package:nashmi_app/screens/offers/widgets/offer_header.dart';
import 'package:nashmi_app/screens/offers/widgets/purchases_bar.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
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
  late Stream<DocumentSnapshot<OfferModel>> _offerStream;

  void _initialize() {
    _offerStream = FirebaseFirestore.instance.offers.doc(widget.id).snapshots();
  }

  void _updateCurrentViews(int value) {
    FirebaseFirestore.instance.offers.doc(widget.id).update({
      MyFields.currentViews: FieldValue.increment(value),
    });
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
      body: CustomStreamBuilder(
        stream: _offerStream,
        withBackgroundColor: true,
        onComplete: (context, snapshot) {
          final offer = snapshot.data!.data()!;
          return Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kScreenMargin, vertical: kScreenMargin),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PurchasesBar(
                    count: offer.purchasesCount,
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
                        StretchedButton(
                          onPressed: () {},
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const CustomSvg(MyIcons.scan),
                              const SizedBox(width: 5),
                              Expanded(
                                child: CustomText(
                                  context.appLocalization.scanQR,
                                  fontSize: 16,
                                  color: context.colorPalette.white,
                                  fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
