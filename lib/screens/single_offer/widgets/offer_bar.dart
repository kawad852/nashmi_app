import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_smoth_indicator.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class OfferBar extends StatefulWidget {
  const OfferBar({super.key});

  @override
  State<OfferBar> createState() => _OfferBarState();
}

class _OfferBarState extends State<OfferBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 5,
          options: CarouselOptions(
            viewportFraction: 1,
            enableInfiniteScroll: false,
            autoPlay: true,
            height: 272,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return const CustomNetworkImage(
              kFakeImage,
              width: double.infinity,
              radius: 0,
            );
          },
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: CustomSmoothIndicator(
                    count: 5,
                    index: currentIndex,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 80,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: context.colorPalette.greyF2F,
                  borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                ),
                child: Row(
                  children: [
                    const CustomNetworkImage(
                      kFakeImage,
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
                          const Row(
                            children: [
                              Flexible(
                                child: CustomText(
                                  "وكيل سامسونج BCI - خلدا",
                                  overFlow: TextOverflow.ellipsis,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 4),
                              CustomSvg(MyIcons.check),
                            ],
                          ),
                          CustomText(
                            "كهربائيات ، ادوات منزلية",
                            overFlow: TextOverflow.ellipsis,
                            color: context.colorPalette.grey8F8,
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
            ],
          ),
        ),
      ],
    );
  }
}
