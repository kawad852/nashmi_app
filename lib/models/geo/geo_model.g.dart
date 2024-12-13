// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeoModelImpl _$$GeoModelImplFromJson(Map<String, dynamic> json) =>
    _$GeoModelImpl(
      geoHash: json['geohash'] as String? ?? '',
      geoPoint: const GeoPointSerializer().fromJson(json['geopoint']),
    );

Map<String, dynamic> _$$GeoModelImplToJson(_$GeoModelImpl instance) =>
    <String, dynamic>{
      'geohash': instance.geoHash,
      'geopoint': const GeoPointSerializer().toJson(instance.geoPoint),
    };
