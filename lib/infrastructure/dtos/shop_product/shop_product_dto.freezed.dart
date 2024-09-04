// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopProductDto _$ShopProductDtoFromJson(Map<String, dynamic> json) {
  return _ShopProductDto.fromJson(json);
}

/// @nodoc
mixin _$ShopProductDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'variantId', defaultValue: '')
  String get variantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brandLogo', defaultValue: '')
  String get brandLogo => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'descriptionHtml', defaultValue: '')
  String? get descriptionHtml => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt', defaultValue: '')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'sellerName', defaultValue: '')
  String get sellerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sellerAddress', defaultValue: '')
  String get sellerAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'sellerPhone', defaultValue: '')
  String get sellerPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'redemDuration', defaultValue: '')
  String get redeemDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'hours', defaultValue: '')
  String get hours => throw _privateConstructorUsedError;
  @JsonKey(name: 'images', defaultValue: [])
  List<String> get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'featuredImage', defaultValue: '')
  String get featuredImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceRange')
  MaxVariantPriceDto get priceRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'compareAtPriceRange')
  MaxVariantPriceDto get compareAtPriceRange =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopProductDtoCopyWith<ShopProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopProductDtoCopyWith<$Res> {
  factory $ShopProductDtoCopyWith(
          ShopProductDto value, $Res Function(ShopProductDto) then) =
      _$ShopProductDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '')
          String id,
      @JsonKey(name: 'variantId', defaultValue: '')
          String variantId,
      @JsonKey(name: 'brandLogo', defaultValue: '')
          String brandLogo,
      @JsonKey(name: 'title', defaultValue: '')
          String title,
      @JsonKey(name: 'description', defaultValue: '')
          String? description,
      @JsonKey(name: 'descriptionHtml', defaultValue: '')
          String? descriptionHtml,
      @JsonKey(name: 'createdAt', defaultValue: '')
          String? createdAt,
      @JsonKey(name: 'sellerName', defaultValue: '')
          String sellerName,
      @JsonKey(name: 'sellerAddress', defaultValue: '')
          String sellerAddress,
      @JsonKey(name: 'sellerPhone', defaultValue: '')
          String sellerPhone,
      @JsonKey(name: 'redemDuration', defaultValue: '')
          String redeemDuration,
      @JsonKey(name: 'hours', defaultValue: '')
          String hours,
      @JsonKey(name: 'images', defaultValue: [])
          List<String> images,
      @JsonKey(name: 'featuredImage', defaultValue: '')
          String featuredImage,
      @JsonKey(name: 'priceRange')
          MaxVariantPriceDto priceRange,
      @JsonKey(name: 'compareAtPriceRange')
          MaxVariantPriceDto compareAtPriceRange});

  $MaxVariantPriceDtoCopyWith<$Res> get priceRange;
  $MaxVariantPriceDtoCopyWith<$Res> get compareAtPriceRange;
}

/// @nodoc
class _$ShopProductDtoCopyWithImpl<$Res>
    implements $ShopProductDtoCopyWith<$Res> {
  _$ShopProductDtoCopyWithImpl(this._value, this._then);

  final ShopProductDto _value;
  // ignore: unused_field
  final $Res Function(ShopProductDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? variantId = freezed,
    Object? brandLogo = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? descriptionHtml = freezed,
    Object? createdAt = freezed,
    Object? sellerName = freezed,
    Object? sellerAddress = freezed,
    Object? sellerPhone = freezed,
    Object? redeemDuration = freezed,
    Object? hours = freezed,
    Object? images = freezed,
    Object? featuredImage = freezed,
    Object? priceRange = freezed,
    Object? compareAtPriceRange = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: variantId == freezed
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String,
      brandLogo: brandLogo == freezed
          ? _value.brandLogo
          : brandLogo // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionHtml: descriptionHtml == freezed
          ? _value.descriptionHtml
          : descriptionHtml // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerName: sellerName == freezed
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      sellerAddress: sellerAddress == freezed
          ? _value.sellerAddress
          : sellerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      sellerPhone: sellerPhone == freezed
          ? _value.sellerPhone
          : sellerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      redeemDuration: redeemDuration == freezed
          ? _value.redeemDuration
          : redeemDuration // ignore: cast_nullable_to_non_nullable
              as String,
      hours: hours == freezed
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      featuredImage: featuredImage == freezed
          ? _value.featuredImage
          : featuredImage // ignore: cast_nullable_to_non_nullable
              as String,
      priceRange: priceRange == freezed
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as MaxVariantPriceDto,
      compareAtPriceRange: compareAtPriceRange == freezed
          ? _value.compareAtPriceRange
          : compareAtPriceRange // ignore: cast_nullable_to_non_nullable
              as MaxVariantPriceDto,
    ));
  }

  @override
  $MaxVariantPriceDtoCopyWith<$Res> get priceRange {
    return $MaxVariantPriceDtoCopyWith<$Res>(_value.priceRange, (value) {
      return _then(_value.copyWith(priceRange: value));
    });
  }

  @override
  $MaxVariantPriceDtoCopyWith<$Res> get compareAtPriceRange {
    return $MaxVariantPriceDtoCopyWith<$Res>(_value.compareAtPriceRange,
        (value) {
      return _then(_value.copyWith(compareAtPriceRange: value));
    });
  }
}

