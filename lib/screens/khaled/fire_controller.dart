import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireController<T> extends ChangeNotifier {
  FireController(
    BuildContext context, {
    required Future<T> Function(FirebaseFirestore instance) futures,
  }) {
    builder = futures;
    _init();
  }

  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;
  late Future<T> Function(FirebaseFirestore instance) builder;

  late Future<T> futures;
  bool forceRefresh = false;

  void _init() {
    this.futures = builder(_firebaseFirestore);
    notifyListeners();
  }

  void refresh({
    bool force = false,
  }) {
    if (force) {
      forceRefresh = true;
    }
    _init();
    // notifyListeners();
    if (force) {
      forceRefresh = false;
    }
  }
}
