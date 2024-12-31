import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/errors/app_error_widget.dart';
import 'package:nashmi_app/models/city/city_model.dart';
import 'package:nashmi_app/models/state/state_model.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/providers/location_provider.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/custom_future_builder.dart';
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
  late Future<List<dynamic>> _futures;
  StateModel? _selectedState;
  CityModel? _selectedCity;

  LocationProvider get _locationProvider => context.locationProvider;

  void _init() {
    _futures = ApiService.build(
      callBack: () async {
        late Future<List<StateModel>> statesFuture;
        late Future<List<CityModel>> citiesFuture;
        if (_locationProvider.states.isNotEmpty) {
          statesFuture = Future.value(_locationProvider.states);
        } else {
          statesFuture = FirebaseFirestore.instance.states.get().then((value) {
            final states = value.docs.map((e) => e.data()).toList();
            _locationProvider.states = states;
            return states;
          });
        }

        if (_locationProvider.cities.isNotEmpty) {
          citiesFuture = Future.value(_locationProvider.cities);
        } else {
          citiesFuture = FirebaseFirestore.instance.cities.get().then((value) {
            final cities = value.docs.map((e) => e.data()).toList();
            _locationProvider.cities = cities;
            return cities;
          });
        }

        return Future.wait([statesFuture, citiesFuture]);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedState = _locationProvider.selectedState;
    _selectedCity = _locationProvider.selectedCity;
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
        future: _futures,
        onComplete: (context, snapshot) {
          return Consumer<LocationProvider>(
            builder: (context, provider, child) {
              final states = snapshot.data![0] as List<StateModel>;
              final cities = snapshot.data![1] as List<CityModel>;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(kScreenMargin),
                child: Column(
                  children: [
                    DropDownEditor(
                      value: _selectedState?.id,
                      onChanged: (value) {
                        setState(() {
                          _selectedCity = null;
                          _selectedState = states.firstWhere((e) => e.id == value);
                        });
                      },
                      title: context.appLocalization.state,
                      items: states.map((element) {
                        return DropdownMenuItem(
                          value: element.id,
                          child: Text(context.translate(textEN: element.nameEn, textAR: element.nameAr)),
                        );
                      }).toList(),
                    ),
                    if (_selectedState != null && _selectedState!.cityIds.isNotEmpty)
                      DropDownEditor(
                        key: ValueKey(_selectedState?.id),
                        value: _selectedCity?.id,
                        onChanged: (value) {
                          setState(() {
                            _selectedCity = cities.firstWhere((e) => e.id == value);
                          });
                        },
                        title: context.appLocalization.city,
                        items: cities.where((e) => _selectedState!.cityIds.contains(e.id)).map((element) {
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
        },
        onError: (error) {
          return AppErrorWidget(
            error: error,
            onRetry: () {
              setState(() {
                _init();
              });
            },
          );
        });
  }
}
