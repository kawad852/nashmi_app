import 'dart:convert';

import 'package:nashmi_app/models/country_code_model.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppProvider extends ChangeNotifier {
  Locale appLocale = Locale(MySharedPreferences.language);
  String appTheme = MySharedPreferences.theme;
  static String countryCode = MySharedPreferences.countryCode;

  void setLanguage(
    BuildContext context, {
    required String languageCode,
  }) async {
    MySharedPreferences.language = languageCode;
    appLocale = Locale(languageCode);
    notifyListeners();
  }

  void setTheme(
    BuildContext context, {
    required String theme,
  }) async {
    MySharedPreferences.theme = theme;
    appTheme = theme;
    notifyListeners();
  }

  static Future<void> getCountryCode() async {
    try {
      final response = await http.get(Uri.https('api.country.is'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        final countryCodeModel = CountryCodeModel.fromJson(body);
        countryCode = countryCodeModel.countryCode ?? kFallBackCountryCode;
        MySharedPreferences.countryCode = countryCode;
      } else {
        countryCode = kFallBackCountryCode;
      }
    } catch (e) {
      countryCode = kFallBackCountryCode;
    } finally {
      debugPrint('countryCode:: $countryCode');
    }
  }
}
