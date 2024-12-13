import 'package:flutter/material.dart';

import '../../../utils/base_extensions.dart';

class EditorLabel extends StatelessWidget {
  final String title;
  final bool required;
  final bool withErrorIndicator;

  const EditorLabel({
    super.key,
    required this.title,
    this.required = true,
    this.withErrorIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
        ),
        if (required && withErrorIndicator)
          Text(
            '*',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.error,
            ),
          ),
      ],
    );
  }
}
