import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/errors/app_error_widget.dart';
import 'package:nashmi_app/models/city/city_model.dart';
import 'package:nashmi_app/models/state/state_model.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/widgets/stretch_button.dart';

import 'custom_future_builder.dart';
import 'drop_down_editor.dart';

class AreaSheet extends StatefulWidget {
  final StateModel? state;
  final CityModel? city;

  const AreaSheet({
    super.key,
    required this.state,
    required this.city,
  });

  @override
  State<AreaSheet> createState() => _AreaSheetState();
}

class _AreaSheetState extends State<AreaSheet> with AutomaticKeepAliveClientMixin {
  StateModel? _selectedState;
  CityModel? _selectedCity;

  late Future<List<dynamic>> _futures;

  void _initialize() {
    _futures = ApiService.build(
      callBack: () async {
        final statesFuture = FirebaseFirestore.instance.states.get().then((value) => value.docs.map((e) => e.data()).toList());
        final citiesFuture = FirebaseFirestore.instance.cities.get().then((value) => value.docs.map((e) => e.data()).toList());
        return Future.wait([statesFuture, citiesFuture]);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
    _selectedState = widget.state;
    _selectedCity = widget.city;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomFutureBuilder(
        future: _futures,
        onComplete: (context, snapshot) {
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
                if (_selectedState != null)
                  DropDownEditor(
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
                    Navigator.pop(context, (_selectedState, _selectedCity));
                  },
                ),
              ],
            ),
          );
        },
        onError: (error) {
          return AppErrorWidget(
            error: error,
            onRetry: () {
              setState(() {
                _initialize();
              });
            },
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
