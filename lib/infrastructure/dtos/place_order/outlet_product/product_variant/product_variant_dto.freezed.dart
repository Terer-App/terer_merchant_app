// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_variant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductVariantDto _$ProductVariantDtoFromJson(Map<String, dynamic> json) {
  return _ProductVariantDto.fromJson(json);
}

/// @nodoc
mixin _$ProductVariantDto {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isSelected => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 1)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'featuredImg')
  String get featuredImg => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  PriceDto get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'compareAtPrice')
  PriceDto get compareAtPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'productTitle')
  String get productTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'sku')
  String? get sku => throw _privateConstructorUsedError;
  String? get redemptionDuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductVariantDtoCopyWith<ProductVariantDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantDtoCopyWith<$Res> {
  factory $ProductVariantDtoCopyWith(
          ProductVariantDto value, $Res Function(ProductVariantDto) then) =
      _$ProductVariantDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(defaultValue: false) bool isSelected,
      @JsonKey(defaultValue: 1) int quantity,
      @JsonKey(name: 'featuredImg') String featuredImg,
      @JsonKey(name: 'price') PriceDto price,
      @JsonKey(name: 'compareAtPrice') PriceDto compareAtPrice,
      @JsonKey(name: 'productTitle') String productTitle,
      @JsonKey(name: 'sku') String? sku,
      String? redemptionDuration});

  $PriceDtoCopyWith<$Res> get price;
  $PriceDtoCopyWith<$Res> get compareAtPrice;
}

/// @nodoc
class _$ProductVariantDtoCopyWithImpl<$Res>
    implements $ProductVariantDtoCopyWith<$Res> {
  _$ProductVariantDtoCopyWithImpl(this._value, this._then);

  final ProductVariantDto _value;
  // ignore: unused_field
  final $Res Function(ProductVariantDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? isSelected = freezed,
    Object? quantity = freezed,
    Object? featuredImg = freezed,
    Object? price = freezed,
    Object? compareAtPrice = freezed,
    Object? productTitle = freezed,
    Object? sku = freezed,
    Object? redemptionDuration = freezed,
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
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      featuredImg: featuredImg == freezed
          ? _value.featuredImg
          : featuredImg // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceDto,
      compareAtPrice: compareAtPrice == freezed
          ? _value.compareAtPrice
          : compareAtPrice // ignore: cast_nullable_to_non_nullable
              as PriceDto,
      productTitle: productTitle == freezed
          ? _value.productTitle
          : productTitle // ignore: cast_nullable_to_non_nullable
              as String,
      sku: sku == freezed
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      redemptionDuration: redemptionDuration == freezed
          ? _value.redemptionDuration
          : redemptionDuration // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $PriceDtoCopyWith<$Res> get price {
    return $PriceDtoCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value));
    });
  }

  @override
  $PriceDtoCopyWith<$Res> get compareAtPrice {
    return $PriceDtoCopyWith<$Res>(_value.compareAtPrice, (value) {
      return _then(_value.copyWith(compareAtPrice: value));
    });
  }
}

/// @nodoc
abstract class _$$_ProductVariantDtoCopyWith<$Res>
    implements $ProductVariantDtoCopyWith<$Res> {
  factory _$$_ProductVariantDtoCopyWith(_$_ProductVariantDto value,
          $Res Function(_$_ProductVariantDto) then) =
      __$$_ProductVariantDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(defaultValue: false) bool isSelected,
      @JsonKey(defaultValue: 1) int quantity,
      @JsonKey(name: 'featuredImg') String featuredImg,
      @JsonKey(name: 'price') PriceDto price,
      @JsonKey(name: 'compareAtPrice') PriceDto compareAtPrice,
      @JsonKey(name: 'productTitle') String productTitle,
      @JsonKey(name: 'sku') String? sku,
      String? redemptionDuration});

  @override
  $PriceDtoCopyWith<$Res> get price;
  @override
  $PriceDtoCopyWith<$Res> get compareAtPrice;
}

