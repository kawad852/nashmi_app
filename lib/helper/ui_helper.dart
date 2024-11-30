import 'package:nashmi_app/models/countries_model.dart';

import '../../utils/countries.dart';

class UiHelper {
  static String getFlag(String code) => 'assets/flags/${code.toLowerCase()}.svg';
  static CountryModel getCountry(String code) => kCountries.firstWhere((element) => element.code == code);
}
