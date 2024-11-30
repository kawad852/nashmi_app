// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdModel _$AdModelFromJson(Map<String, dynamic> json) {
  return _AdModel.fromJson(json);
}

/// @nodoc
mixin _$AdModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  set type(String? value) => throw _privateConstructorUsedError;
  String? get imageURL => throw _privateConstructorUsedError;
  set imageURL(String? value) => throw _privateConstructorUsedError;
  String? get destinationId => throw _privateConstructorUsedError;
  set destinationId(String? value) => throw _privateConstructorUsedError;

  /// Serializes this AdModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdModelCopyWith<AdModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdModelCopyWith<$Res> {
  factory $AdModelCopyWith(AdModel value, $Res Function(AdModel) then) =
      _$AdModelCopyWithImpl<$Res, AdModel>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? type,
      String? imageURL,
      String? destinationId});
}

/// @nodoc
class _$AdModelCopyWithImpl<$Res, $Val extends AdModel>
    implements $AdModelCopyWith<$Res> {
  _$AdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? imageURL = freezed,
    Object? destinationId = freezed,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      imageURL: freezed == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationId: freezed == destinationId
          ? _value.destinationId
          : destinationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdModelImplCopyWith<$Res> implements $AdModelCopyWith<$Res> {
  factory _$$AdModelImplCopyWith(
          _$AdModelImpl value, $Res Function(_$AdModelImpl) then) =
      __$$AdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? type,
      String? imageURL,
      String? destinationId});
}

/// @nodoc
class __$$AdModelImplCopyWithImpl<$Res>
    extends _$AdModelCopyWithImpl<$Res, _$AdModelImpl>
    implements _$$AdModelImplCopyWith<$Res> {
  __$$AdModelImplCopyWithImpl(
      _$AdModelImpl _value, $Res Function(_$AdModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? imageURL = freezed,
    Object? destinationId = freezed,
  }) {
    return _then(_$AdModelImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      imageURL: freezed == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationId: freezed == destinationId
          ? _value.destinationId
          : destinationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdModelImpl implements _AdModel {
  _$AdModelImpl(
      {@TimestampSerializer() this.createdAt,
      this.id,
      this.type,
      this.imageURL,
      this.destinationId});

  factory _$AdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  String? id;
  @override
  String? type;
  @override
  String? imageURL;
  @override
  String? destinationId;

  @override
  String toString() {
    return 'AdModel(createdAt: $createdAt, id: $id, type: $type, imageURL: $imageURL, destinationId: $destinationId)';
  }

  /// Create a copy of AdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdModelImplCopyWith<_$AdModelImpl> get copyWith =>
      __$$AdModelImplCopyWithImpl<_$AdModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdModelImplToJson(
      this,
    );
  }
}

abstract class _AdModel implements AdModel {
  factory _AdModel(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? type,
      String? imageURL,
      String? destinationId}) = _$AdModelImpl;

  factory _AdModel.fromJson(Map<String, dynamic> json) = _$AdModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String? get id;
  set id(String? value);
  @override
  String? get type;
  set type(String? value);
  @override
  String? get imageURL;
  set imageURL(String? value);
  @override
  String? get destinationId;
  set destinationId(String? value);

  /// Create a copy of AdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdModelImplCopyWith<_$AdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
