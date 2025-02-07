import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nashmi_app/models/contact/contact_model.dart';
import 'package:nashmi_app/models/offer/offer_model.dart';
import 'package:nashmi_app/models/provider/provider_model.dart';
import 'package:nashmi_app/models/tag/tag_model.dart';

import '../models/ad/ad_model.dart';
import '../models/category/category_model.dart';
import '../models/city/city_model.dart';
import '../models/policy/policy_model.dart';
import '../models/sponsor/sponsor_model.dart';
import '../models/state/state_model.dart';
import '../models/user/user_model.dart';
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

  CollectionReference<AdModel> get ads => collection(MyCollections.ads).withConverter<AdModel>(
        fromFirestore: (snapshot, _) => AdModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<SponsorModel> get sponsors => collection(MyCollections.sponsors).withConverter<SponsorModel>(
        fromFirestore: (snapshot, _) => SponsorModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<UserModel> get users => collection(MyCollections.users).withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<PolicyModel> get policies => collection(MyCollections.policies).withConverter<PolicyModel>(
        fromFirestore: (snapshot, _) => PolicyModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<OfferModel> get offers => collection(MyCollections.offers).withConverter<OfferModel>(
        fromFirestore: (snapshot, _) => OfferModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<StateModel> get states => collection(MyCollections.states).withConverter<StateModel>(
        fromFirestore: (snapshot, _) => StateModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<CityModel> get cities => collection(MyCollections.cities).withConverter<CityModel>(
        fromFirestore: (snapshot, _) => CityModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  // CollectionReference<LightStateModel> get lightStates => collection(MyCollections.states).withConverter<LightStateModel>(
  //       fromFirestore: (snapshot, _) => LightStateModel.fromJson(snapshot.data()!),
  //       toFirestore: (snapshot, _) => snapshot.toJson(),
  //     );
  //
  // CollectionReference<LightCityModel> get lightCities => collection(MyCollections.cities).withConverter<LightCityModel>(
  //       fromFirestore: (snapshot, _) => LightCityModel.fromJson(snapshot.data()!),
  //       toFirestore: (snapshot, _) => snapshot.toJson(),
  //     );

  CollectionReference<ContactModel> get providerRequests => collection(MyCollections.providerRequests).withConverter<ContactModel>(
        fromFirestore: (snapshot, _) => ContactModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );
}
