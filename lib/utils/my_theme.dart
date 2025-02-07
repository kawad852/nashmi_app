import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';

const kEditorBottomPadding = 16.0;
const kProductBubbleHeight = 70.0;
const kBarLeadingWith = 110.0;
const kBarCollapsedHeight = 300.0;

class MyTheme {
  static const Color primaryLightColor = Color(0xFF1A73E8);
  static const Color secondaryLightColor = Color(0xFFFFCA28);
  static const Color tertiaryLightColor = Color(0xFF1B3A57);

  static const String fontFamily = "AvenirArabic";

  static const double radiusPrimary = 5;
  static const double radiusSecondary = 10;
  static const double radiusTertiary = 16;

  static bool isLightTheme(BuildContext context) => context.colorScheme.brightness == Brightness.light;

  static InputDecorationTheme inputDecorationTheme(BuildContext context, ColorScheme colorScheme) => InputDecorationTheme(
        filled: true,
        isDense: true,
        fillColor: context.colorPalette.greyEEE,
        hintStyle: TextStyle(
          fontSize: 14,
          color: context.colorPalette.greyBDB,
        ),
        contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: 5, vertical: 10).copyWith(start: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colorPalette.greyECE),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colorPalette.greyECE),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colorPalette.greyECE),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error),
        ),
      );

  ThemeData materialTheme(BuildContext context, ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (BuildContext context) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: colorScheme.onSurface,
              ),
              Text(
                context.appLocalization.back,
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusPrimary),
          ),
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        surfaceTintColor: colorScheme.surface,
        color: colorScheme.surface,
        elevation: 0,
      ),
      inputDecorationTheme: inputDecorationTheme(context, colorScheme),
    );
  }
}
