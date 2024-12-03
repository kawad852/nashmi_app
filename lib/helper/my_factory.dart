import 'package:uuid/uuid.dart';

class MyFactory {
  static String get isoDate => DateTime.now().toIso8601String();
  static DateTime get dateTime => DateTime.now();
  static String get generateId => const Uuid().v1().replaceAll('-', '').toUpperCase();
}
