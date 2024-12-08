// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) {
  return _OfferModel.fromJson(json);
}

/// @nodoc
mixin _$OfferModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  LightProviderModel? get provider => throw _privateConstructorUsedError;
  set provider(LightProviderModel? value) => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  set thumbnail(String? value) => throw _privateConstructorUsedError;
  String? get qrCode => throw _privateConstructorUsedError;
  set qrCode(String? value) => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  set nameEn(String? value) => throw _privateConstructorUsedError;
  String? get nameAr => throw _privateConstructorUsedError;
  set nameAr(String? value) => throw _privateConstructorUsedError;
  String? get descriptionEn => throw _privateConstructorUsedError;
  set descriptionEn(String? value) => throw _privateConstructorUsedError;
  String? get descriptionAr => throw _privateConstructorUsedError;
  set descriptionAr(String? value) => throw _privateConstructorUsedError;
  int? get purchaseLimit => throw _privateConstructorUsedError;
  set purchaseLimit(int? value) => throw _privateConstructorUsedError;
  int get currentViews => throw _privateConstructorUsedError;
  set currentViews(int value) => throw _privateConstructorUsedError;
  int get purchasesCount => throw _privateConstructorUsedError;
  set purchasesCount(int value) => throw _privateConstructorUsedError;
  bool get pinned => throw _privateConstructorUsedError;
  set pinned(bool value) => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  set active(bool value) => throw _privateConstructorUsedError;
  double? get originalPrice => throw _privateConstructorUsedError;
  set originalPrice(double? value) => throw _privateConstructorUsedError;
  double? get offerPrice => throw _privateConstructorUsedError;
  set offerPrice(double? value) => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  set images(List<String>? value) => throw _privateConstructorUsedError;

  /// Serializes this OfferModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferModelCopyWith<OfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferModelCopyWith<$Res> {
  factory $OfferModelCopyWith(
          OfferModel value, $Res Function(OfferModel) then) =
      _$OfferModelCopyWithImpl<$Res, OfferModel>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      LightProviderModel? provider,
      String? thumbnail,
      String? qrCode,
      String? nameEn,
      String? nameAr,
      String? descriptionEn,
      String? descriptionAr,
      int? purchaseLimit,
      int currentViews,
      int purchasesCount,
      bool pinned,
      bool active,
      double? originalPrice,
      double? offerPrice,
      List<String>? images});

  $LightProviderModelCopyWith<$Res>? get provider;
}

