// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeoModel _$GeoModelFromJson(Map<String, dynamic> json) {
  return _GeoModel.fromJson(json);
}

/// @nodoc
mixin _$GeoModel {
  @JsonKey(name: "geohash")
  String get geoHash => throw _privateConstructorUsedError;
  @JsonKey(name: "geohash")
  set geoHash(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "geopoint")
  @GeoPointSerializer()
  GeoPoint? get geoPoint => throw _privateConstructorUsedError;
  @JsonKey(name: "geopoint")
  @GeoPointSerializer()
  set geoPoint(GeoPoint? value) => throw _privateConstructorUsedError;

  /// Serializes this GeoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeoModelCopyWith<GeoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoModelCopyWith<$Res> {
  factory $GeoModelCopyWith(GeoModel value, $Res Function(GeoModel) then) =
      _$GeoModelCopyWithImpl<$Res, GeoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "geohash") String geoHash,
      @JsonKey(name: "geopoint") @GeoPointSerializer() GeoPoint? geoPoint});
}

/// @nodoc
class _$GeoModelCopyWithImpl<$Res, $Val extends GeoModel>
    implements $GeoModelCopyWith<$Res> {
  _$GeoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoHash = null,
    Object? geoPoint = freezed,
  }) {
    return _then(_value.copyWith(
      geoHash: null == geoHash
          ? _value.geoHash
          : geoHash // ignore: cast_nullable_to_non_nullable
              as String,
      geoPoint: freezed == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoModelImplCopyWith<$Res>
    implements $GeoModelCopyWith<$Res> {
  factory _$$GeoModelImplCopyWith(
          _$GeoModelImpl value, $Res Function(_$GeoModelImpl) then) =
      __$$GeoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "geohash") String geoHash,
      @JsonKey(name: "geopoint") @GeoPointSerializer() GeoPoint? geoPoint});
}

/// @nodoc
class __$$GeoModelImplCopyWithImpl<$Res>
    extends _$GeoModelCopyWithImpl<$Res, _$GeoModelImpl>
    implements _$$GeoModelImplCopyWith<$Res> {
  __$$GeoModelImplCopyWithImpl(
      _$GeoModelImpl _value, $Res Function(_$GeoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoHash = null,
    Object? geoPoint = freezed,
  }) {
    return _then(_$GeoModelImpl(
      geoHash: null == geoHash
          ? _value.geoHash
          : geoHash // ignore: cast_nullable_to_non_nullable
              as String,
      geoPoint: freezed == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoModelImpl implements _GeoModel {
  _$GeoModelImpl(
      {@JsonKey(name: "geohash") this.geoHash = '',
      @JsonKey(name: "geopoint") @GeoPointSerializer() this.geoPoint});

  factory _$GeoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoModelImplFromJson(json);

  @override
  @JsonKey(name: "geohash")
  String geoHash;
  @override
  @JsonKey(name: "geopoint")
  @GeoPointSerializer()
  GeoPoint? geoPoint;

  @override
  String toString() {
    return 'GeoModel(geoHash: $geoHash, geoPoint: $geoPoint)';
  }

  /// Create a copy of GeoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoModelImplCopyWith<_$GeoModelImpl> get copyWith =>
      __$$GeoModelImplCopyWithImpl<_$GeoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoModelImplToJson(
      this,
    );
  }
}

abstract class _GeoModel implements GeoModel {
  factory _GeoModel(
      {@JsonKey(name: "geohash") String geoHash,
      @JsonKey(name: "geopoint")
      @GeoPointSerializer()
      GeoPoint? geoPoint}) = _$GeoModelImpl;

  factory _GeoModel.fromJson(Map<String, dynamic> json) =
      _$GeoModelImpl.fromJson;

  @override
  @JsonKey(name: "geohash")
  String get geoHash;
  @JsonKey(name: "geohash")
  set geoHash(String value);
  @override
  @JsonKey(name: "geopoint")
  @GeoPointSerializer()
  GeoPoint? get geoPoint;
  @JsonKey(name: "geopoint")
  @GeoPointSerializer()
  set geoPoint(GeoPoint? value);

  /// Create a copy of GeoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeoModelImplCopyWith<_$GeoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}