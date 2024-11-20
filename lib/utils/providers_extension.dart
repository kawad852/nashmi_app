import 'package:nashmi_app/providers/app_provider.dart';
import 'package:nashmi_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension ProvidersExtension on BuildContext {
  AppProvider get appProvider => read<AppProvider>();
  UserProvider get userProvider => read<UserProvider>();
}
