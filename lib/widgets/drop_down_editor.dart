import 'package:flutter/material.dart';

import '../../../utils/base_extensions.dart';
import '../../../utils/my_theme.dart';

class DropDownEditor<T> extends StatelessWidget {
  final T value;
  final Function(T?) onChanged;
  final String title;
  final List<DropdownMenuItem<T>> items;

  const DropDownEditor({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.only(bottom: kEditorBottomPadding),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: DropdownButtonFormField(
            onChanged: onChanged,
            value: value,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              label: Text(title),
              // label: EditorLabel(
              //   title: title,
              //   withErrorIndicator: true,
              // ),
            ),
            validator: (value) {
              if (value == null) {
                return context.appLocalization.requiredField;
              }
              return null;
            },
            items: items,
          ),
        ),
      ),
    );
  }
}
