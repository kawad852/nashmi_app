import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_theme.dart';

class StretchedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry alignment;
  final Color? backgroundColor;

  const StretchedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.margin,
    this.alignment = Alignment.center,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Align(
        alignment: alignment,
        child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            minimumSize: const Size(600, 48),
            backgroundColor: backgroundColor ?? context.colorPalette.black1D,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
