import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/models/ad/ad_model.dart';
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
      context.navigate(
        (context) => CategoriesScreen(
          id: id,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.ads.length,
          options: CarouselOptions(
            viewportFraction: 1,
            enableInfiniteScroll: false,
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
                _onTap(context, type: ad.type!, id: ad.id!);
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
                count: 5,
                index: currentIndex,
              ),
            ),
          ),
      ],
    );
  }
}
