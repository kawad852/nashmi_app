// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return _CityModel.fromJson(json);
}

/// @nodoc
mixin _$CityModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  set nameEn(String? value) => throw _privateConstructorUsedError;
  String? get nameAr => throw _privateConstructorUsedError;
  set nameAr(String? value) => throw _privateConstructorUsedError;

  /// Serializes this CityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityModelCopyWith<CityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityModelCopyWith<$Res> {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) then) =
      _$CityModelCopyWithImpl<$Res, CityModel>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? nameEn,
      String? nameAr});
}

/// @nodoc
class _$CityModelCopyWithImpl<$Res, $Val extends CityModel>
    implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityModelImplCopyWith<$Res>
    implements $CityModelCopyWith<$Res> {
  factory _$$CityModelImplCopyWith(
          _$CityModelImpl value, $Res Function(_$CityModelImpl) then) =
      __$$CityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? nameEn,
      String? nameAr});
}

/// @nodoc
class __$$CityModelImplCopyWithImpl<$Res>
    extends _$CityModelCopyWithImpl<$Res, _$CityModelImpl>
    implements _$$CityModelImplCopyWith<$Res> {
  __$$CityModelImplCopyWithImpl(
      _$CityModelImpl _value, $Res Function(_$CityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
  }) {
    return _then(_$CityModelImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CityModelImpl implements _CityModel {
  _$CityModelImpl(
      {@TimestampSerializer() this.createdAt,
      this.id,
      this.nameEn,
      this.nameAr});

  factory _$CityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  String? id;
  @override
  String? nameEn;
  @override
  String? nameAr;

  @override
  String toString() {
    return 'CityModel(createdAt: $createdAt, id: $id, nameEn: $nameEn, nameAr: $nameAr)';
  }

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      __$$CityModelImplCopyWithImpl<_$CityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityModelImplToJson(
      this,
    );
  }
}

abstract class _CityModel implements CityModel {
  factory _CityModel(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? nameEn,
      String? nameAr}) = _$CityModelImpl;

  factory _CityModel.fromJson(Map<String, dynamic> json) =
      _$CityModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String? get id;
  set id(String? value);
  @override
  String? get nameEn;
  set nameEn(String? value);
  @override
  String? get nameAr;
  set nameAr(String? value);

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LightCityModel _$LightCityModelFromJson(Map<String, dynamic> json) {
  return _LightCityModel.fromJson(json);
}

/// @nodoc
mixin _$LightCityModel {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  set nameEn(String? value) => throw _privateConstructorUsedError;
  String? get nameAr => throw _privateConstructorUsedError;
  set nameAr(String? value) => throw _privateConstructorUsedError;

  /// Serializes this LightCityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LightCityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LightCityModelCopyWith<LightCityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LightCityModelCopyWith<$Res> {
  factory $LightCityModelCopyWith(
          LightCityModel value, $Res Function(LightCityModel) then) =
      _$LightCityModelCopyWithImpl<$Res, LightCityModel>;
  @useResult
  $Res call({String? id, String? nameEn, String? nameAr});
}

/// @nodoc
class _$LightCityModelCopyWithImpl<$Res, $Val extends LightCityModel>
    implements $LightCityModelCopyWith<$Res> {
  _$LightCityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LightCityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LightCityModelImplCopyWith<$Res>
    implements $LightCityModelCopyWith<$Res> {
  factory _$$LightCityModelImplCopyWith(_$LightCityModelImpl value,
          $Res Function(_$LightCityModelImpl) then) =
      __$$LightCityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? nameEn, String? nameAr});
}

/// @nodoc
class __$$LightCityModelImplCopyWithImpl<$Res>
    extends _$LightCityModelCopyWithImpl<$Res, _$LightCityModelImpl>
    implements _$$LightCityModelImplCopyWith<$Res> {
  __$$LightCityModelImplCopyWithImpl(
      _$LightCityModelImpl _value, $Res Function(_$LightCityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LightCityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
  }) {
    return _then(_$LightCityModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LightCityModelImpl implements _LightCityModel {
  _$LightCityModelImpl({this.id, this.nameEn, this.nameAr});

  factory _$LightCityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LightCityModelImplFromJson(json);

  @override
  String? id;
  @override
  String? nameEn;
  @override
  String? nameAr;

  @override
  String toString() {
    return 'LightCityModel(id: $id, nameEn: $nameEn, nameAr: $nameAr)';
  }

  /// Create a copy of LightCityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightCityModelImplCopyWith<_$LightCityModelImpl> get copyWith =>
      __$$LightCityModelImplCopyWithImpl<_$LightCityModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LightCityModelImplToJson(
      this,
    );
  }
}

abstract class _LightCityModel implements LightCityModel {
  factory _LightCityModel({String? id, String? nameEn, String? nameAr}) =
      _$LightCityModelImpl;

  factory _LightCityModel.fromJson(Map<String, dynamic> json) =
      _$LightCityModelImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String? get nameEn;
  set nameEn(String? value);
  @override
  String? get nameAr;
  set nameAr(String? value);

  /// Create a copy of LightCityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightCityModelImplCopyWith<_$LightCityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
