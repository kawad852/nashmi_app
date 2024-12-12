import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'purchase_model.freezed.dart';
part 'purchase_model.g.dart';

@unfreezed
class PurchaseModel with _$PurchaseModel {
  factory PurchaseModel({
    @TimestampSerializer() DateTime? lastPurchaseAt,
    String? id,
    @Default(1) int total,
  }) = _PurchaseModel;

  factory PurchaseModel.fromJson(Map<String, dynamic> json) => _$PurchaseModelFromJson(json);
}
