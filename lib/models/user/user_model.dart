import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';
import '../../utils/enums.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@unfreezed
class UserModel with _$UserModel {
  factory UserModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? displayName,
    String? email,
    String? phone,
    String? photoURL,
    String? deviceToken,
    String? provider,
    String? phoneCountryCode,
    String? gender,
    String? username,
    @Default(false) bool blocked,
    @Default(LanguageEnum.english) String languageCode,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