/// @nodoc
class __$$_ProductVariantDtoCopyWithImpl<$Res>
    extends _$ProductVariantDtoCopyWithImpl<$Res>
    implements _$$_ProductVariantDtoCopyWith<$Res> {
  __$$_ProductVariantDtoCopyWithImpl(
      _$_ProductVariantDto _value, $Res Function(_$_ProductVariantDto) _then)
      : super(_value, (v) => _then(v as _$_ProductVariantDto));

  @override
  _$_ProductVariantDto get _value => super._value as _$_ProductVariantDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? isSelected = freezed,
    Object? quantity = freezed,
    Object? featuredImg = freezed,
    Object? price = freezed,
    Object? compareAtPrice = freezed,
    Object? productTitle = freezed,
    Object? sku = freezed,
    Object? redemptionDuration = freezed,
  }) {
    return _then(_$_ProductVariantDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      featuredImg: featuredImg == freezed
          ? _value.featuredImg
          : featuredImg // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceDto,
      compareAtPrice: compareAtPrice == freezed
          ? _value.compareAtPrice
          : compareAtPrice // ignore: cast_nullable_to_non_nullable
              as PriceDto,
      productTitle: productTitle == freezed
          ? _value.productTitle
          : productTitle // ignore: cast_nullable_to_non_nullable
              as String,
      sku: sku == freezed
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      redemptionDuration: redemptionDuration == freezed
          ? _value.redemptionDuration
          : redemptionDuration // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductVariantDto implements _ProductVariantDto {
  const _$_ProductVariantDto(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(defaultValue: false) required this.isSelected,
      @JsonKey(defaultValue: 1) required this.quantity,
      @JsonKey(name: 'featuredImg') required this.featuredImg,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'compareAtPrice') required this.compareAtPrice,
      @JsonKey(name: 'productTitle') required this.productTitle,
      @JsonKey(name: 'sku') this.sku,
      this.redemptionDuration});

  factory _$_ProductVariantDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProductVariantDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(defaultValue: false)
  final bool isSelected;
  @override
  @JsonKey(defaultValue: 1)
  final int quantity;
  @override
  @JsonKey(name: 'featuredImg')
  final String featuredImg;
  @override
  @JsonKey(name: 'price')
  final PriceDto price;
  @override
  @JsonKey(name: 'compareAtPrice')
  final PriceDto compareAtPrice;
  @override
  @JsonKey(name: 'productTitle')
  final String productTitle;
  @override
  @JsonKey(name: 'sku')
  final String? sku;
  @override
  final String? redemptionDuration;

  @override
  String toString() {
    return 'ProductVariantDto(id: $id, title: $title, isSelected: $isSelected, quantity: $quantity, featuredImg: $featuredImg, price: $price, compareAtPrice: $compareAtPrice, productTitle: $productTitle, sku: $sku, redemptionDuration: $redemptionDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductVariantDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.isSelected, isSelected) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality()
                .equals(other.featuredImg, featuredImg) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.compareAtPrice, compareAtPrice) &&
            const DeepCollectionEquality()
                .equals(other.productTitle, productTitle) &&
            const DeepCollectionEquality().equals(other.sku, sku) &&
            const DeepCollectionEquality()
                .equals(other.redemptionDuration, redemptionDuration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(isSelected),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(featuredImg),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(compareAtPrice),
      const DeepCollectionEquality().hash(productTitle),
      const DeepCollectionEquality().hash(sku),
      const DeepCollectionEquality().hash(redemptionDuration));

  @JsonKey(ignore: true)
  @override
  _$$_ProductVariantDtoCopyWith<_$_ProductVariantDto> get copyWith =>
      __$$_ProductVariantDtoCopyWithImpl<_$_ProductVariantDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductVariantDtoToJson(
      this,
    );
  }
}

abstract class _ProductVariantDto implements ProductVariantDto {
  const factory _ProductVariantDto(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'title') required final String title,
      @JsonKey(defaultValue: false) required final bool isSelected,
      @JsonKey(defaultValue: 1) required final int quantity,
      @JsonKey(name: 'featuredImg') required final String featuredImg,
      @JsonKey(name: 'price') required final PriceDto price,
      @JsonKey(name: 'compareAtPrice') required final PriceDto compareAtPrice,
      @JsonKey(name: 'productTitle') required final String productTitle,
      @JsonKey(name: 'sku') final String? sku,
      final String? redemptionDuration}) = _$_ProductVariantDto;

  factory _ProductVariantDto.fromJson(Map<String, dynamic> json) =
      _$_ProductVariantDto.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(defaultValue: false)
  bool get isSelected;
  @override
  @JsonKey(defaultValue: 1)
  int get quantity;
  @override
  @JsonKey(name: 'featuredImg')
  String get featuredImg;
  @override
  @JsonKey(name: 'price')
  PriceDto get price;
  @override
  @JsonKey(name: 'compareAtPrice')
  PriceDto get compareAtPrice;
  @override
  @JsonKey(name: 'productTitle')
  String get productTitle;
  @override
  @JsonKey(name: 'sku')
  String? get sku;
  @override
  String? get redemptionDuration;
  @override
  @JsonKey(ignore: true)
  _$$_ProductVariantDtoCopyWith<_$_ProductVariantDto> get copyWith =>
      throw _privateConstructorUsedError;
}
