import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/geo_point_serializer.dart';

part 'geo_model.freezed.dart';
part 'geo_model.g.dart';

@unfreezed
class GeoModel with _$GeoModel {
  factory GeoModel({
    @JsonKey(name: "geohash") @Default('') String geoHash,
    @JsonKey(name: "geopoint") @GeoPointSerializer() GeoPoint? geoPoint,
  }) = _GeoModel;

  factory GeoModel.fromJson(Map<String, dynamic> json) => _$GeoModelFromJson(json);
}
