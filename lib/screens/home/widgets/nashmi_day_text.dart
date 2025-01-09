import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';

class NashmiDayText extends StatelessWidget {
  const NashmiDayText({
    super.key,
  });

  Widget _buildText({
    required String text,
    required Color? color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 30,
        color: color,
      ),
      maxLines: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    var texts = [
      _buildText(
        text: context.appLocalization.nashmiAsNashmi,
        color: null,
      ),
      _buildText(
        text: context.appLocalization.day,
        color: context.colorPalette.white,
      ),
    ];
    if (context.isRTL) {
      texts = texts.reversed.toList();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: texts,
    );
  }
}
