// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) {
  return _ContactModel.fromJson(json);
}

/// @nodoc
mixin _$ContactModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  set displayName(String? value) => throw _privateConstructorUsedError;
  String? get phoneCountryCode => throw _privateConstructorUsedError;
  set phoneCountryCode(String? value) => throw _privateConstructorUsedError;
  String? get phoneNum => throw _privateConstructorUsedError;
  set phoneNum(String? value) => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  set message(String? value) => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  set subject(String? value) => throw _privateConstructorUsedError;
  String? get imageURL => throw _privateConstructorUsedError;
  set imageURL(String? value) => throw _privateConstructorUsedError;
  StateModel? get state => throw _privateConstructorUsedError;
  set state(StateModel? value) => throw _privateConstructorUsedError;
  CityModel? get city => throw _privateConstructorUsedError;
  set city(CityModel? value) => throw _privateConstructorUsedError;

  /// Serializes this ContactModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactModelCopyWith<ContactModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactModelCopyWith<$Res> {
  factory $ContactModelCopyWith(
          ContactModel value, $Res Function(ContactModel) then) =
      _$ContactModelCopyWithImpl<$Res, ContactModel>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? displayName,
      String? phoneCountryCode,
      String? phoneNum,
      String? message,
      String? subject,
      String? imageURL,
      StateModel? state,
      CityModel? city});

  $StateModelCopyWith<$Res>? get state;
  $CityModelCopyWith<$Res>? get city;
}

/// @nodoc
class _$ContactModelCopyWithImpl<$Res, $Val extends ContactModel>
    implements $ContactModelCopyWith<$Res> {
  _$ContactModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? displayName = freezed,
    Object? phoneCountryCode = freezed,
    Object? phoneNum = freezed,
    Object? message = freezed,
    Object? subject = freezed,
    Object? imageURL = freezed,
    Object? state = freezed,
    Object? city = freezed,
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
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCountryCode: freezed == phoneCountryCode
          ? _value.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNum: freezed == phoneNum
          ? _value.phoneNum
          : phoneNum // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      imageURL: freezed == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as StateModel?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityModel?,
    ) as $Val);
  }

  /// Create a copy of ContactModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StateModelCopyWith<$Res>? get state {
    if (_value.state == null) {
      return null;
    }

    return $StateModelCopyWith<$Res>(_value.state!, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }

  /// Create a copy of ContactModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CityModelCopyWith<$Res>? get city {
    if (_value.city == null) {
      return null;
    }

    return $CityModelCopyWith<$Res>(_value.city!, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContactModelImplCopyWith<$Res>
    implements $ContactModelCopyWith<$Res> {
  factory _$$ContactModelImplCopyWith(
          _$ContactModelImpl value, $Res Function(_$ContactModelImpl) then) =
      __$$ContactModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? displayName,
      String? phoneCountryCode,
      String? phoneNum,
      String? message,
      String? subject,
      String? imageURL,
      StateModel? state,
      CityModel? city});

  @override
  $StateModelCopyWith<$Res>? get state;
  @override
  $CityModelCopyWith<$Res>? get city;
}

/// @nodoc
class __$$ContactModelImplCopyWithImpl<$Res>
    extends _$ContactModelCopyWithImpl<$Res, _$ContactModelImpl>
    implements _$$ContactModelImplCopyWith<$Res> {
  __$$ContactModelImplCopyWithImpl(
      _$ContactModelImpl _value, $Res Function(_$ContactModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? displayName = freezed,
    Object? phoneCountryCode = freezed,
    Object? phoneNum = freezed,
    Object? message = freezed,
    Object? subject = freezed,
    Object? imageURL = freezed,
    Object? state = freezed,
    Object? city = freezed,
  }) {
    return _then(_$ContactModelImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCountryCode: freezed == phoneCountryCode
          ? _value.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNum: freezed == phoneNum
          ? _value.phoneNum
          : phoneNum // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      imageURL: freezed == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as StateModel?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactModelImpl implements _ContactModel {
  _$ContactModelImpl(
      {@TimestampSerializer() this.createdAt,
      this.id,
      this.displayName,
      this.phoneCountryCode,
      this.phoneNum,
      this.message,
      this.subject,
      this.imageURL,
      this.state,
      this.city});

  factory _$ContactModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  String? id;
  @override
  String? displayName;
  @override
  String? phoneCountryCode;
  @override
  String? phoneNum;
  @override
  String? message;
  @override
  String? subject;
  @override
  String? imageURL;
  @override
  StateModel? state;
  @override
  CityModel? city;

  @override
  String toString() {
    return 'ContactModel(createdAt: $createdAt, id: $id, displayName: $displayName, phoneCountryCode: $phoneCountryCode, phoneNum: $phoneNum, message: $message, subject: $subject, imageURL: $imageURL, state: $state, city: $city)';
  }

  /// Create a copy of ContactModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactModelImplCopyWith<_$ContactModelImpl> get copyWith =>
      __$$ContactModelImplCopyWithImpl<_$ContactModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactModelImplToJson(
      this,
    );
  }
}

abstract class _ContactModel implements ContactModel {
  factory _ContactModel(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      String? displayName,
      String? phoneCountryCode,
      String? phoneNum,
      String? message,
      String? subject,
      String? imageURL,
      StateModel? state,
      CityModel? city}) = _$ContactModelImpl;

  factory _ContactModel.fromJson(Map<String, dynamic> json) =
      _$ContactModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String? get id;
  set id(String? value);
  @override
  String? get displayName;
  set displayName(String? value);
  @override
  String? get phoneCountryCode;
  set phoneCountryCode(String? value);
  @override
  String? get phoneNum;
  set phoneNum(String? value);
  @override
  String? get message;
  set message(String? value);
  @override
  String? get subject;
  set subject(String? value);
  @override
  String? get imageURL;
  set imageURL(String? value);
  @override
  StateModel? get state;
  set state(StateModel? value);
  @override
  CityModel? get city;
  set city(CityModel? value);

  /// Create a copy of ContactModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactModelImplCopyWith<_$ContactModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
