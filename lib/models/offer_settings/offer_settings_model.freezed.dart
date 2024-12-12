// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OfferSettingsModel _$OfferSettingsModelFromJson(Map<String, dynamic> json) {
  return _OfferSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$OfferSettingsModel {
  @TimestampSerializer()
  DateTime? get lunchAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set lunchAt(DateTime? value) => throw _privateConstructorUsedError;
  String? get contentEn => throw _privateConstructorUsedError;
  set contentEn(String? value) => throw _privateConstructorUsedError;
  String? get contentAr => throw _privateConstructorUsedError;
  set contentAr(String? value) => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  set time(String? value) => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get date => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set date(DateTime? value) => throw _privateConstructorUsedError;

  /// Serializes this OfferSettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfferSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferSettingsModelCopyWith<OfferSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferSettingsModelCopyWith<$Res> {
  factory $OfferSettingsModelCopyWith(
          OfferSettingsModel value, $Res Function(OfferSettingsModel) then) =
      _$OfferSettingsModelCopyWithImpl<$Res, OfferSettingsModel>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? lunchAt,
      String? contentEn,
      String? contentAr,
      String? time,
      @TimestampSerializer() DateTime? date});
}

/// @nodoc
class _$OfferSettingsModelCopyWithImpl<$Res, $Val extends OfferSettingsModel>
    implements $OfferSettingsModelCopyWith<$Res> {
  _$OfferSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lunchAt = freezed,
    Object? contentEn = freezed,
    Object? contentAr = freezed,
    Object? time = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      lunchAt: freezed == lunchAt
          ? _value.lunchAt
          : lunchAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contentEn: freezed == contentEn
          ? _value.contentEn
          : contentEn // ignore: cast_nullable_to_non_nullable
              as String?,
      contentAr: freezed == contentAr
          ? _value.contentAr
          : contentAr // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfferSettingsModelImplCopyWith<$Res>
    implements $OfferSettingsModelCopyWith<$Res> {
  factory _$$OfferSettingsModelImplCopyWith(_$OfferSettingsModelImpl value,
          $Res Function(_$OfferSettingsModelImpl) then) =
      __$$OfferSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? lunchAt,
      String? contentEn,
      String? contentAr,
      String? time,
      @TimestampSerializer() DateTime? date});
}

/// @nodoc
class __$$OfferSettingsModelImplCopyWithImpl<$Res>
    extends _$OfferSettingsModelCopyWithImpl<$Res, _$OfferSettingsModelImpl>
    implements _$$OfferSettingsModelImplCopyWith<$Res> {
  __$$OfferSettingsModelImplCopyWithImpl(_$OfferSettingsModelImpl _value,
      $Res Function(_$OfferSettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfferSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lunchAt = freezed,
    Object? contentEn = freezed,
    Object? contentAr = freezed,
    Object? time = freezed,
    Object? date = freezed,
  }) {
    return _then(_$OfferSettingsModelImpl(
      lunchAt: freezed == lunchAt
          ? _value.lunchAt
          : lunchAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contentEn: freezed == contentEn
          ? _value.contentEn
          : contentEn // ignore: cast_nullable_to_non_nullable
              as String?,
      contentAr: freezed == contentAr
          ? _value.contentAr
          : contentAr // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferSettingsModelImpl implements _OfferSettingsModel {
  _$OfferSettingsModelImpl(
      {@TimestampSerializer() this.lunchAt,
      this.contentEn,
      this.contentAr,
      this.time,
      @TimestampSerializer() this.date});

  factory _$OfferSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferSettingsModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? lunchAt;
  @override
  String? contentEn;
  @override
  String? contentAr;
  @override
  String? time;
  @override
  @TimestampSerializer()
  DateTime? date;

  @override
  String toString() {
    return 'OfferSettingsModel(lunchAt: $lunchAt, contentEn: $contentEn, contentAr: $contentAr, time: $time, date: $date)';
  }

  /// Create a copy of OfferSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferSettingsModelImplCopyWith<_$OfferSettingsModelImpl> get copyWith =>
      __$$OfferSettingsModelImplCopyWithImpl<_$OfferSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _OfferSettingsModel implements OfferSettingsModel {
  factory _OfferSettingsModel(
      {@TimestampSerializer() DateTime? lunchAt,
      String? contentEn,
      String? contentAr,
      String? time,
      @TimestampSerializer() DateTime? date}) = _$OfferSettingsModelImpl;

  factory _OfferSettingsModel.fromJson(Map<String, dynamic> json) =
      _$OfferSettingsModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get lunchAt;
  @TimestampSerializer()
  set lunchAt(DateTime? value);
  @override
  String? get contentEn;
  set contentEn(String? value);
  @override
  String? get contentAr;
  set contentAr(String? value);
  @override
  String? get time;
  set time(String? value);
  @override
  @TimestampSerializer()
  DateTime? get date;
  @TimestampSerializer()
  set date(DateTime? value);

  /// Create a copy of OfferSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferSettingsModelImplCopyWith<_$OfferSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}