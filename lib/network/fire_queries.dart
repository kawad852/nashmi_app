import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category/category_model.dart';
import 'my_collections.dart';

extension FireQueries on FirebaseFirestore {
  CollectionReference<CategoryModel> get categories => collection(MyCollections.categories).withConverter<CategoryModel>(
        fromFirestore: (snapshot, _) => CategoryModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );
}
