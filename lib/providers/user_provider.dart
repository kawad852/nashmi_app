import 'package:nashmi_app/models/auth_model.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/network/api_url.dart';
import 'package:nashmi_app/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserData? user;

  void initUser() {
    user = MySharedPreferences.user;
  }

  void updateUser(
    UserData data, {
    bool notify = true,
  }) {
    MySharedPreferences.user = data;
    user = data;
    if (notify) {
      notifyListeners();
    }
  }

  void fetchUser(BuildContext context) {
    ApiFutureBuilder.fetch(
      context,
      withOverlayLoader: false,
      future: () async {
        final userFuture = ApiService.build(
          url: ApiUrl.userInfo,
          apiType: ApiType.post,
          builder: AuthModel.fromJson,
        );
        return userFuture;
      },
      onComplete: (snapshot) {
        //
      },
    );
  }

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
