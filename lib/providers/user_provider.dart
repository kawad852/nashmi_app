import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/shared_pref.dart';

class UserProvider extends ChangeNotifier {
  User? get user => _firebaseAuth.currentUser;
  String? get userUid => user?.uid;
  bool get isAuthenticated => user != null && !user!.isAnonymous && user!.emailVerified;

  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

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
