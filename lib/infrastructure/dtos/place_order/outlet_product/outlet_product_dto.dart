// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../featured_image/featured_image_dto.dart';
import '../price_range/price_range_dto.dart';

part 'outlet_product_dto.freezed.dart';
part 'outlet_product_dto.g.dart';

@freezed
class OutletProductDto with _$OutletProductDto {
  const factory OutletProductDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') required String description,
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
  }) = _OutletProductDto;

  factory OutletProductDto.fromJson(Map<String, dynamic> json) =>
      _$OutletProductDtoFromJson(json);
}
