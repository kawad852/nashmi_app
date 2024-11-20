import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overFlow;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  const CustomText(
    this.data, {
    super.key,
    this.color,
    this.fontSize = 14,
    this.fontWeight,
    this.overFlow,
    this.maxLines,
    this.textAlign,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: overFlow,
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
      style: TextStyle(
        color: color ?? context.colorPalette.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
