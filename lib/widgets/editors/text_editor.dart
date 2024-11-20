import 'package:flutter/material.dart';
import 'package:nashmi_app/helper/validation_helper.dart';
import 'package:nashmi_app/widgets/editors/base_editor.dart';

class TextEditor extends StatefulWidget {
  final String? initialValue;
  final Function(String?) onChanged;
  final bool required;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? filled;
  final Color? fillColor;
  final InputBorder? enabledBorder;

  const TextEditor({
    super.key,
    required this.initialValue,
    required this.onChanged,
    this.required = true,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText, 
    this.keyboardType, 
    this.maxLines,
    this.enabledBorder,
    this.fillColor,
    this.filled,
  });

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BaseEditor(
      initialValue: widget.initialValue,
      required: widget.required,
      enabledBorder: widget.enabledBorder,
      suffixIcon: widget.suffixIcon,
      prefixIcon: widget.prefixIcon,
      hintText: widget.hintText,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      fillColor: widget.fillColor,
      filled: widget.filled,
      onChanged: (value) {
        if (value.isEmpty) {
          widget.onChanged(null);
        } else {
          widget.onChanged(value);
        }
      },
      validator: (value) {
        if (!widget.required && (value == null || value.isEmpty)) {
          return null;
        }
        return ValidationHelper.general(context, value);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
