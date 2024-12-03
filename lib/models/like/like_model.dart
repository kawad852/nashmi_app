import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'like_model.freezed.dart';
part 'like_model.g.dart';

@unfreezed
class LikeModel with _$LikeModel {
  factory LikeModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? providerId,
  }) = _LikeModel;

  factory LikeModel.fromJson(Map<String, dynamic> json) => _$LikeModelFromJson(json);
}