/// @nodoc
abstract class _$$_ShopProductDtoCopyWith<$Res>
    implements $ShopProductDtoCopyWith<$Res> {
  factory _$$_ShopProductDtoCopyWith(
          _$_ShopProductDto value, $Res Function(_$_ShopProductDto) then) =
      __$$_ShopProductDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '')
          String id,
      @JsonKey(name: 'variantId', defaultValue: '')
          String variantId,
      @JsonKey(name: 'brandLogo', defaultValue: '')
          String brandLogo,
      @JsonKey(name: 'title', defaultValue: '')
          String title,
      @JsonKey(name: 'description', defaultValue: '')
          String? description,
      @JsonKey(name: 'descriptionHtml', defaultValue: '')
          String? descriptionHtml,
      @JsonKey(name: 'createdAt', defaultValue: '')
          String? createdAt,
      @JsonKey(name: 'sellerName', defaultValue: '')
          String sellerName,
      @JsonKey(name: 'sellerAddress', defaultValue: '')
          String sellerAddress,
      @JsonKey(name: 'sellerPhone', defaultValue: '')
          String sellerPhone,
      @JsonKey(name: 'redemDuration', defaultValue: '')
          String redeemDuration,
      @JsonKey(name: 'hours', defaultValue: '')
          String hours,
      @JsonKey(name: 'images', defaultValue: [])
          List<String> images,
      @JsonKey(name: 'featuredImage', defaultValue: '')
          String featuredImage,
      @JsonKey(name: 'priceRange')
          MaxVariantPriceDto priceRange,
      @JsonKey(name: 'compareAtPriceRange')
          MaxVariantPriceDto compareAtPriceRange});

  @override
  $MaxVariantPriceDtoCopyWith<$Res> get priceRange;
  @override
  $MaxVariantPriceDtoCopyWith<$Res> get compareAtPriceRange;
}

