// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:hive/hive.dart';

import '../../price/price_dto.dart';

part 'product_variant_dto.freezed.dart';
part 'product_variant_dto.g.dart';

ProductVariantDto productProductVariantDtoFromJson(String str) =>
    ProductVariantDto.fromJson(json.decode(str));

String productVariantDtoVariantDtoToJson(ProductVariantDto data) =>
    json.encode(data.toJson());

@freezed
class ProductVariantDto with _$ProductVariantDto {
  const factory ProductVariantDto(
      {@JsonKey(name: 'id') required String id,
      @JsonKey(name: 'title') required String title,
      @JsonKey(defaultValue: false) required bool isSelected,
      @JsonKey(defaultValue: 1) required int quantity,
      @JsonKey(name: 'featuredImg') required String featuredImg,
      @JsonKey(name: 'price') required PriceDto price,
      @JsonKey(name: 'compareAtPrice') required PriceDto compareAtPrice,
      @JsonKey(name: 'productTitle') required String productTitle,
      @JsonKey(name: 'sku') String? sku,
      String? redemptionDuration}) = _ProductVariantDto;

  factory ProductVariantDto.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantDtoFromJson(json);
}
