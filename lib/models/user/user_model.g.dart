// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      photoURL: json['photoURL'] as String?,
      deviceToken: json['deviceToken'] as String?,
      provider: json['provider'] as String?,
      phoneCountryCode: json['phoneCountryCode'] as String?,
      gender: json['gender'] as String?,
      username: json['username'] as String?,
      blocked: json['blocked'] as bool? ?? false,
      languageCode: json['languageCode'] as String? ?? LanguageEnum.english,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'phone': instance.phone,
      'photoURL': instance.photoURL,
      'deviceToken': instance.deviceToken,
      'provider': instance.provider,
      'phoneCountryCode': instance.phoneCountryCode,
      'gender': instance.gender,
      'username': instance.username,
      'blocked': instance.blocked,
      'languageCode': instance.languageCode,
    };
