import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:share_plus/share_plus.dart';

import '../alerts/loading/app_over_loader.dart';
import '../main.dart';
import '../notifications/notifications_route.dart';
import '../utils/app_constants.dart';

class DeepLinkingService {
  static StreamSubscription<Map>? streamSubscription;
  static StreamController<String> controllerData = StreamController<String>();
  static StreamController<String> controllerInitSession = StreamController<String>();

  static void listenDynamicLinks() async {
    streamSubscription = FlutterBranchSdk.listSession().listen(
      (data) async {
        controllerData.sink.add((data.toString()));
        if (data.containsKey('+clicked_branch_link') && data['+clicked_branch_link'] == true) {
          NotificationsRouteHandler.toggle(
            rootNavigatorKey.currentContext!,
            id: data['id'],
            type: data['type'],
            // extra: data,
          );
        }
      },
      onError: (error) {
        debugPrint('DeepLinkingError: ${error.toString()}');
      },
    );
  }

  static Future<String?> generateLink(
    BuildContext context, {
    required BranchUniversalObject buo,
    required BranchLinkProperties lp,
  }) async {
    BranchResponse response = await FlutterBranchSdk.getShortUrl(buo: buo, linkProperties: lp);
    if (response.success) {
      return response.result;
    } else {
      return null;
    }
  }

  static void share(
    BuildContext context, {
    required String id,
    required String type,
    required String title,
    required String description,
    required String imageURL,
    Map<String, dynamic>? extra,
  }) async {
    AppOverlayLoader.fakeLoading();
    final buo = BranchUniversalObject(
      canonicalIdentifier: kBranchIdentifier,
      canonicalUrl: kBranchWebURL,
      title: title,
      contentDescription: description,
      contentMetadata: BranchContentMetaData().addCustomMetadata(
        "og:image",
        "https://firebasestorage.googleapis.com/v0/b/my-masar-be265.appspot.com/o/200x200.jpg?alt=media&token=5f3cc6a7-10ce-453c-90b5-82cc703c0333",
      ),
      imageUrl: imageURL,
      expirationDateInMilliSec: DateTime.now().add(const Duration(days: 365)).millisecondsSinceEpoch,
    );

    final lp = BranchLinkProperties(
      channel: "facebook",
      feature: "sharing",
      campaign: "jobs-campaign",
    )
      ..addControlParam('id', id)
      ..addControlParam('type', type);

    if (extra != null) {
      for (var element in extra.entries) {
        lp.addControlParam(element.key, element.value);
      }
    }

    final link = await generateLink(context, buo: buo, lp: lp);

    Share.share(link!);
  }
}
