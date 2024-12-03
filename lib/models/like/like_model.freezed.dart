// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LikeModel _$LikeModelFromJson(Map<String, dynamic> json) {
  return _LikeModel.fromJson(json);
}

/// @nodoc
mixin _$LikeModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get providerId => throw _privateConstructorUsedError;
  set providerId(String? value) => throw _privateConstructorUsedError;

  /// Serializes this LikeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LikeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LikeModelCopyWith<LikeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeModelCopyWith<$Res> {
  factory $LikeModelCopyWith(LikeModel value, $Res Function(LikeModel) then) =
      _$LikeModelCopyWithImpl<$Res, LikeModel>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? providerId});
}

/// @nodoc
class _$LikeModelCopyWithImpl<$Res, $Val extends LikeModel>
    implements $LikeModelCopyWith<$Res> {
  _$LikeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LikeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? providerId = freezed,
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
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikeModelImplCopyWith<$Res>
    implements $LikeModelCopyWith<$Res> {
  factory _$$LikeModelImplCopyWith(
          _$LikeModelImpl value, $Res Function(_$LikeModelImpl) then) =
      __$$LikeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? providerId});
}

/// @nodoc
class __$$LikeModelImplCopyWithImpl<$Res>
    extends _$LikeModelCopyWithImpl<$Res, _$LikeModelImpl>
    implements _$$LikeModelImplCopyWith<$Res> {
  __$$LikeModelImplCopyWithImpl(
      _$LikeModelImpl _value, $Res Function(_$LikeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LikeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? providerId = freezed,
  }) {
    return _then(_$LikeModelImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LikeModelImpl implements _LikeModel {
  _$LikeModelImpl(
      {@TimestampSerializer() this.createdAt, this.id, this.providerId});

  factory _$LikeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikeModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  String? id;
  @override
  String? providerId;

  @override
  String toString() {
    return 'LikeModel(createdAt: $createdAt, id: $id, providerId: $providerId)';
  }

  /// Create a copy of LikeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeModelImplCopyWith<_$LikeModelImpl> get copyWith =>
      __$$LikeModelImplCopyWithImpl<_$LikeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikeModelImplToJson(
      this,
    );
  }
}

abstract class _LikeModel implements LikeModel {
  factory _LikeModel(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? providerId}) = _$LikeModelImpl;

  factory _LikeModel.fromJson(Map<String, dynamic> json) =
      _$LikeModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String? get id;
  set id(String? value);
  @override
  String? get providerId;
  set providerId(String? value);

  /// Create a copy of LikeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeModelImplCopyWith<_$LikeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
