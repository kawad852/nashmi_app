// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      thumbnail: json['thumbnail'] as String?,
      order: (json['order'] as num?)?.toInt(),
      subCategories: (json['subCategories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      published: json['published'] as bool? ?? true,
      mainCategory: json['mainCategory'] as bool? ?? false,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'thumbnail': instance.thumbnail,
      'order': instance.order,
      'subCategories': instance.subCategories,
      'published': instance.published,
      'mainCategory': instance.mainCategory,
    };
