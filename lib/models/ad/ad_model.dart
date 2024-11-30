import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'ad_model.freezed.dart';
part 'ad_model.g.dart';

@unfreezed
class AdModel with _$AdModel {
  factory AdModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? type,
    String? imageURL,
    String? destinationId,
  }) = _AdModel;

  factory AdModel.fromJson(Map<String, dynamic> json) => _$AdModelFromJson(json);
}
