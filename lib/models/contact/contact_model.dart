import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nashmi_app/models/city/city_model.dart';
import 'package:nashmi_app/models/state/state_model.dart';

import '../../helper/time_stamp_serializer.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@unfreezed
class ContactModel with _$ContactModel {
  factory ContactModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? displayName,
    String? phoneCountryCode,
    String? phoneNum,
    String? message,
    String? subject,
    String? imageURL,
    String? stateId,
    String? cityId,
  }) = _ContactModel;

  factory ContactModel.fromJson(Map<String, dynamic> json) => _$ContactModelFromJson(json);
}
