import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class PurchasesBar extends StatelessWidget {
  final int count;
  final int limit;
  final bool purchased;

  const PurchasesBar({
    super.key,
    required this.count,
    required this.limit,
    required this.purchased,
  });

  @override
  Widget build(BuildContext context) {
    final outOfStock = count >= limit;
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
                      Text(
                        context.appLocalization.sold,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " $count ",
                        style: TextStyle(
                          color: context.colorPalette.red018,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        context.appLocalization.ofe,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " $limit",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: 105,
                //   child: Stack(
                //     children: [
                //       CustomNetworkImage(
                //         kFakeImage,
                //         width: 30,
                //         height: 30,
                //         shape: BoxShape.circle,
                //         child: CustomText(
                //           "+9",
                //           fontWeight: FontWeight.bold,
                //           color: context.colorPalette.white,
                //         ),
                //       ),
                //       const Positioned(
                //         left: 0,
                //         child: CustomNetworkImage(
                //           kFakeImage,
                //           width: 30,
                //           height: 30,
                //           shape: BoxShape.circle,
                //         ),
                //       ),
                //       const Positioned(
                //         left: 25,
                //         child: CustomNetworkImage(
                //           kFakeImage,
                //           width: 30,
                //           height: 30,
                //           shape: BoxShape.circle,
                //         ),
                //       ),
                //       const Positioned(
                //         left: 50,
                //         child: CustomNetworkImage(
                //           kFakeImage,
                //           width: 30,
                //           height: 30,
                //           shape: BoxShape.circle,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: purchased
                  ? context.colorPalette.green007
                  : outOfStock
                      ? context.colorPalette.red018
                      : context.colorPalette.green007,
              borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    purchased
                        ? context.appLocalization.purchasedText
                        : outOfStock
                            ? context.appLocalization.outOfStockText
                            : context.appLocalization.catchUpBeforeOfferOver,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: context.colorPalette.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (!outOfStock && !purchased)
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
