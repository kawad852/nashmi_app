import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/shared_pref.dart';

class UserProvider extends ChangeNotifier {
  void logout(BuildContext context) {
    MySharedPreferences.clearStorage();
    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return const LoginScreen();
    //     },
    //   ),
    //   (route) => false,
    // );
  }
}
