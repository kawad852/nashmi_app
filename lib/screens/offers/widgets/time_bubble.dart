import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';

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
        color: context.colorPalette.red018,
        borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
      ),
      child: ZoomIn(
        key: ValueKey(time),
        child: Text(
          time,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: context.colorPalette.white,
          ),
        ),
      ),
    );
  }
}
