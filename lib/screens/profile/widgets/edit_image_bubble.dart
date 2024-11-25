import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_text.dart';

class EditImageBubble extends StatelessWidget {
  final void Function() onTap;
  const EditImageBubble({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 19,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.colorPalette.black1D,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(MyTheme.radiusSecondary),
            bottomRight: Radius.circular(MyTheme.radiusSecondary),
          ),
        ),
        child: CustomText(
          context.appLocalization.editImage,
          fontSize: 12,
          color: context.colorPalette.white,
        ),
      ),
    );
  }
}
