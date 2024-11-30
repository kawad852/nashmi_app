import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'sponsor_model.freezed.dart';
part 'sponsor_model.g.dart';

@unfreezed
class SponsorModel with _$SponsorModel {
  factory SponsorModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? logo,
  }) = _SponsorModel;

  factory SponsorModel.fromJson(Map<String, dynamic> json) => _$SponsorModelFromJson(json);
}
