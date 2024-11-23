import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class CustomBack extends StatelessWidget {
  const CustomBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
            CustomText(
              context.appLocalization.back,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}