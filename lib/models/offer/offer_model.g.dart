// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferModelImpl _$$OfferModelImplFromJson(Map<String, dynamic> json) =>
    _$OfferModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      provider: json['provider'] == null
          ? null
          : LightProviderModel.fromJson(
              json['provider'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] as String?,
      qrCode: json['qrCode'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      descriptionEn: json['descriptionEn'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
      purchaseLimit: (json['purchaseLimit'] as num?)?.toInt(),
      currentViews: (json['currentViews'] as num?)?.toInt() ?? 0,
      purchasesCount: (json['purchasesCount'] as num?)?.toInt() ?? 0,
      pinned: json['pinned'] as bool? ?? false,
      active: json['active'] as bool? ?? false,
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      offerPrice: (json['offerPrice'] as num?)?.toDouble(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$OfferModelImplToJson(_$OfferModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'provider': instance.provider?.toJson(),
      'thumbnail': instance.thumbnail,
      'qrCode': instance.qrCode,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'descriptionEn': instance.descriptionEn,
      'descriptionAr': instance.descriptionAr,
      'purchaseLimit': instance.purchaseLimit,
      'currentViews': instance.currentViews,
      'purchasesCount': instance.purchasesCount,
      'pinned': instance.pinned,
      'active': instance.active,
      'originalPrice': instance.originalPrice,
      'offerPrice': instance.offerPrice,
      'images': instance.images,
    };
