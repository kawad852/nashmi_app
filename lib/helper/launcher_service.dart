import 'dart:io' show Platform;

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/enums.dart';

class LauncherService {
  static Future<void> lunchSocialMedia(
    BuildContext context, {
    required String nativeUrl,
    required String webUrl,
    SocialPlatformEnum? type,
  }) async {
    try {
      final nativeUri = Uri.parse(nativeUrl);
      final webUri = Uri.parse(webUrl);
      final canLaunch = await canLaunchUrl(nativeUri);
      if (kIsWeb) {
        if (canLaunch) {
          await launchUrl(webUri);
        } else {
          throw "Could not launch $webUrl";
        }
        return;
      }
      if (Platform.isAndroid) {
        if (type == SocialPlatformEnum.facebook) {
          final url2 = "fb://facewebmodal/f?href=$nativeUrl";
          final intent2 = AndroidIntent(action: "action_view", data: url2);
          final canWork = await intent2.canResolveActivity();
          if (canWork ?? false) return intent2.launch();
        }
        final intent = AndroidIntent(action: "action_view", data: nativeUrl);
        return intent.launch();
      } else {
        if (canLaunch) {
          await launchUrl(nativeUri, mode: LaunchMode.externalApplication);
        } else {
          await launchUrl(webUri, mode: LaunchMode.externalApplication);
        }
      }
    } catch (e) {
      debugPrint("UrlLauncherError:: $e");
      if (context.mounted) {
        Fluttertoast.showToast(msg: context.appLocalization.generalError);
      }
    }
  }

  /// mobileNum, whatsapp and email
  static Future<void> lunch(BuildContext context, String path) async {
    try {
      final uri = Uri.parse(path);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint("UrlLauncherError:: $e");
      if (context.mounted) {
        Fluttertoast.showToast(msg: context.appLocalization.generalError);
      }
    }
  }

  ///maps
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    final uri = Uri.parse(googleUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not open the map.';
    }
  }
}
