import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nashmi_app/screens/offers/offer_settings_selector.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/time_widget.dart';

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
                  OfferSettingsSelector(
                    builder: (context, offer, _) {
                      if (offer == null) {
                        return const SizedBox.shrink();
                      }
                      return TimeWidget(
                        startTime: offer.endTime!,
                        onEnd: () {
                          Fluttertoast.showToast(msg: context.appLocalization.offerEndedMsg);
                          Navigator.pop(context);
                        },
                        builder: (part) {
                          return CustomText(
                            part,
                            fontWeight: FontWeight.bold,
                            color: context.colorPalette.white,
                            textDirection: TextDirection.ltr,
                          );
                        },
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
