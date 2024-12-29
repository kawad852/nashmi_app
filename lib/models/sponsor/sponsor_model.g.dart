// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SponsorModelImpl _$$SponsorModelImplFromJson(Map<String, dynamic> json) =>
    _$SponsorModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      logo: json['logo'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$SponsorModelImplToJson(_$SponsorModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'logo': instance.logo,
      'url': instance.url,
    };