/// @nodoc
class __$$_ShopProductDtoCopyWithImpl<$Res>
    extends _$ShopProductDtoCopyWithImpl<$Res>
    implements _$$_ShopProductDtoCopyWith<$Res> {
  __$$_ShopProductDtoCopyWithImpl(
      _$_ShopProductDto _value, $Res Function(_$_ShopProductDto) _then)
      : super(_value, (v) => _then(v as _$_ShopProductDto));

  @override
  _$_ShopProductDto get _value => super._value as _$_ShopProductDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? variantId = freezed,
    Object? brandLogo = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? descriptionHtml = freezed,
    Object? createdAt = freezed,
    Object? sellerName = freezed,
    Object? sellerAddress = freezed,
    Object? sellerPhone = freezed,
    Object? redeemDuration = freezed,
    Object? hours = freezed,
    Object? images = freezed,
    Object? featuredImage = freezed,
    Object? priceRange = freezed,
    Object? compareAtPriceRange = freezed,
  }) {
    return _then(_$_ShopProductDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: variantId == freezed
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String,
      brandLogo: brandLogo == freezed
          ? _value.brandLogo
          : brandLogo // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionHtml: descriptionHtml == freezed
          ? _value.descriptionHtml
          : descriptionHtml // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerName: sellerName == freezed
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      sellerAddress: sellerAddress == freezed
          ? _value.sellerAddress
          : sellerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      sellerPhone: sellerPhone == freezed
          ? _value.sellerPhone
          : sellerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      redeemDuration: redeemDuration == freezed
          ? _value.redeemDuration
          : redeemDuration // ignore: cast_nullable_to_non_nullable
              as String,
      hours: hours == freezed
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      featuredImage: featuredImage == freezed
          ? _value.featuredImage
          : featuredImage // ignore: cast_nullable_to_non_nullable
              as String,
      priceRange: priceRange == freezed
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as MaxVariantPriceDto,
      compareAtPriceRange: compareAtPriceRange == freezed
          ? _value.compareAtPriceRange
          : compareAtPriceRange // ignore: cast_nullable_to_non_nullable
              as MaxVariantPriceDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopProductDto implements _ShopProductDto {
  _$_ShopProductDto(
      {@JsonKey(name: 'id', defaultValue: '')
          required this.id,
      @JsonKey(name: 'variantId', defaultValue: '')
          required this.variantId,
      @JsonKey(name: 'brandLogo', defaultValue: '')
          required this.brandLogo,
      @JsonKey(name: 'title', defaultValue: '')
          required this.title,
      @JsonKey(name: 'description', defaultValue: '')
          required this.description,
      @JsonKey(name: 'descriptionHtml', defaultValue: '')
          required this.descriptionHtml,
      @JsonKey(name: 'createdAt', defaultValue: '')
          required this.createdAt,
      @JsonKey(name: 'sellerName', defaultValue: '')
          required this.sellerName,
      @JsonKey(name: 'sellerAddress', defaultValue: '')
          required this.sellerAddress,
      @JsonKey(name: 'sellerPhone', defaultValue: '')
          required this.sellerPhone,
      @JsonKey(name: 'redemDuration', defaultValue: '')
          required this.redeemDuration,
      @JsonKey(name: 'hours', defaultValue: '')
          required this.hours,
      @JsonKey(name: 'images', defaultValue: [])
          required this.images,
      @JsonKey(name: 'featuredImage', defaultValue: '')
          required this.featuredImage,
      @JsonKey(name: 'priceRange')
          required this.priceRange,
      @JsonKey(name: 'compareAtPriceRange')
          required this.compareAtPriceRange});

  factory _$_ShopProductDto.fromJson(Map<String, dynamic> json) =>
      _$$_ShopProductDtoFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'variantId', defaultValue: '')
  final String variantId;
  @override
  @JsonKey(name: 'brandLogo', defaultValue: '')
  final String brandLogo;
  @override
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String? description;
  @override
  @JsonKey(name: 'descriptionHtml', defaultValue: '')
  final String? descriptionHtml;
  @override
  @JsonKey(name: 'createdAt', defaultValue: '')
  final String? createdAt;
  @override
  @JsonKey(name: 'sellerName', defaultValue: '')
  final String sellerName;
  @override
  @JsonKey(name: 'sellerAddress', defaultValue: '')
  final String sellerAddress;
  @override
  @JsonKey(name: 'sellerPhone', defaultValue: '')
  final String sellerPhone;
  @override
  @JsonKey(name: 'redemDuration', defaultValue: '')
  final String redeemDuration;
  @override
  @JsonKey(name: 'hours', defaultValue: '')
  final String hours;
  @override
  @JsonKey(name: 'images', defaultValue: [])
  final List<String> images;
  @override
  @JsonKey(name: 'featuredImage', defaultValue: '')
  final String featuredImage;
  @override
  @JsonKey(name: 'priceRange')
  final MaxVariantPriceDto priceRange;
  @override
  @JsonKey(name: 'compareAtPriceRange')
  final MaxVariantPriceDto compareAtPriceRange;

  @override
  String toString() {
    return 'ShopProductDto(id: $id, variantId: $variantId, brandLogo: $brandLogo, title: $title, description: $description, descriptionHtml: $descriptionHtml, createdAt: $createdAt, sellerName: $sellerName, sellerAddress: $sellerAddress, sellerPhone: $sellerPhone, redeemDuration: $redeemDuration, hours: $hours, images: $images, featuredImage: $featuredImage, priceRange: $priceRange, compareAtPriceRange: $compareAtPriceRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopProductDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.variantId, variantId) &&
            const DeepCollectionEquality().equals(other.brandLogo, brandLogo) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.descriptionHtml, descriptionHtml) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.sellerName, sellerName) &&
            const DeepCollectionEquality()
                .equals(other.sellerAddress, sellerAddress) &&
            const DeepCollectionEquality()
                .equals(other.sellerPhone, sellerPhone) &&
            const DeepCollectionEquality()
                .equals(other.redeemDuration, redeemDuration) &&
            const DeepCollectionEquality().equals(other.hours, hours) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            const DeepCollectionEquality()
                .equals(other.featuredImage, featuredImage) &&
            const DeepCollectionEquality()
                .equals(other.priceRange, priceRange) &&
            const DeepCollectionEquality()
                .equals(other.compareAtPriceRange, compareAtPriceRange));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(variantId),
      const DeepCollectionEquality().hash(brandLogo),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(descriptionHtml),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(sellerName),
      const DeepCollectionEquality().hash(sellerAddress),
      const DeepCollectionEquality().hash(sellerPhone),
      const DeepCollectionEquality().hash(redeemDuration),
      const DeepCollectionEquality().hash(hours),
      const DeepCollectionEquality().hash(images),
      const DeepCollectionEquality().hash(featuredImage),
      const DeepCollectionEquality().hash(priceRange),
      const DeepCollectionEquality().hash(compareAtPriceRange));

  @JsonKey(ignore: true)
  @override
  _$$_ShopProductDtoCopyWith<_$_ShopProductDto> get copyWith =>
      __$$_ShopProductDtoCopyWithImpl<_$_ShopProductDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopProductDtoToJson(
      this,
    );
  }
}

