import 'dart:convert';

import 'package:nashmi_app/models/auth_model.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static late SharedPreferences _sharedPreferences;

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void clearStorage() {
    accessToken = '';
    user = null;
  }

  static UserData? get user {
    String? value = _sharedPreferences.getString('user');
    UserData? user;
    if (value != null && value.isNotEmpty && value != 'null') {
      user = UserData.fromJson(jsonDecode(value));
    }
    return user;
  }

  static set user(UserData? value) {
    _sharedPreferences.setString('user', jsonEncode(value?.toJson()));
  }

  static String get language => _sharedPreferences.getString('language') ?? LanguageEnum.arabic;
  static set language(String value) => _sharedPreferences.setString('language', value);

  static String get accessToken => _sharedPreferences.getString('accessToken') ?? "";
  static set accessToken(String value) => _sharedPreferences.setString('accessToken', value);

  static String get theme => _sharedPreferences.getString('theme') ?? ThemeEnum.light;
  static set theme(String value) => _sharedPreferences.setString('theme', value);

  static String get countryCode => _sharedPreferences.getString('countryCode') ?? kFallBackCountryCode;
  static set countryCode(String value) => _sharedPreferences.setString('countryCode', value);

  static bool get passedIntro => _sharedPreferences.getBool('passedIntro') ?? false;
  static set passedIntro(bool value) => _sharedPreferences.setBool('passedIntro', value);
}
