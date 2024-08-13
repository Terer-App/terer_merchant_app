// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'outlet_product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OutletProductDto _$OutletProductDtoFromJson(Map<String, dynamic> json) {
  return _OutletProductDto.fromJson(json);
}

/// @nodoc
mixin _$OutletProductDto {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'availableForSale')
  bool get availableForSale => throw _privateConstructorUsedError;
  @JsonKey(name: 'featuredImage')
  FeaturedImageDto get featuredImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'compareAtPriceRange')
  PriceRangeDto get compareAtPriceRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'redemDuration')
  dynamic get redeemDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceRange')
  PriceRangeDto get priceRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'sellerName')
  dynamic get sellerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'variantId')
  String get variantId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OutletProductDtoCopyWith<OutletProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletProductDtoCopyWith<$Res> {
  factory $OutletProductDtoCopyWith(
          OutletProductDto value, $Res Function(OutletProductDto) then) =
      _$OutletProductDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'availableForSale') bool availableForSale,
      @JsonKey(name: 'featuredImage') FeaturedImageDto featuredImage,
      @JsonKey(name: 'compareAtPriceRange') PriceRangeDto compareAtPriceRange,
      @JsonKey(name: 'redemDuration') dynamic redeemDuration,
      @JsonKey(name: 'priceRange') PriceRangeDto priceRange,
      @JsonKey(name: 'sellerName') dynamic sellerName,
      @JsonKey(name: 'variantId') String variantId,
      int quantity});

  $FeaturedImageDtoCopyWith<$Res> get featuredImage;
  $PriceRangeDtoCopyWith<$Res> get compareAtPriceRange;
  $PriceRangeDtoCopyWith<$Res> get priceRange;
}

/// @nodoc
class _$OutletProductDtoCopyWithImpl<$Res>
    implements $OutletProductDtoCopyWith<$Res> {
  _$OutletProductDtoCopyWithImpl(this._value, this._then);

  final OutletProductDto _value;
  // ignore: unused_field
  final $Res Function(OutletProductDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? availableForSale = freezed,
    Object? featuredImage = freezed,
    Object? compareAtPriceRange = freezed,
    Object? redeemDuration = freezed,
    Object? priceRange = freezed,
    Object? sellerName = freezed,
    Object? variantId = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      availableForSale: availableForSale == freezed
          ? _value.availableForSale
          : availableForSale // ignore: cast_nullable_to_non_nullable
              as bool,
      featuredImage: featuredImage == freezed
          ? _value.featuredImage
          : featuredImage // ignore: cast_nullable_to_non_nullable
              as FeaturedImageDto,
      compareAtPriceRange: compareAtPriceRange == freezed
          ? _value.compareAtPriceRange
          : compareAtPriceRange // ignore: cast_nullable_to_non_nullable
              as PriceRangeDto,
      redeemDuration: redeemDuration == freezed
          ? _value.redeemDuration
          : redeemDuration // ignore: cast_nullable_to_non_nullable
              as dynamic,
      priceRange: priceRange == freezed
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as PriceRangeDto,
      sellerName: sellerName == freezed
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      variantId: variantId == freezed
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $FeaturedImageDtoCopyWith<$Res> get featuredImage {
    return $FeaturedImageDtoCopyWith<$Res>(_value.featuredImage, (value) {
      return _then(_value.copyWith(featuredImage: value));
    });
  }

  @override
  $PriceRangeDtoCopyWith<$Res> get compareAtPriceRange {
    return $PriceRangeDtoCopyWith<$Res>(_value.compareAtPriceRange, (value) {
      return _then(_value.copyWith(compareAtPriceRange: value));
    });
  }

  @override
  $PriceRangeDtoCopyWith<$Res> get priceRange {
    return $PriceRangeDtoCopyWith<$Res>(_value.priceRange, (value) {
      return _then(_value.copyWith(priceRange: value));
    });
  }
}

/// @nodoc
abstract class _$$_OutletProductDtoCopyWith<$Res>
    implements $OutletProductDtoCopyWith<$Res> {
  factory _$$_OutletProductDtoCopyWith(
          _$_OutletProductDto value, $Res Function(_$_OutletProductDto) then) =
      __$$_OutletProductDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'availableForSale') bool availableForSale,
      @JsonKey(name: 'featuredImage') FeaturedImageDto featuredImage,
      @JsonKey(name: 'compareAtPriceRange') PriceRangeDto compareAtPriceRange,
      @JsonKey(name: 'redemDuration') dynamic redeemDuration,
      @JsonKey(name: 'priceRange') PriceRangeDto priceRange,
      @JsonKey(name: 'sellerName') dynamic sellerName,
      @JsonKey(name: 'variantId') String variantId,
      int quantity});

  @override
  $FeaturedImageDtoCopyWith<$Res> get featuredImage;
  @override
  $PriceRangeDtoCopyWith<$Res> get compareAtPriceRange;
  @override
  $PriceRangeDtoCopyWith<$Res> get priceRange;
}

