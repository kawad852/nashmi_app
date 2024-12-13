import 'package:flutter/material.dart';
import 'package:nashmi_app/models/city/city_model.dart';
import 'package:nashmi_app/models/state/state_model.dart';
import 'package:nashmi_app/providers/location_provider.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';
import 'package:provider/provider.dart';

import 'drop_down_editor.dart';

class AreaSheet extends StatefulWidget {
  const AreaSheet({
    super.key,
  });

  @override
  State<AreaSheet> createState() => _AreaSheetState();
}

class _AreaSheetState extends State<AreaSheet> {
  StateModel? _selectedState;
  CityModel? _selectedCity;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
      builder: (context, provider, child) {
        _selectedState ??= provider.selectedState;
        _selectedCity ??= provider.selectedCity;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(kScreenMargin),
          child: Column(
            children: [
              DropDownEditor(
                value: _selectedState?.id,
                onChanged: (value) {
                  setState(() {
                    _selectedState = provider.states.firstWhere((e) => e.id == value);
                  });
                },
                title: context.appLocalization.state,
                items: provider.states.map((element) {
                  return DropdownMenuItem(
                    value: element.id,
                    child: Text(context.translate(textEN: element.nameEn, textAR: element.nameAr)),
                  );
                }).toList(),
              ),
              if (_selectedState != null)
                DropDownEditor(
                  value: _selectedCity?.id,
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = provider.cities.firstWhere((e) => e.id == value);
                    });
                  },
                  title: context.appLocalization.city,
                  items: provider.cities.where((e) => _selectedState!.cityIds.contains(e.id)).map((element) {
                    return DropdownMenuItem(
                      value: element.id,
                      child: Text(context.translate(textEN: element.nameEn, textAR: element.nameAr)),
                    );
                  }).toList(),
                ),
              StretchedButton(
                child: Text(context.appLocalization.save),
                onPressed: () {
                  provider.setValues(s: _selectedState, c: _selectedCity);

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
