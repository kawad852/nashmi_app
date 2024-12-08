// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProviderModelImpl _$$ProviderModelImplFromJson(Map<String, dynamic> json) =>
    _$ProviderModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      descriptionEn: json['descriptionEn'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
      status: json['status'] as String? ?? 'ACTIVE',
      thumbnail: json['thumbnail'] as String?,
      state: json['state'] == null
          ? null
          : StateModel.fromJson(json['state'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      addressEn: json['addressEn'] as String?,
      addressAr: json['addressAr'] as String?,
      facebookURL: json['facebookURL'] as String?,
      instagramUsername: json['instagramUsername'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      avgRating: (json['avgRating'] as num?)?.toDouble() ?? 0,
      ratingsCount: (json['ratingsCount'] as num?)?.toInt() ?? 0,
      likesCount: (json['likesCount'] as num?)?.toInt() ?? 0,
      order: (json['order'] as num?)?.toInt() ?? kOrder,
      personalPhoneCountryCode:
          json['personalPhoneCountryCode'] as String? ?? kFallBackCountryCode,
      personalPhoneNum: json['personalPhoneNum'] as String?,
      providerPhoneCountryCode:
          json['providerPhoneCountryCode'] as String? ?? kFallBackCountryCode,
      providerPhoneNum: json['providerPhoneNum'] as String?,
      whatsAppNumberCountryCode:
          json['whatsAppNumberCountryCode'] as String? ?? kFallBackCountryCode,
      whatsAppNumber: json['whatsAppNumber'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      categoryIds: (json['categoryIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      mainCategoryIds: (json['mainCategoryIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      subCategoryIds: (json['subCategoryIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tagIds:
          (json['tagIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ProviderModelImplToJson(_$ProviderModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'descriptionEn': instance.descriptionEn,
      'descriptionAr': instance.descriptionAr,
      'status': instance.status,
      'thumbnail': instance.thumbnail,
      'state': instance.state?.toJson(),
      'city': instance.city?.toJson(),
      'addressEn': instance.addressEn,
      'addressAr': instance.addressAr,
      'facebookURL': instance.facebookURL,
      'instagramUsername': instance.instagramUsername,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'avgRating': instance.avgRating,
      'ratingsCount': instance.ratingsCount,
      'likesCount': instance.likesCount,
      'order': instance.order,
      'personalPhoneCountryCode': instance.personalPhoneCountryCode,
      'personalPhoneNum': instance.personalPhoneNum,
      'providerPhoneCountryCode': instance.providerPhoneCountryCode,
      'providerPhoneNum': instance.providerPhoneNum,
      'whatsAppNumberCountryCode': instance.whatsAppNumberCountryCode,
      'whatsAppNumber': instance.whatsAppNumber,
      'isVerified': instance.isVerified,
      'images': instance.images,
      'categoryIds': instance.categoryIds,
      'mainCategoryIds': instance.mainCategoryIds,
      'subCategoryIds': instance.subCategoryIds,
      'tagIds': instance.tagIds,
    };

_$LightProviderModelImpl _$$LightProviderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LightProviderModelImpl(
      id: json['id'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$LightProviderModelImplToJson(
        _$LightProviderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'thumbnail': instance.thumbnail,
    };
