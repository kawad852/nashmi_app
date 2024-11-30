import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class FilterBubble extends StatelessWidget {
  final String icon;
  final String title;
  final void Function() onTap;
  final bool selected;

  const FilterBubble({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.white,
          borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
        ),
        child: Row(
          children: [
            CustomSvg(icon),
            const SizedBox(width: 10),
            Expanded(
              child: CustomText(
                title,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (selected)
              Icon(
                Icons.check,
                color: context.colorPalette.green00A,
              )
          ],
        ),
      ),
    );
  }
}
