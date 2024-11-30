import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nashmi_app/models/provider/provider_model.dart';
import 'package:nashmi_app/models/tag/tag_model.dart';

import '../models/category/category_model.dart';
import 'my_collections.dart';

extension FireQueries on FirebaseFirestore {
  CollectionReference<CategoryModel> get categories => collection(MyCollections.categories).withConverter<CategoryModel>(
        fromFirestore: (snapshot, _) => CategoryModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<ProviderModel> get providers => collection(MyCollections.providers).withConverter<ProviderModel>(
        fromFirestore: (snapshot, _) => ProviderModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<TagModel> get tags => collection(MyCollections.tags).withConverter<TagModel>(
        fromFirestore: (snapshot, _) => TagModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );
}
