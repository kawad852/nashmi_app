// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdModelImpl _$$AdModelImplFromJson(Map<String, dynamic> json) =>
    _$AdModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      type: json['type'] as String?,
      imageURL: json['imageURL'] as String?,
      destinationId: json['destinationId'] as String?,
    );

Map<String, dynamic> _$$AdModelImplToJson(_$AdModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'type': instance.type,
      'imageURL': instance.imageURL,
      'destinationId': instance.destinationId,
    };
