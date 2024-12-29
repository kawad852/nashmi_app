// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SponsorModel _$SponsorModelFromJson(Map<String, dynamic> json) {
  return _SponsorModel.fromJson(json);
}

/// @nodoc
mixin _$SponsorModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  set logo(String? value) => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  set url(String? value) => throw _privateConstructorUsedError;

  /// Serializes this SponsorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SponsorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SponsorModelCopyWith<SponsorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SponsorModelCopyWith<$Res> {
  factory $SponsorModelCopyWith(
          SponsorModel value, $Res Function(SponsorModel) then) =
      _$SponsorModelCopyWithImpl<$Res, SponsorModel>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? logo,
      String? url});
}

/// @nodoc
class _$SponsorModelCopyWithImpl<$Res, $Val extends SponsorModel>
    implements $SponsorModelCopyWith<$Res> {
  _$SponsorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SponsorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? logo = freezed,
    Object? url = freezed,
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
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SponsorModelImplCopyWith<$Res>
    implements $SponsorModelCopyWith<$Res> {
  factory _$$SponsorModelImplCopyWith(
          _$SponsorModelImpl value, $Res Function(_$SponsorModelImpl) then) =
      __$$SponsorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? logo,
      String? url});
}

/// @nodoc
class __$$SponsorModelImplCopyWithImpl<$Res>
    extends _$SponsorModelCopyWithImpl<$Res, _$SponsorModelImpl>
    implements _$$SponsorModelImplCopyWith<$Res> {
  __$$SponsorModelImplCopyWithImpl(
      _$SponsorModelImpl _value, $Res Function(_$SponsorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SponsorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? logo = freezed,
    Object? url = freezed,
  }) {
    return _then(_$SponsorModelImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SponsorModelImpl implements _SponsorModel {
  _$SponsorModelImpl(
      {@TimestampSerializer() this.createdAt, this.id, this.logo, this.url});

  factory _$SponsorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SponsorModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  String? id;
  @override
  String? logo;
  @override
  String? url;

  @override
  String toString() {
    return 'SponsorModel(createdAt: $createdAt, id: $id, logo: $logo, url: $url)';
  }

  /// Create a copy of SponsorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SponsorModelImplCopyWith<_$SponsorModelImpl> get copyWith =>
      __$$SponsorModelImplCopyWithImpl<_$SponsorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SponsorModelImplToJson(
      this,
    );
  }
}

abstract class _SponsorModel implements SponsorModel {
  factory _SponsorModel(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? logo,
      String? url}) = _$SponsorModelImpl;

  factory _SponsorModel.fromJson(Map<String, dynamic> json) =
      _$SponsorModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String? get id;
  set id(String? value);
  @override
  String? get logo;
  set logo(String? value);
  @override
  String? get url;
  set url(String? value);

  /// Create a copy of SponsorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SponsorModelImplCopyWith<_$SponsorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
