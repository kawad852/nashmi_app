import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const ShimmerLoading({
    Key? key,
    required this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.surfaceVariant,
      highlightColor: context.colorScheme.onInverseSurface,
      child: child,
    );
  }
}
