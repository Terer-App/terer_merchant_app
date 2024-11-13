// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:terer_merchant/infrastructure/dtos/place_order/outlet_product/product_variant/product_variant_dto.dart';

import '../featured_image/featured_image_dto.dart';
import '../price_range/price_range_dto.dart';

part 'outlet_product_dto.freezed.dart';
part 'outlet_product_dto.g.dart';

@freezed
class OutletProductDto with _$OutletProductDto {
  const factory OutletProductDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description',defaultValue: '') required String? description,
    @JsonKey(name: 'descriptionHtml', defaultValue: '') required String? descriptionHtml,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'availableForSale') required bool availableForSale,
    @JsonKey(name: 'featuredImage') required FeaturedImageDto featuredImage,
    @JsonKey(name: 'compareAtPriceRange')
        required PriceRangeDto compareAtPriceRange,
    @JsonKey(name: 'redemDuration') required dynamic redeemDuration,
    @JsonKey(name: 'priceRange') required PriceRangeDto priceRange,
    @JsonKey(name: 'sellerName') required dynamic sellerName,
    @JsonKey(name: 'variantId') required String variantId,
    @Default(0) int quantity,
    @JsonKey(name: 'variants', defaultValue: [])
    required List<ProductVariantDto> variants,
    @JsonKey(name: 'variantsAvailable', defaultValue: false)
    required bool variantsAvailable,
  }) = _OutletProductDto;

  factory OutletProductDto.fromJson(Map<String, dynamic> json) =>
      _$OutletProductDtoFromJson(json);
}
