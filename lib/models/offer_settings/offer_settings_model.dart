import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'offer_settings_model.freezed.dart';
part 'offer_settings_model.g.dart';

@unfreezed
class OfferSettingsModel with _$OfferSettingsModel {
  factory OfferSettingsModel({
    @TimestampSerializer() DateTime? lunchAt,
    String? contentEn,
    String? contentAr,
    String? time,
    @TimestampSerializer() DateTime? date,
  }) = _OfferSettingsModel;

  factory OfferSettingsModel.fromJson(Map<String, dynamic> json) => _$OfferSettingsModelFromJson(json);
}
