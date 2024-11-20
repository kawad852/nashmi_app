import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_smoth_indicator.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 5,
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
            return const CustomNetworkImage(
              kFakeImage,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 3),
              radius: MyTheme.radiusSecondary,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
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