/// @nodoc
class __$$_OutletProductDtoCopyWithImpl<$Res>
    extends _$OutletProductDtoCopyWithImpl<$Res>
    implements _$$_OutletProductDtoCopyWith<$Res> {
  __$$_OutletProductDtoCopyWithImpl(
      _$_OutletProductDto _value, $Res Function(_$_OutletProductDto) _then)
      : super(_value, (v) => _then(v as _$_OutletProductDto));

  @override
  _$_OutletProductDto get _value => super._value as _$_OutletProductDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? availableForSale = freezed,
    Object? featuredImage = freezed,
    Object? compareAtPriceRange = freezed,
    Object? redeemDuration = freezed,
    Object? priceRange = freezed,
    Object? sellerName = freezed,
    Object? variantId = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_OutletProductDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      availableForSale: availableForSale == freezed
          ? _value.availableForSale
          : availableForSale // ignore: cast_nullable_to_non_nullable
              as bool,
      featuredImage: featuredImage == freezed
          ? _value.featuredImage
          : featuredImage // ignore: cast_nullable_to_non_nullable
              as FeaturedImageDto,
      compareAtPriceRange: compareAtPriceRange == freezed
          ? _value.compareAtPriceRange
          : compareAtPriceRange // ignore: cast_nullable_to_non_nullable
              as PriceRangeDto,
      redeemDuration: redeemDuration == freezed
          ? _value.redeemDuration
          : redeemDuration // ignore: cast_nullable_to_non_nullable
              as dynamic,
      priceRange: priceRange == freezed
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as PriceRangeDto,
      sellerName: sellerName == freezed
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      variantId: variantId == freezed
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OutletProductDto implements _OutletProductDto {
  const _$_OutletProductDto(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'description', defaultValue: '') required this.description,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'availableForSale') required this.availableForSale,
      @JsonKey(name: 'featuredImage') required this.featuredImage,
      @JsonKey(name: 'compareAtPriceRange') required this.compareAtPriceRange,
      @JsonKey(name: 'redemDuration') required this.redeemDuration,
      @JsonKey(name: 'priceRange') required this.priceRange,
      @JsonKey(name: 'sellerName') required this.sellerName,
      @JsonKey(name: 'variantId') required this.variantId,
      this.quantity = 0});

  factory _$_OutletProductDto.fromJson(Map<String, dynamic> json) =>
      _$$_OutletProductDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'availableForSale')
  final bool availableForSale;
  @override
  @JsonKey(name: 'featuredImage')
  final FeaturedImageDto featuredImage;
  @override
  @JsonKey(name: 'compareAtPriceRange')
  final PriceRangeDto compareAtPriceRange;
  @override
  @JsonKey(name: 'redemDuration')
  final dynamic redeemDuration;
  @override
  @JsonKey(name: 'priceRange')
  final PriceRangeDto priceRange;
  @override
  @JsonKey(name: 'sellerName')
  final dynamic sellerName;
  @override
  @JsonKey(name: 'variantId')
  final String variantId;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'OutletProductDto(id: $id, title: $title, description: $description, createdAt: $createdAt, availableForSale: $availableForSale, featuredImage: $featuredImage, compareAtPriceRange: $compareAtPriceRange, redeemDuration: $redeemDuration, priceRange: $priceRange, sellerName: $sellerName, variantId: $variantId, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OutletProductDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.availableForSale, availableForSale) &&
            const DeepCollectionEquality()
                .equals(other.featuredImage, featuredImage) &&
            const DeepCollectionEquality()
                .equals(other.compareAtPriceRange, compareAtPriceRange) &&
            const DeepCollectionEquality()
                .equals(other.redeemDuration, redeemDuration) &&
            const DeepCollectionEquality()
                .equals(other.priceRange, priceRange) &&
            const DeepCollectionEquality()
                .equals(other.sellerName, sellerName) &&
            const DeepCollectionEquality().equals(other.variantId, variantId) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(availableForSale),
      const DeepCollectionEquality().hash(featuredImage),
      const DeepCollectionEquality().hash(compareAtPriceRange),
      const DeepCollectionEquality().hash(redeemDuration),
      const DeepCollectionEquality().hash(priceRange),
      const DeepCollectionEquality().hash(sellerName),
      const DeepCollectionEquality().hash(variantId),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$$_OutletProductDtoCopyWith<_$_OutletProductDto> get copyWith =>
      __$$_OutletProductDtoCopyWithImpl<_$_OutletProductDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OutletProductDtoToJson(
      this,
    );
  }
}

abstract class _OutletProductDto implements OutletProductDto {
  const factory _OutletProductDto(
      {@JsonKey(name: 'id')
          required final String id,
      @JsonKey(name: 'title')
          required final String title,
      @JsonKey(name: 'description', defaultValue: '')
          required final String description,
      @JsonKey(name: 'createdAt')
          required final DateTime createdAt,
      @JsonKey(name: 'availableForSale')
          required final bool availableForSale,
      @JsonKey(name: 'featuredImage')
          required final FeaturedImageDto featuredImage,
      @JsonKey(name: 'compareAtPriceRange')
          required final PriceRangeDto compareAtPriceRange,
      @JsonKey(name: 'redemDuration')
          required final dynamic redeemDuration,
      @JsonKey(name: 'priceRange')
          required final PriceRangeDto priceRange,
      @JsonKey(name: 'sellerName')
          required final dynamic sellerName,
      @JsonKey(name: 'variantId')
          required final String variantId,
      final int quantity}) = _$_OutletProductDto;

  factory _OutletProductDto.fromJson(Map<String, dynamic> json) =
      _$_OutletProductDto.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'availableForSale')
  bool get availableForSale;
  @override
  @JsonKey(name: 'featuredImage')
  FeaturedImageDto get featuredImage;
  @override
  @JsonKey(name: 'compareAtPriceRange')
  PriceRangeDto get compareAtPriceRange;
  @override
  @JsonKey(name: 'redemDuration')
  dynamic get redeemDuration;
  @override
  @JsonKey(name: 'priceRange')
  PriceRangeDto get priceRange;
  @override
  @JsonKey(name: 'sellerName')
  dynamic get sellerName;
  @override
  @JsonKey(name: 'variantId')
  String get variantId;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_OutletProductDtoCopyWith<_$_OutletProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}
