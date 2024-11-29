import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/providers/app_provider.dart';
import 'package:nashmi_app/screens/home/home_screen.dart';
import 'package:nashmi_app/screens/intro/intro_screen.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/utils/shared_pref.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

// mhyar

final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "Main Navigator");

@pragma('vm:entry-point')
Future<void> onBackgroundMessage(RemoteMessage message) async {
  final data = message.notification;
  log("ReceivedNotification::\nType::onBackgroundMessage\nTitle:: ${data?.title}\nBody:: ${data?.body}\nData::${message.data}");
}

// before merge

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //MySharedPreferences.clearStorage();
  // MySharedPreferences.isPassedIntro = false;
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _toggleRoute(BuildContext context) {
    return const IntroScreen();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        final isLight = appProvider.appTheme == ThemeEnum.light;
        var seedColorScheme = ColorScheme.fromSeed(
          seedColor: const Color(0xFFC2E7D6),
          brightness: isLight ? Brightness.light : Brightness.dark,
        );
        return MultiProvider(
          providers: [
            StreamProvider<List<CategoryModel>>.value(
              value: FirebaseFirestore.instance.categories.snapshots().map((event) => event.docs.map((e) => e.data()).toList()),
              initialData: const [],
              updateShouldNotify: (initialValue, value) {
                return true;
              },
            ),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(appProvider.appLocale.languageCode),
            theme: MyTheme().materialTheme(context, seedColorScheme),
            // home: _toggleRoute(context),
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}
