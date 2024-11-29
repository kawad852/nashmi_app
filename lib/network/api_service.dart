import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../alerts/errors/app_error_feedback.dart';
import '../alerts/loading/app_over_loader.dart';

class ApiService {
  static const String firebaseException = 'firebase-exception';
  static const String authException = 'auth-exception';
  static const String functionsException = 'functions-exception';
  static const String socketException = 'socket-exception';
  static const String timeoutException = 'timeout-exception';
  static const String generalException = 'general-exception';

  static const String offlineMsg = 'FirebaseError: [code=unavailable]: Failed to get document because the client is offline.';

  static Future<T> build<T>({
    required Future<T> Function() callBack,
    bool throwErrorForTesting = false,
  }) async {
    try {
      if (throwErrorForTesting) {
        // throw FirebaseException(plugin: '');
        // throw SocketException('');
        throw TimeoutException('');
        // throw Exception();
      }

      final futureCallback = await callBack().timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw TimeoutException(timeoutException),
      );
      return futureCallback;
    } on FirebaseException catch (e) {
      debugPrint("Exception::\nType:: FirebaseException\nmsg:: ${e.message}\nCode:: ${e.code}");
      throw Failure(type: firebaseException, code: e.code);
    } on SocketException catch (e) {
      debugPrint("Exception::\nType:: SocketException\nmsg:: $e");
      throw Failure(type: socketException, code: e.message);
    } on TimeoutException catch (e) {
      debugPrint("Exception::\nType:: TimeoutException\nmsg:: $e");
      throw Failure(type: timeoutException, code: e.message ?? '');
    } catch (e) {
      debugPrint("Exception::\nType:: GeneralException\nmsg:: $e");
      if (e.toString() == offlineMsg) {
        throw Failure(type: socketException, code: e.toString());
      } else {
        throw Failure(type: generalException, code: e.toString());
      }
    }
  }

  static Future<void> fetch(
    BuildContext context, {
    required Future Function() callBack,
    Function(Failure failure)? onError,
    bool showErrorFeedback = true,
    bool withOverlayLoader = true,
    Widget? indicator,
  }) async {
    Failure? failure;

    try {
      if (withOverlayLoader && !AppOverlayLoader.isShown) {
        AppOverlayLoader.show(indicator: indicator);
      }

      /// Errors Test
      // await Future.delayed(Duration.zero, () {
      // throw FirebaseAuthException(code: '');
      //   // throw FirebaseException(plugin: '');
      // throw TimeoutException('');
      //   // throw SocketException('');
      // throw Exception();
      // });

      ///
      final futureCallback = await callBack()
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw TimeoutException(timeoutException),
      )
          .whenComplete(() {
        if (withOverlayLoader) {
          AppOverlayLoader.hide();
        }
      });
      return futureCallback;
    } on FirebaseAuthException catch (e) {
      debugPrint("Exception::\nType:: FirebaseAuthException\nmsg:: ${e.message}\nCode:: ${e.code}");
      failure = Failure(type: authException, code: e.code);
    } on FirebaseException catch (e) {
      debugPrint("Exception::\nType:: FirebaseException\nmsg:: ${e.message}\nCode:: ${e.code}");
      failure = Failure(type: firebaseException, code: e.code);
    } on SocketException catch (e) {
      debugPrint("Exception::\nType:: SocketException\nmsg:: $e");
      failure = Failure(type: socketException, code: e.message);
    } on TimeoutException catch (e) {
      debugPrint("Exception::\nType:: TimeoutException\nmsg:: $e");
      failure = Failure(type: timeoutException, code: e.message ?? '');
    } catch (e) {
      debugPrint("Exception::\nType:: GeneralException\nmsg:: $e");
      if (e.toString() == offlineMsg) {
        failure = Failure(type: socketException, code: e.toString());
      } else {
        failure = Failure(type: generalException, code: e.toString());
      }
    } finally {
      if (withOverlayLoader && AppOverlayLoader.isShown) {
        AppOverlayLoader.hide();
      }
      if (context.mounted && showErrorFeedback && failure != null) {
        onError == null ? AppErrorFeedback.show(context, failure) : onError(failure);
      }
    }
  }
}

class Failure {
  final String type, code;

  Failure({
    required this.type,
    required this.code,
  });
}
