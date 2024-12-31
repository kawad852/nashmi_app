import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

@unfreezed
class CityModel with _$CityModel {
  factory CityModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? nameEn,
    String? nameAr,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);
}

@unfreezed
class LightCityModel with _$LightCityModel {
  factory LightCityModel({
    String? id,
    String? nameEn,
    String? nameAr,
  }) = _LightCityModel;

  factory LightCityModel.fromJson(Map<String, dynamic> json) => _$LightCityModelFromJson(json);
}
