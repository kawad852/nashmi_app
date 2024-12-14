import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/helper/my_header_delegate.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/models/offer/offer_model.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/network/my_fields.dart';
import 'package:nashmi_app/screens/provider/provider_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/widgets/custom_future_builder.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_smoth_indicator.dart';

import '../../../utils/my_icons.dart';
import '../../../utils/my_theme.dart';
import '../../../widgets/custom_svg.dart';

class OfferHeader extends StatefulWidget {
  final OfferModel offer;

  const OfferHeader({
    super.key,
    required this.offer,
  });

  @override
  State<OfferHeader> createState() => _OfferHeaderState();
}

class _OfferHeaderState extends State<OfferHeader> {
  late Future<QuerySnapshot<CategoryModel>> _categoriesFuture;
  int _currentSliderIndex = 0;
  OfferModel get offer => widget.offer;

  void _initialize() {
    _categoriesFuture = ApiService.build(
      callBack: () async {
        return FirebaseFirestore.instance.categories.where(MyFields.id, whereIn: offer.provider!.categoryIds).get();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    final provider = offer.provider!;
    return SliverPersistentHeader(
      pinned: true,
      delegate: MyHeaderDelegate(
        expandedHeight: 272,
        collapsedHeight: kToolbarHeight + 50,
        builder: (context, shrinkOffset, expandedHeight, collapsedHeight, appear, disappear) {
          final top = expandedHeight - shrinkOffset - 110 / 2;
          return Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              CarouselSlider.builder(
                itemCount: offer.images!.length,
                options: CarouselOptions(
                  enableInfiniteScroll: offer.images!.length > 1,
                  height: expandedHeight,
                  viewportFraction: 1,
                  onPageChanged: (index, value) {
                    setState(() {
                      _currentSliderIndex = index;
                    });
                  },
                ),
                itemBuilder: (BuildContext context, int index, int pageViewIndex) {
                  final image = offer.images![index];
                  return CustomNetworkImage(
                    image,
                    radius: 0,
                  );
                },
              ),
              Positioned(
                top: top,
                left: 10,
                right: 10,
                child: Opacity(
                  opacity: disappear,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (offer.images!.length > 1)
                        CustomSmoothIndicator(
                          count: offer.images!.length,
                          index: _currentSliderIndex,
                        ),
                      GestureDetector(
                        onTap: () {
                          context.navigate((context) {
                            return ProviderScreen(
                              provider: null,
                              id: provider.id,
                            );
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: context.colorPalette.greyF2F,
                            borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                          ),
                          child: Row(
                            children: [
                              CustomNetworkImage(
                                provider.thumbnail!,
                                width: 60,
                                height: 60,
                                radius: MyTheme.radiusSecondary,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            context.translate(textEN: provider.nameEn, textAR: provider.nameAr),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const CustomSvg(MyIcons.check),
                                      ],
                                    ),
                                    CustomFutureBuilder(
                                      future: _categoriesFuture,
                                      onLoading: () => const Text(""),
                                      onComplete: (context, snapshot) {
                                        final categories =
                                            snapshot.data!.docs.map((e) => context.translate(textEN: e.data().nameEn, textAR: e.data().nameAr)).toList().join(", ");
                                        return FadeIn(
                                          child: Text(
                                            categories,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: context.colorPalette.grey8F8,
                                            ),
                                          ),
                                        );
                                      },
                                      onError: (error) => const SizedBox.shrink(),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  backgroundColor: context.colorScheme.surface.withOpacity(appear),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
