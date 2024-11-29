import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';

class FPLoading extends StatelessWidget {
  const FPLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: context.loaders.circular(isSmall: true),
    );
  }
}
