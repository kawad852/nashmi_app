import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/offers/widgets/time_bubble.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class OffersNavBar extends StatelessWidget {
  const OffersNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 61,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF7E,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(MyTheme.radiusPrimary),
          topRight: Radius.circular(MyTheme.radiusPrimary),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            context.appLocalization.remainingTimeOffers,
            fontWeight: FontWeight.bold,
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
              return Row(
                children: [
                  TimeBubble(
                    time: "$seconds",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: TimeBubble(
                      time: "$minutes",
                    ),
                  ),
                  TimeBubble(
                    time: "$hours",
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
