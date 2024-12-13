import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/provider/provider_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';

import '../utils/enums.dart';

class NotificationsRouteHandler {
  static void toggle(
    BuildContext context, {
    required String? id,
    required String? type,
  }) {
    try {
      if (id == null) return;
      switch (type) {
        case NotificationsType.provider:
          context.navigate((context) => ProviderScreen(
                provider: null,
                id: id,
              ));
        case NotificationsType.category:
          // context.navigate((context) => CategoriesScreen());
          break;
        default:
          break;
      }
    } catch (e) {
      debugPrint("RouteError:: $e");
    }
  }
}
