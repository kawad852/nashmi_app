// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StateModelImpl _$$StateModelImplFromJson(Map<String, dynamic> json) =>
    _$StateModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      cityIds: (json['cityIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StateModelImplToJson(_$StateModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'cityIds': instance.cityIds,
    };

_$LightStateModelImpl _$$LightStateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LightStateModelImpl(
      id: json['id'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
    );

Map<String, dynamic> _$$LightStateModelImplToJson(
        _$LightStateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
    };
