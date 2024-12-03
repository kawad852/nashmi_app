// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteModelImpl _$$FavoriteModelImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      providerId: json['providerId'] as String?,
    );

Map<String, dynamic> _$$FavoriteModelImplToJson(_$FavoriteModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'providerId': instance.providerId,
    };
