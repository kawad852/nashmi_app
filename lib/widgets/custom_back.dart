import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class CustomBack extends StatelessWidget {
  final Color? color;
  const CustomBack({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
             Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: color,
            ),
            CustomText(
              context.appLocalization.back,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
