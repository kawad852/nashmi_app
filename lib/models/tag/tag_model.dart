import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'tag_model.freezed.dart';
part 'tag_model.g.dart';

@unfreezed
class TagModel with _$TagModel {
  factory TagModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? nameEn,
    String? nameAr,
  }) = _TagModel;

  factory TagModel.fromJson(Map<String, dynamic> json) => _$TagModelFromJson(json);
}
