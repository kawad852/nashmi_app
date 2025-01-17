import 'package:flutter/material.dart';
import 'package:nashmi_app/models/countries_model.dart';

import '../utils/app_constants.dart';
import '../utils/base_extensions.dart';
import '../utils/countries.dart';

class PhoneController extends ChangeNotifier {
  String? countryCode;
  String? phoneNum;

  String get getPhoneNumber => _parseArabic(phoneNum!);

  String _parseArabic(String str) {
    if (str.startsWith('0')) {
      str.replaceFirst('0', '');
    }
    var result = str.replaceAllMapped(
      RegExp('[٠١٢٣٤٥٦٧٨٩۰۱۲۳۴۵۶۷۸۹]'),
      (match) {
        final charCode = match.group(0)!.codeUnitAt(0);
        if (charCode >= 1776 && charCode <= 1785) {
          return (charCode - 1776).toString();
        } else if (charCode >= 1632 && charCode <= 1641) {
          return (charCode - 1632).toString();
        } else {
          return match.group(0)!;
        }
      },
    );
    if (result[0] == '0' || result[0] == '۰') {
      result = result.substring(1);
    }
    return result;
  }

  PhoneController(
    BuildContext context, {
    String? countryCode,
    String? phoneNum,
  }) {
    _init(context, countryCode: countryCode, phoneNum: phoneNum);
  }

  void _init(
    BuildContext context, {
    required String? countryCode,
    required String? phoneNum,
  }) {
    this.countryCode = countryCode ?? context.countryCode ?? kFallBackCountryCode;
    this.phoneNum = phoneNum;
  }

  String getDialCode() => kCountries.singleWhere((element) => element.code == countryCode, orElse: () => CountryModel(code: kFallBackCountryCode)).dialCode!;
}
