import 'package:flutter/material.dart';

import '../../../utils/base_extensions.dart';
import '../../../utils/my_theme.dart';

class DropDownEditor<T> extends StatelessWidget {
  final T value;
  final Function(T?) onChanged;
  final String title;
  final List<DropdownMenuItem<T>> items;
  final bool enabled;
  final bool required;

  const DropDownEditor({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.items,
    this.enabled = true,
    this.required = true,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.only(bottom: kEditorBottomPadding),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: DropdownButtonFormField<T>(
            onChanged: onChanged,
            value: value,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              label: Text(title),
              enabled: enabled,
              // label: EditorLabel(
              //   title: title,
              //   withErrorIndicator: true,
              // ),
            ),
            validator: required
                ? (value) {
                    if (value == null) {
                      return context.appLocalization.requiredField;
                    }
                    return null;
                  }
                : null,
            items: items,
          ),
        ),
      ),
    );
  }
}
