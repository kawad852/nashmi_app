import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class GenderCard extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;
  final void Function() onTap;
  const GenderCard({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: context.mediaQuery.width * 0.5,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected ? context.colorPalette.red018 : context.colorPalette.greyF2F,
            borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
          ),
          child: Row(
            children: [
              CustomSvg(
                icon,
                color: isSelected ? context.colorPalette.white : null,
              ),
              Expanded(
                child: Center(
                  child: CustomText(
                    title,
                    color: isSelected ? context.colorPalette.white : null,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