/// @nodoc
class _$OfferModelCopyWithImpl<$Res, $Val extends OfferModel>
    implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? provider = freezed,
    Object? thumbnail = freezed,
    Object? qrCode = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? descriptionEn = freezed,
    Object? descriptionAr = freezed,
    Object? purchaseLimit = freezed,
    Object? currentViews = null,
    Object? purchasesCount = null,
    Object? pinned = null,
    Object? active = null,
    Object? originalPrice = freezed,
    Object? offerPrice = freezed,
    Object? images = freezed,
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
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as LightProviderModel?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionEn: freezed == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionAr: freezed == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseLimit: freezed == purchaseLimit
          ? _value.purchaseLimit
          : purchaseLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      currentViews: null == currentViews
          ? _value.currentViews
          : currentViews // ignore: cast_nullable_to_non_nullable
              as int,
      purchasesCount: null == purchasesCount
          ? _value.purchasesCount
          : purchasesCount // ignore: cast_nullable_to_non_nullable
              as int,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      originalPrice: freezed == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      offerPrice: freezed == offerPrice
          ? _value.offerPrice
          : offerPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightProviderModelCopyWith<$Res>? get provider {
    if (_value.provider == null) {
      return null;
    }

    return $LightProviderModelCopyWith<$Res>(_value.provider!, (value) {
      return _then(_value.copyWith(provider: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OfferModelImplCopyWith<$Res>
    implements $OfferModelCopyWith<$Res> {
  factory _$$OfferModelImplCopyWith(
          _$OfferModelImpl value, $Res Function(_$OfferModelImpl) then) =
      __$$OfferModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      LightProviderModel? provider,
      String? thumbnail,
      String? qrCode,
      String? nameEn,
      String? nameAr,
      String? descriptionEn,
      String? descriptionAr,
      int? purchaseLimit,
      int currentViews,
      int purchasesCount,
      bool pinned,
      bool active,
      double? originalPrice,
      double? offerPrice,
      List<String>? images});

  @override
  $LightProviderModelCopyWith<$Res>? get provider;
}

/// @nodoc
class __$$OfferModelImplCopyWithImpl<$Res>
    extends _$OfferModelCopyWithImpl<$Res, _$OfferModelImpl>
    implements _$$OfferModelImplCopyWith<$Res> {
  __$$OfferModelImplCopyWithImpl(
      _$OfferModelImpl _value, $Res Function(_$OfferModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? provider = freezed,
    Object? thumbnail = freezed,
    Object? qrCode = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? descriptionEn = freezed,
    Object? descriptionAr = freezed,
    Object? purchaseLimit = freezed,
    Object? currentViews = null,
    Object? purchasesCount = null,
    Object? pinned = null,
    Object? active = null,
    Object? originalPrice = freezed,
    Object? offerPrice = freezed,
    Object? images = freezed,
  }) {
    return _then(_$OfferModelImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as LightProviderModel?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionEn: freezed == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionAr: freezed == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseLimit: freezed == purchaseLimit
          ? _value.purchaseLimit
          : purchaseLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      currentViews: null == currentViews
          ? _value.currentViews
          : currentViews // ignore: cast_nullable_to_non_nullable
              as int,
      purchasesCount: null == purchasesCount
          ? _value.purchasesCount
          : purchasesCount // ignore: cast_nullable_to_non_nullable
              as int,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      originalPrice: freezed == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      offerPrice: freezed == offerPrice
          ? _value.offerPrice
          : offerPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferModelImpl implements _OfferModel {
  _$OfferModelImpl(
      {@TimestampSerializer() this.createdAt,
      this.id,
      this.provider,
      this.thumbnail,
      this.qrCode,
      this.nameEn,
      this.nameAr,
      this.descriptionEn,
      this.descriptionAr,
      this.purchaseLimit,
      this.currentViews = 0,
      this.purchasesCount = 0,
      this.pinned = false,
      this.active = false,
      this.originalPrice,
      this.offerPrice,
      this.images});

  factory _$OfferModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  String? id;
  @override
  LightProviderModel? provider;
  @override
  String? thumbnail;
  @override
  String? qrCode;
  @override
  String? nameEn;
  @override
  String? nameAr;
  @override
  String? descriptionEn;
  @override
  String? descriptionAr;
  @override
  int? purchaseLimit;
  @override
  @JsonKey()
  int currentViews;
  @override
  @JsonKey()
  int purchasesCount;
  @override
  @JsonKey()
  bool pinned;
  @override
  @JsonKey()
  bool active;
  @override
  double? originalPrice;
  @override
  double? offerPrice;
  @override
  List<String>? images;

  @override
  String toString() {
    return 'OfferModel(createdAt: $createdAt, id: $id, provider: $provider, thumbnail: $thumbnail, qrCode: $qrCode, nameEn: $nameEn, nameAr: $nameAr, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, purchaseLimit: $purchaseLimit, currentViews: $currentViews, purchasesCount: $purchasesCount, pinned: $pinned, active: $active, originalPrice: $originalPrice, offerPrice: $offerPrice, images: $images)';
  }

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferModelImplCopyWith<_$OfferModelImpl> get copyWith =>
      __$$OfferModelImplCopyWithImpl<_$OfferModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferModelImplToJson(
      this,
    );
  }
}

abstract class _OfferModel implements OfferModel {
  factory _OfferModel(
      {@TimestampSerializer() DateTime? createdAt,
      String? id,
      LightProviderModel? provider,
      String? thumbnail,
      String? qrCode,
      String? nameEn,
      String? nameAr,
      String? descriptionEn,
      String? descriptionAr,
      int? purchaseLimit,
      int currentViews,
      int purchasesCount,
      bool pinned,
      bool active,
      double? originalPrice,
      double? offerPrice,
      List<String>? images}) = _$OfferModelImpl;

  factory _OfferModel.fromJson(Map<String, dynamic> json) =
      _$OfferModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String? get id;
  set id(String? value);
  @override
  LightProviderModel? get provider;
  set provider(LightProviderModel? value);
  @override
  String? get thumbnail;
  set thumbnail(String? value);
  @override
  String? get qrCode;
  set qrCode(String? value);
  @override
  String? get nameEn;
  set nameEn(String? value);
  @override
  String? get nameAr;
  set nameAr(String? value);
  @override
  String? get descriptionEn;
  set descriptionEn(String? value);
  @override
  String? get descriptionAr;
  set descriptionAr(String? value);
  @override
  int? get purchaseLimit;
  set purchaseLimit(int? value);
  @override
  int get currentViews;
  set currentViews(int value);
  @override
  int get purchasesCount;
  set purchasesCount(int value);
  @override
  bool get pinned;
  set pinned(bool value);
  @override
  bool get active;
  set active(bool value);
  @override
  double? get originalPrice;
  set originalPrice(double? value);
  @override
  double? get offerPrice;
  set offerPrice(double? value);
  @override
  List<String>? get images;
  set images(List<String>? value);

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferModelImplCopyWith<_$OfferModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
