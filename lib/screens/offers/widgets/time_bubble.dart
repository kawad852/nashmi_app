import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class TimeBubble extends StatelessWidget {
  final String time;
  const TimeBubble({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colorPalette.redB31,
        borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
      ),
      child: CustomText(
        time,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: context.colorPalette.white,
      ),
    );
  }
}