abstract class _ShopProductDto implements ShopProductDto {
  factory _ShopProductDto(
          {@JsonKey(name: 'id', defaultValue: '')
              required final String id,
          @JsonKey(name: 'variantId', defaultValue: '')
              required final String variantId,
          @JsonKey(name: 'brandLogo', defaultValue: '')
              required final String brandLogo,
          @JsonKey(name: 'title', defaultValue: '')
              required final String title,
          @JsonKey(name: 'description', defaultValue: '')
              required final String? description,
          @JsonKey(name: 'descriptionHtml', defaultValue: '')
              required final String? descriptionHtml,
          @JsonKey(name: 'createdAt', defaultValue: '')
              required final String? createdAt,
          @JsonKey(name: 'sellerName', defaultValue: '')
              required final String sellerName,
          @JsonKey(name: 'sellerAddress', defaultValue: '')
              required final String sellerAddress,
          @JsonKey(name: 'sellerPhone', defaultValue: '')
              required final String sellerPhone,
          @JsonKey(name: 'redemDuration', defaultValue: '')
              required final String redeemDuration,
          @JsonKey(name: 'hours', defaultValue: '')
              required final String hours,
          @JsonKey(name: 'images', defaultValue: [])
              required final List<String> images,
          @JsonKey(name: 'featuredImage', defaultValue: '')
              required final String featuredImage,
          @JsonKey(name: 'priceRange')
              required final MaxVariantPriceDto priceRange,
          @JsonKey(name: 'compareAtPriceRange')
              required final MaxVariantPriceDto compareAtPriceRange}) =
      _$_ShopProductDto;

  factory _ShopProductDto.fromJson(Map<String, dynamic> json) =
      _$_ShopProductDto.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'variantId', defaultValue: '')
  String get variantId;
  @override
  @JsonKey(name: 'brandLogo', defaultValue: '')
  String get brandLogo;
  @override
  @JsonKey(name: 'title', defaultValue: '')
  String get title;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String? get description;
  @override
  @JsonKey(name: 'descriptionHtml', defaultValue: '')
  String? get descriptionHtml;
  @override
  @JsonKey(name: 'createdAt', defaultValue: '')
  String? get createdAt;
  @override
  @JsonKey(name: 'sellerName', defaultValue: '')
  String get sellerName;
  @override
  @JsonKey(name: 'sellerAddress', defaultValue: '')
  String get sellerAddress;
  @override
  @JsonKey(name: 'sellerPhone', defaultValue: '')
  String get sellerPhone;
  @override
  @JsonKey(name: 'redemDuration', defaultValue: '')
  String get redeemDuration;
  @override
  @JsonKey(name: 'hours', defaultValue: '')
  String get hours;
  @override
  @JsonKey(name: 'images', defaultValue: [])
  List<String> get images;
  @override
  @JsonKey(name: 'featuredImage', defaultValue: '')
  String get featuredImage;
  @override
  @JsonKey(name: 'priceRange')
  MaxVariantPriceDto get priceRange;
  @override
  @JsonKey(name: 'compareAtPriceRange')
  MaxVariantPriceDto get compareAtPriceRange;
  @override
  @JsonKey(ignore: true)
  _$$_ShopProductDtoCopyWith<_$_ShopProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}
