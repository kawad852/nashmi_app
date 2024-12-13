import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nashmi_app/models/offer_settings/offer_settings_model.dart';
import 'package:nashmi_app/network/my_collections.dart';
import 'package:nashmi_app/providers/app_provider.dart';
import 'package:nashmi_app/providers/fire_provider.dart';
import 'package:nashmi_app/providers/location_provider.dart';
import 'package:nashmi_app/providers/user_provider.dart';
import 'package:nashmi_app/screens/base/app_nav_bar.dart';
import 'package:nashmi_app/screens/intro/intro_screen.dart';
import 'package:nashmi_app/screens/registration/registration_screen.dart';
import 'package:nashmi_app/utils/app_constants.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/utils/shared_pref.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'models/user/user_model.dart';

// mhyar

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey(debugLabel: "Main Navigator");

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
  // MySharedPreferences.clearStorage();
  // await FirebaseAuth.instance.signOut();
  // MySharedPreferences.isPassedIntro = false;
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => FireProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
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
  UserProvider get _userProvider => context.userProvider;

  Widget _toggleRoute(BuildContext context) {
    if (_userProvider.isAuthenticated) {
      return const AppNavBar();
    } else if (MySharedPreferences.passedIntro) {
      return const RegistrationScreen();
    } else {
      return const IntroScreen();
    }
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
          seedColor: const Color(0xFFB31018),
          surface: Colors.white,
          brightness: isLight ? Brightness.light : Brightness.dark,
        );
        return MultiProvider(
          providers: [
            StreamProvider<UserModel?>.value(
              key: ValueKey(_userProvider.isAuthenticated),
              value: _userProvider.isAuthenticated ? _userProvider.userDocRef.snapshots().map((event) => event.data()) : null,
              initialData: MySharedPreferences.user,
              lazy: false,
              updateShouldNotify: (initialValue, value) {
                MySharedPreferences.user = value;
                Future.microtask(() {
                  if (value == null || value.blocked) {
                    Fluttertoast.showToast(msg: "Authorization Failed");
                    // ignore: use_build_context_synchronously
                    _userProvider.logout(rootNavigatorKey.currentContext!);
                  }
                });
                return true;
              },
            ),
            // StreamProvider<List<CategoryModel>>.value(
            //   value: FirebaseFirestore.instance.categories.snapshots().map((event) => event.docs.map((e) => e.data()).toList()),
            //   initialData: const [],
            //   updateShouldNotify: (initialValue, value) {
            //     return true;
            //   },
            // ),
            StreamProvider<OfferSettingsModel?>.value(
              value: FirebaseFirestore.instance
                  .collection(MyCollections.settings)
                  .withConverter<OfferSettingsModel>(
                    fromFirestore: (snapshot, _) => OfferSettingsModel.fromJson(snapshot.data()!),
                    toFirestore: (snapshot, _) => snapshot.toJson(),
                  )
                  .doc(kOfferDocument)
                  .snapshots()
                  .map((e) => e.data()),
              initialData: null,
              updateShouldNotify: (initialValue, value) {
                return true;
              },
            ),
          ],
          child: MaterialApp(
            navigatorKey: rootNavigatorKey,
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(appProvider.appLocale.languageCode),
            theme: MyTheme().materialTheme(context, seedColorScheme),
            home: _toggleRoute(context),
            // home: const AppNavBar(),
          ),
        );
      },
    );
  }
}
