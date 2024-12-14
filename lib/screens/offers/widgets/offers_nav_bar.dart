import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/time_widget.dart';

class OffersNavBar extends StatelessWidget {
  final DateTime time;

  const OffersNavBar({
    super.key,
    required this.time,
  });

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
          TimeWidget(
            startTime: time,
            onEnd: () {},
          ),
        ],
      ),
    );
  }
}
