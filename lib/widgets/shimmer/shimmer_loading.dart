import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/base_extensions.dart';
import '../../utils/my_theme.dart';

class ShimmerLoading extends StatelessWidget {
  final Widget Function(
      BuildContext context,
      Widget Function({
        double? radius,
        double? height,
        double? width,
        EdgeInsetsGeometry? margin,
        EdgeInsetsGeometry? padding,
      }) bubble) builder;

  const ShimmerLoading({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorPalette.greyF2F,
      highlightColor: context.colorPalette.greyF9F,
      child: builder(
        context,
        ({radius, height, width, margin, padding}) {
          return Container(
            margin: margin,
            padding: padding,
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(radius ?? MyTheme.radiusSecondary),
            ),
          );
        },
      ),
    );
  }
}
