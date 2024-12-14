// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactModelImpl _$$ContactModelImplFromJson(Map<String, dynamic> json) =>
    _$ContactModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      phoneCountryCode: json['phoneCountryCode'] as String?,
      phoneNum: json['phoneNum'] as String?,
      message: json['message'] as String?,
      subject: json['subject'] as String?,
      imageURL: json['imageURL'] as String?,
      state: json['state'] == null
          ? null
          : StateModel.fromJson(json['state'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContactModelImplToJson(_$ContactModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'displayName': instance.displayName,
      'phoneCountryCode': instance.phoneCountryCode,
      'phoneNum': instance.phoneNum,
      'message': instance.message,
      'subject': instance.subject,
      'imageURL': instance.imageURL,
      'state': instance.state?.toJson(),
      'city': instance.city?.toJson(),
    };
