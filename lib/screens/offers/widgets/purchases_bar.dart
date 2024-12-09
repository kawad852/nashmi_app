import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_network_image.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class PurchasesBar extends StatelessWidget {
  final int count;
  const PurchasesBar({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 98,
      decoration: BoxDecoration(
        color: context.colorPalette.greyF2F,
        borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CustomText(
                        context.appLocalization.sold,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        " $count ",
                        color: context.colorPalette.redB31,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        context.appLocalization.ofe,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      const CustomText(
                        " 20",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 105,
                  child: Stack(
                    children: [
                      CustomNetworkImage(
                        kFakeImage,
                        width: 30,
                        height: 30,
                        shape: BoxShape.circle,
                        child: CustomText(
                          "+9",
                          fontWeight: FontWeight.bold,
                          color: context.colorPalette.white,
                        ),
                      ),
                      const Positioned(
                        left: 0,
                        child: CustomNetworkImage(
                          kFakeImage,
                          width: 30,
                          height: 30,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Positioned(
                        left: 25,
                        child: CustomNetworkImage(
                          kFakeImage,
                          width: 30,
                          height: 30,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Positioned(
                        left: 50,
                        child: CustomNetworkImage(
                          kFakeImage,
                          width: 30,
                          height: 30,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: context.colorPalette.green007,
              borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    context.appLocalization.catchUpBeforeOfferOver,
                    color: context.colorPalette.white,
                    overFlow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TweenAnimationBuilder<Duration>(
                  duration: const Duration(hours: 15, minutes: 15, seconds: 15),
                  tween: Tween(
                    begin: const Duration(hours: 15, minutes: 15, seconds: 15),
                    end: Duration.zero,
                  ),
                  builder: (BuildContext context, Duration value, Widget? child) {
                    final hours = value.inHours;
                    final minutes = value.inMinutes.remainder(60);
                    final seconds = value.inSeconds.remainder(60);
                    return CustomText(
                      "$seconds : $minutes : $hours",
                      fontWeight: FontWeight.bold,
                      color: context.colorPalette.white,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
