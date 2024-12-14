// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferSettingsModelImpl _$$OfferSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OfferSettingsModelImpl(
      startTime: const TimestampSerializer().fromJson(json['startTime']),
      endTime: const TimestampSerializer().fromJson(json['endTime']),
      contentEn: json['contentEn'] as String?,
      contentAr: json['contentAr'] as String?,
    );

Map<String, dynamic> _$$OfferSettingsModelImplToJson(
        _$OfferSettingsModelImpl instance) =>
    <String, dynamic>{
      'startTime': const TimestampSerializer().toJson(instance.startTime),
      'endTime': const TimestampSerializer().toJson(instance.endTime),
      'contentEn': instance.contentEn,
      'contentAr': instance.contentAr,
    };
