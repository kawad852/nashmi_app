// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseModelImpl _$$PurchaseModelImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseModelImpl(
      lastPurchaseAt:
          const TimestampSerializer().fromJson(json['lastPurchaseAt']),
      id: json['id'] as String?,
      total: (json['total'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$PurchaseModelImplToJson(_$PurchaseModelImpl instance) =>
    <String, dynamic>{
      'lastPurchaseAt':
          const TimestampSerializer().toJson(instance.lastPurchaseAt),
      'id': instance.id,
      'total': instance.total,
    };
