import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'state_model.freezed.dart';
part 'state_model.g.dart';

@unfreezed
class StateModel with _$StateModel {
  factory StateModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? nameEn,
    String? nameAr,
    @Default([]) List<String> cityIds,
  }) = _StateModel;

  factory StateModel.fromJson(Map<String, dynamic> json) => _$StateModelFromJson(json);
}

@unfreezed
class LightStateModel with _$LightStateModel {
  factory LightStateModel({
    String? id,
    String? nameEn,
    String? nameAr,
  }) = _LightStateModel;

  factory LightStateModel.fromJson(Map<String, dynamic> json) => _$LightStateModelFromJson(json);
}
