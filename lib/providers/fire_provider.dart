import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/network/fire_queries.dart';

import '../network/my_fields.dart';

class FireProvider extends ChangeNotifier {
  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;

  Query<CategoryModel> get mainCategoriesQuery => _firebaseFirestore.categories
      .where(MyFields.published, isEqualTo: true)
      .where(MyFields.mainCategory, isEqualTo: true)
      .orderBy(MyFields.order, descending: false)
      .orderBy(MyFields.createdAt, descending: true);
}
