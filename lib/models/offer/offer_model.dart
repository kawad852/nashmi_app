import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';
import '../provider/provider_model.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

@unfreezed
class OfferModel with _$OfferModel {
  factory OfferModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    LightProviderModel? provider,
    String? thumbnail,
    String? qrCode,
    String? nameEn,
    String? nameAr,
    String? descriptionEn,
    String? descriptionAr,
    int? purchaseLimit,
    @Default(0) int currentViews,
    @Default(0) int purchasesCount,
    @Default(false) bool pinned,
    @Default(false) bool active,
    double? originalPrice,
    double? offerPrice,
    List<String>? images,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);
}
