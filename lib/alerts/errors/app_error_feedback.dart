import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/feedback/app_feedback.dart';
import 'package:nashmi_app/utils/base_extensions.dart';

import '../../network/api_service.dart';

class AppErrorFeedback {
  //auth
  static const String invalidVerificationCode = 'invalid-verification-code';
  static const String invalidPhoneNumber = 'invalid-phone-number';
  static const String requireRecentLogIn = 'requires-recent-login';
  static const String tooManyRequests = 'too-many-requests';
  static const String webCanceled = 'web-context-cancelled';

  //network
  static const String networkRequestFailed = 'network-request-failed';
  static const String timeOutException = 'timeout_exception';
  static const String requestTimeOut = 'request-timeout';

  //general
  static const String generalError = 'general-error';

  static void show(
    BuildContext context,
    Failure failure, {
    Function()? onGeneralError,
    Function()? onInternetError,
    Function()? onServerError,
  }) {
    switch (failure.code) {
      /// network exception
      case networkRequestFailed:
      case requestTimeOut:
      case timeOutException:
        context.showSnackBar(context.appLocalization.networkError);

      ///Exception type
      default:
        switch (failure.type) {
          case ApiService.authException:
            context.showSnackBar(context.appLocalization.invalidCredentials);
          case ApiService.firebaseException:
            onServerError == null ? context.showSnackBar(context.appLocalization.generalError) : onServerError();
          case ApiService.timeoutException:
          case ApiService.socketException:
            onInternetError == null ? context.showSnackBar(context.appLocalization.networkError) : onInternetError();
          default:
            onGeneralError == null ? context.showSnackBar(context.appLocalization.generalError) : onGeneralError();
        }
    }
  }
}
