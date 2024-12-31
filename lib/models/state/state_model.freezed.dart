// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StateModel _$StateModelFromJson(Map<String, dynamic> json) {
  return _StateModel.fromJson(json);
}

/// @nodoc
mixin _$StateModel {
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
  List<String> get cityIds => throw _privateConstructorUsedError;
  set cityIds(List<String> value) => throw _privateConstructorUsedError;

  /// Serializes this StateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StateModelCopyWith<StateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateModelCopyWith<$Res> {
  factory $StateModelCopyWith(
          StateModel value, $Res Function(StateModel) then) =
      _$StateModelCopyWithImpl<$Res, StateModel>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? nameEn,
      String? nameAr,
      List<String> cityIds});
}

/// @nodoc
class _$StateModelCopyWithImpl<$Res, $Val extends StateModel>
    implements $StateModelCopyWith<$Res> {
  _$StateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? cityIds = null,
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
      cityIds: null == cityIds
          ? _value.cityIds
          : cityIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StateModelImplCopyWith<$Res>
    implements $StateModelCopyWith<$Res> {
  factory _$$StateModelImplCopyWith(
          _$StateModelImpl value, $Res Function(_$StateModelImpl) then) =
      __$$StateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? nameEn,
      String? nameAr,
      List<String> cityIds});
}

/// @nodoc
class __$$StateModelImplCopyWithImpl<$Res>
    extends _$StateModelCopyWithImpl<$Res, _$StateModelImpl>
    implements _$$StateModelImplCopyWith<$Res> {
  __$$StateModelImplCopyWithImpl(
      _$StateModelImpl _value, $Res Function(_$StateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? cityIds = null,
  }) {
    return _then(_$StateModelImpl(
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
      cityIds: null == cityIds
          ? _value.cityIds
          : cityIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StateModelImpl implements _StateModel {
  _$StateModelImpl(
      {@TimestampSerializer() this.createdAt,
      this.id,
      this.nameEn,
      this.nameAr,
      this.cityIds = const []});

  factory _$StateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StateModelImplFromJson(json);

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
  @JsonKey()
  List<String> cityIds;

  @override
  String toString() {
    return 'StateModel(createdAt: $createdAt, id: $id, nameEn: $nameEn, nameAr: $nameAr, cityIds: $cityIds)';
  }

  /// Create a copy of StateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StateModelImplCopyWith<_$StateModelImpl> get copyWith =>
      __$$StateModelImplCopyWithImpl<_$StateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StateModelImplToJson(
      this,
    );
  }
}

abstract class _StateModel implements StateModel {
  factory _StateModel(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? nameEn,
      String? nameAr,
      List<String> cityIds}) = _$StateModelImpl;

  factory _StateModel.fromJson(Map<String, dynamic> json) =
      _$StateModelImpl.fromJson;

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
  @override
  List<String> get cityIds;
  set cityIds(List<String> value);

  /// Create a copy of StateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StateModelImplCopyWith<_$StateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LightStateModel _$LightStateModelFromJson(Map<String, dynamic> json) {
  return _LightStateModel.fromJson(json);
}

/// @nodoc
mixin _$LightStateModel {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  set nameEn(String? value) => throw _privateConstructorUsedError;
  String? get nameAr => throw _privateConstructorUsedError;
  set nameAr(String? value) => throw _privateConstructorUsedError;

  /// Serializes this LightStateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LightStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LightStateModelCopyWith<LightStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LightStateModelCopyWith<$Res> {
  factory $LightStateModelCopyWith(
          LightStateModel value, $Res Function(LightStateModel) then) =
      _$LightStateModelCopyWithImpl<$Res, LightStateModel>;
  @useResult
  $Res call({String? id, String? nameEn, String? nameAr});
}

/// @nodoc
class _$LightStateModelCopyWithImpl<$Res, $Val extends LightStateModel>
    implements $LightStateModelCopyWith<$Res> {
  _$LightStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LightStateModel
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
abstract class _$$LightStateModelImplCopyWith<$Res>
    implements $LightStateModelCopyWith<$Res> {
  factory _$$LightStateModelImplCopyWith(_$LightStateModelImpl value,
          $Res Function(_$LightStateModelImpl) then) =
      __$$LightStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? nameEn, String? nameAr});
}

/// @nodoc
class __$$LightStateModelImplCopyWithImpl<$Res>
    extends _$LightStateModelCopyWithImpl<$Res, _$LightStateModelImpl>
    implements _$$LightStateModelImplCopyWith<$Res> {
  __$$LightStateModelImplCopyWithImpl(
      _$LightStateModelImpl _value, $Res Function(_$LightStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LightStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
  }) {
    return _then(_$LightStateModelImpl(
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
class _$LightStateModelImpl implements _LightStateModel {
  _$LightStateModelImpl({this.id, this.nameEn, this.nameAr});

  factory _$LightStateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LightStateModelImplFromJson(json);

  @override
  String? id;
  @override
  String? nameEn;
  @override
  String? nameAr;

  @override
  String toString() {
    return 'LightStateModel(id: $id, nameEn: $nameEn, nameAr: $nameAr)';
  }

  /// Create a copy of LightStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightStateModelImplCopyWith<_$LightStateModelImpl> get copyWith =>
      __$$LightStateModelImplCopyWithImpl<_$LightStateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LightStateModelImplToJson(
      this,
    );
  }
}

abstract class _LightStateModel implements LightStateModel {
  factory _LightStateModel({String? id, String? nameEn, String? nameAr}) =
      _$LightStateModelImpl;

  factory _LightStateModel.fromJson(Map<String, dynamic> json) =
      _$LightStateModelImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String? get nameEn;
  set nameEn(String? value);
  @override
  String? get nameAr;
  set nameAr(String? value);

  /// Create a copy of LightStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightStateModelImplCopyWith<_$LightStateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
