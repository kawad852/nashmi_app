import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/models/ad/ad_model.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/screens/category/categories_screen.dart';
import 'package:nashmi_app/screens/offers/offer_screen.dart';
import 'package:nashmi_app/screens/provider/provider_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_smoth_indicator.dart';

import '../../../utils/enums.dart';

class AdsCarousel extends StatefulWidget {
  final List<AdModel> ads;

  const AdsCarousel({
    super.key,
    required this.ads,
  });

  @override
  State<AdsCarousel> createState() => _AdsCarouselState();
}

class _AdsCarouselState extends State<AdsCarousel> {
  int currentIndex = 0;

  void _onTap(
    BuildContext context, {
    required String type,
    required String id,
  }) {
    if (type == AdEnum.provider.value) {
      context.navigate(
        (context) => ProviderScreen(provider: null, id: id),
      );
    } else if (type == AdEnum.offer.value) {
      context.navigate(
        (context) => OfferScreen(id: id),
      );
    } else if (type == AdEnum.category.value) {
      _fetchCategory(context, id);
    }
  }

  Future<void> _fetchCategory(BuildContext context, String id) async {
    ApiService.fetch(
      context,
      callBack: () async {
        final category = await FirebaseFirestore.instance.categories.doc(id).get().then((value) => value.data()!);
        if (context.mounted) {
          context.navigate(
            (context) => CategoriesScreen(
              mainCategory: category,
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.ads.length,
          options: CarouselOptions(
            viewportFraction: 1,
            enableInfiniteScroll: widget.ads.length > 1,
            height: 140,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final ad = widget.ads[index];
            return CustomNetworkImage(
              ad.imageURL!,
              onTap: () {
                _onTap(context, type: ad.type!, id: ad.destinationId!);
              },
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              radius: MyTheme.radiusSecondary,
            );
          },
        ),
        if (widget.ads.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: CustomSmoothIndicator(
                count: widget.ads.length,
                index: currentIndex,
              ),
            ),
          ),
      ],
    );
  }
}
