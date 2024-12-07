// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferSettingsModelImpl _$$OfferSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OfferSettingsModelImpl(
      lunchAt: const TimestampSerializer().fromJson(json['lunchAt']),
      contentEn: json['contentEn'] as String?,
      contentAr: json['contentAr'] as String?,
      time: json['time'] as String?,
      date: const TimestampSerializer().fromJson(json['date']),
    );

Map<String, dynamic> _$$OfferSettingsModelImplToJson(
        _$OfferSettingsModelImpl instance) =>
    <String, dynamic>{
      'lunchAt': const TimestampSerializer().toJson(instance.lunchAt),
      'contentEn': instance.contentEn,
      'contentAr': instance.contentAr,
      'time': instance.time,
      'date': const TimestampSerializer().toJson(instance.date),
    };
