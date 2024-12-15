import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nashmi_app/alerts/feedback/app_feedback.dart';
import 'package:nashmi_app/models/favorite/favorite_model.dart';
import 'package:nashmi_app/models/like/like_model.dart';
import 'package:nashmi_app/models/purchase/purchase_model.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/screens/base/app_nav_bar.dart';
import 'package:nashmi_app/screens/registration/create_account_screen.dart';
import 'package:nashmi_app/screens/registration/registration_screen.dart';
import 'package:nashmi_app/screens/registration/verify_code_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/shared_pref.dart';

import '../models/otp_model.dart';
import '../models/user/user_model.dart';
import '../network/api_service.dart';
import '../network/my_collections.dart';
import '../network/my_fields.dart';
import '../utils/app_constants.dart';

class UserProvider extends ChangeNotifier {
  Function()? onGuestRegistration;

  User? get user => _firebaseAuth.currentUser;
  String? get userUid => user?.uid;
  bool get isAuthenticated => user != null && !user!.isAnonymous;
  UserModel get userModel => MySharedPreferences.user!;

  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;
  DocumentReference<UserModel> get userDocRef => _firebaseFirestore.users.doc(userUid);
  CollectionReference<FavoriteModel> get favoritesCollectionRef => userDocRef.collection(MyCollections.favorites).withConverter<FavoriteModel>(
        fromFirestore: (snapshot, _) => FavoriteModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );
  CollectionReference<LikeModel> get likesCollectionRef => userDocRef.collection(MyCollections.likes).withConverter<LikeModel>(
        fromFirestore: (snapshot, _) => LikeModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<PurchaseModel> get purchasesCollectionRef => userDocRef.collection(MyCollections.purchases).withConverter<PurchaseModel>(
        fromFirestore: (snapshot, _) => PurchaseModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  Future<void> register(
    BuildContext context,
    UserCredential auth, {
    required String provider,
    required String? guestRoute,
    String? phoneCountryCode,
    String? displayName,
    String? gender,
    String? phoneNum,
    bool isLogin = false,
  }) async {
    await ApiService.fetch(
      context,
      callBack: () async {
        final user = UserModel();
        user.provider = provider;
        user.id = auth.user?.uid;
        user.gender = gender;
        user.email = auth.user?.email;
        user.phoneCountryCode = phoneCountryCode;
        user.phone = phoneNum ?? auth.user?.phoneNumber;
        user.displayName = displayName ?? auth.user?.displayName;
        user.deviceToken = await _getDeviceToken();
        user.languageCode = MySharedPreferences.language;
        final userDocument = await _firebaseFirestore.users.doc(user.id).get();
        if (!userDocument.exists) {
          user.username = await _getUsername();
          MySharedPreferences.user = user;
          final json = {
            ...user.toJson(),
            ...{
              MyFields.createdAt: FieldValue.serverTimestamp(),
            },
          };
          await FirebaseFirestore.instance.collection(MyCollections.users).doc(user.id).set(json);
          if (isLogin && context.mounted) {
            context.navigate((context) {
              return CreateAccountScreen(
                guestRoute: guestRoute,
                user: user,
              );
            });
            return;
          }
        } else {
          MySharedPreferences.user = userDocument.data()!;
          if (context.mounted && userDocument.data()!.blocked) {
            context.showSnackBar(context.appLocalization.authFailed);
            return;
          }
        }

        notifyListeners();

        if (context.mounted) {
          _handleRoute(context, guestRoute);
        }
      },
    );
  }

  void _handleRoute(BuildContext context, String? guestRoute) {
    if (guestRoute == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          return const AppNavBar();
        }),
        (route) => false,
      );
    } else {
      Navigator.popUntil(
        context,
        (route) => route.settings.name == kLoginRouteName,
      );
      Navigator.pop(context);
    }
  }

  void registerUncompletedUser(
    BuildContext context, {
    required UserModel user,
    required String? guestRoute,
  }) async {
    ApiService.fetch(
      context,
      callBack: () async {
        await FirebaseFirestore.instance.collection(MyCollections.users).doc(user.id).update(user.toJson());
        MySharedPreferences.user = user;
        notifyListeners();
        if (context.mounted) {
          _handleRoute(context, guestRoute);
        }
      },
    );
  }

  Future<String?> _getDeviceToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  void onGuestRoute(Function() callBack) {
    onGuestRegistration = callBack;
  }

  Future<void> updateDeviceToken(BuildContext context) async {
    try {
      final deviceToken = await _getDeviceToken();
      debugPrint("DeviceToken:: $deviceToken");
      if (context.mounted && isAuthenticated) {
        userDocRef.update({
          MyFields.deviceToken: deviceToken,
        });
      }
    } catch (e) {
      debugPrint("DeviceTokenError:: $e");
    }
  }

  Future<void> logout(BuildContext context) async {
    await _firebaseAuth.signOut();
    MySharedPreferences.clearStorage();
    notifyListeners();
    if (context.mounted) {
      context.pushAndRemoveUntil((context) => const RegistrationScreen());
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    ApiService.fetch(
      context,
      callBack: () async {
        await user?.delete();
        if (context.mounted) {
          logout(context);
          context.showSnackBar(context.appLocalization.deleteAccountSuccess);
        }
      },
      onError: (failure) {
        if (failure.code == "requires-recent-login") {
          context.showSnackBar(context.appLocalization.requireRecentLogin);
        } else {
          context.showSnackBar(context.appLocalization.generalError);
        }
      },
    );
  }

  Future<void> sendPinCode(
    BuildContext context, {
    required UserModel user,
    required bool isLogin,
    required String? guestRoute,
  }) async {
    ApiService.fetch(
      context,
      callBack: () async {
        final response = await http.post(
          Uri.parse('https://api.doverifyit.com/api/otp-send/9698951871'),
          headers: {
            'Content-Type': 'application/json',
            "Authorization": "553|qsZhFQf91vSH5eMnmvQCI1oNwrmT01O7PQEgn4gjJSv6d10xSvMVIIeoX2L1",
          },
          body: jsonEncode({
            "contact": "${context.getDialCode(user.phoneCountryCode!)}${user.phone}",
          }),
        );
        final body = OtpModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        // await Future.delayed(const Duration(seconds: 1));
        // var response = http.Response(jsonEncode(OtpModel().toJson()), 200);
        // final body = OtpModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        if (response.statusCode == 200 && context.mounted) {
          context.navigate((context) {
            return VerifyCodeScreen(
              user: user,
              isLogin: isLogin,
              guestRoute: guestRoute,
            );
          });
        } else if (context.mounted) {
          context.showSnackBar(body.message ?? context.appLocalization.generalError);
        }
      },
    );
  }

  Future<String> _getUsername() async {
    var newId = 0;
    final date = DateTime.now();
    final orderIdDocumentRef = _firebaseFirestore.collection(MyCollections.settings).doc(kUserIdDocument);
    await _firebaseFirestore.runTransaction((Transaction transaction) async {
      final snapshot = await transaction.get(orderIdDocumentRef);
      newId = snapshot.data()!['user_id'];
      transaction.update(orderIdDocumentRef, {
        'user_id': FieldValue.increment(1),
      });
    });
    return '${date.year}${date.month}${date.day}$newId';
  }

  void updateProfile(
    BuildContext context, {
    required UserModel user,
  }) {
    ApiService.fetch(
      context,
      callBack: () async {
        await userDocRef.update(user.toJson());
        if (context.mounted) {
          MySharedPreferences.user = user;
          notifyListeners();
          Navigator.pop(context);
          context.showSnackBar(context.appLocalization.successfullyUpdated);
        }
      },
    );
  }

  void handleGuest(
    BuildContext context, {
    required VoidCallback action,
  }) {
    if (isAuthenticated) {
      action();
    } else {
      context.navigate(
        (context) {
          return const RegistrationScreen(
            guestRoute: kLoginRouteName,
            showGuestButton: false,
          );
        },
        name: kLoginRouteName,
        fullscreenDialog: true,
      ).then((value) {
        if (isAuthenticated) {
          action();
        }
      });
    }
  }
}
