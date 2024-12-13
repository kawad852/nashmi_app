import 'package:flutter/material.dart';
import 'package:nashmi_app/controllers/phone_controller.dart';
import 'package:nashmi_app/helper/validation_helper.dart';
import 'package:nashmi_app/models/countries_model.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/widgets/countries_bottomsheet.dart';
import 'package:nashmi_app/widgets/editors/base_editor.dart';

class PhoneField extends StatefulWidget {
  final PhoneController controller;
  final bool required;
  final bool readOnly;

  const PhoneField({
    super.key,
    required this.controller,
    this.required = true,
    this.readOnly = false,
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  late PhoneController _controller;

  void _showCountriesSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (BuildContext context) {
        return const CountriesBottomSheet();
      },
    ).then((value) {
      if (value != null) {
        final countryModel = value as CountryModel;
        setState(() {
          _controller.countryCode = countryModel.code;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BaseEditor(
        initialValue: _controller.phoneNum,
        textDirection: TextDirection.ltr,
        onChanged: (value) {
          if (value.isEmpty) {
            _controller.phoneNum = null;
          } else {
            _controller.phoneNum = value;
          }
        },
        hintText: context.appLocalization.phoneNum,
        keyboardType: TextInputType.phone,
        required: widget.required,
        readOnly: widget.readOnly,
        validator: (value) {
          if (!widget.required && (value == null || value.isEmpty)) {
            return null;
          }
          return ValidationHelper.general(context, value);
        },
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: TextButton.icon(
            onPressed: () {
              if (!widget.readOnly) {
                _showCountriesSheet(context);
              }
            },
            label: Text(_controller.getDialCode()),
            icon: const Icon(Icons.arrow_drop_down_rounded),
          ),
        ),
      ),
    );
  }
}
