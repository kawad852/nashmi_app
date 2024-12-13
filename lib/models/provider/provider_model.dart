import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';
import '../../utils/app_constants.dart';
import '../city/city_model.dart';
import '../geo/geo_model.dart';
import '../state/state_model.dart';

part 'provider_model.freezed.dart';
part 'provider_model.g.dart';

@unfreezed
class ProviderModel with _$ProviderModel {
  factory ProviderModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? nameEn,
    String? nameAr,
    String? descriptionEn,
    String? descriptionAr,
    @Default('ACTIVE') String status,
    String? thumbnail,
    StateModel? state,
    CityModel? city,
    String? addressEn,
    String? addressAr,
    String? facebookURL,
    String? instagramUsername,
    @Default(0) double avgRating,
    @Default(0) int ratingsCount,
    @Default(0) int likesCount,
    @Default(0) int totalViews,
    @Default(kOrder) int order,
    @Default(kFallBackCountryCode) String personalPhoneCountryCode,
    String? personalPhoneNum,
    @Default(kFallBackCountryCode) String providerPhoneCountryCode,
    String? providerPhoneNum,
    @Default(kFallBackCountryCode) String whatsAppNumberCountryCode,
    String? whatsAppNumber,
    @Default(false) bool isVerified,
    List<String>? images,
    @Default([]) List<String> categoryIds,
    @Default([]) List<String> mainCategoryIds,
    @Default([]) List<String> subCategoryIds,
    List<String>? tagIds,
    GeoModel? geo,
  }) = _ProviderModel;

  factory ProviderModel.fromJson(Map<String, dynamic> json) => _$ProviderModelFromJson(json);
}

@unfreezed
class LightProviderModel with _$LightProviderModel {
  factory LightProviderModel({
    String? id,
    String? nameEn,
    String? nameAr,
    String? thumbnail,
    @Default([]) List<String> categoryIds,
    @Default(false) bool isVerified,
  }) = _LightProviderModel;

  factory LightProviderModel.fromJson(Map<String, dynamic> json) => _$LightProviderModelFromJson(json);
}
