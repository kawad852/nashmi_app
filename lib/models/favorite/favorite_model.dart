import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'favorite_model.freezed.dart';
part 'favorite_model.g.dart';

@unfreezed
class FavoriteModel with _$FavoriteModel {
  factory FavoriteModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? providerId,
  }) = _FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => _$FavoriteModelFromJson(json);
}
