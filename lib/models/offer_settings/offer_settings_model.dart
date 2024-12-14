import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'offer_settings_model.freezed.dart';
part 'offer_settings_model.g.dart';

@unfreezed
class OfferSettingsModel with _$OfferSettingsModel {
  factory OfferSettingsModel({
    @TimestampSerializer() DateTime? startTime,
    @TimestampSerializer() DateTime? endTime,
    String? contentEn,
    String? contentAr,
  }) = _OfferSettingsModel;

  factory OfferSettingsModel.fromJson(Map<String, dynamic> json) => _$OfferSettingsModelFromJson(json);
}
