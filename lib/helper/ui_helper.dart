import 'package:flutter/cupertino.dart';
import 'package:nashmi_app/models/countries_model.dart';

import '../../utils/countries.dart';

class UiHelper {
  static String getFlag(String code) => 'assets/flags/${code.toLowerCase()}.svg';
  static CountryModel getCountry(String code) => kCountries.firstWhere((element) => element.code == code);

  static String formatDuration(BuildContext context, DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;

    List<String> parts = [];
    if (days > 0) parts.add('$days');
    if (hours > 0) parts.add('$hours');
    if (minutes > 0) parts.add('$minutes');
    if (seconds > 0) parts.add('$seconds');

    return parts.join(':');
  }
}
