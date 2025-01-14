import 'dart:convert';

import 'package:nashmi_app/models/city/city_model.dart';
import 'package:nashmi_app/models/state/state_model.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user/user_model.dart';

class MySharedPreferences {
  static late SharedPreferences _sharedPreferences;

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void clearStorage() {
    accessToken = '';
    user = null;
  }

  static UserModel? get user {
    String? value = _sharedPreferences.getString('user');
    UserModel? userModel;
    if (value != null && value.isNotEmpty && value != 'null') {
      userModel = UserModel.fromJson(jsonDecode(value));
    }
    return userModel;
  }

  static set user(UserModel? value) {
    value?.createdAt = null;
    _sharedPreferences.setString('user', jsonEncode(value?.toJson()));
  }

  static StateModel? get selectedState {
    String? value = _sharedPreferences.getString('selectedState');
    StateModel? model;
    if (value != null && value.isNotEmpty && value != 'null') {
      model = StateModel.fromJson(jsonDecode(value));
    }
    return model;
  }

  static set selectedState(StateModel? value) {
    value?.createdAt = null;
    _sharedPreferences.setString('selectedState', jsonEncode(value?.toJson()));
  }

  static CityModel? get selectedCity {
    String? value = _sharedPreferences.getString('selectedCity');
    CityModel? model;
    if (value != null && value.isNotEmpty && value != 'null') {
      model = CityModel.fromJson(jsonDecode(value));
    }
    return model;
  }

  static set selectedCity(CityModel? value) {
    value?.createdAt = null;
    _sharedPreferences.setString('selectedCity', jsonEncode(value?.toJson()));
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
