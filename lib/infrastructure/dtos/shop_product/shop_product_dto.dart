// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../place_order/max_variant_price/max_variant_price_dto.dart';
import '../place_order/price_range/price_range_dto.dart';

part 'shop_product_dto.freezed.dart';
part 'shop_product_dto.g.dart';

@Freezed(
  makeCollectionsUnmodifiable: false
)
class ShopProductDto with _$ShopProductDto {
  factory ShopProductDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'variantId', defaultValue: '') required String variantId,
    @JsonKey(name: 'brandLogo', defaultValue: '') required String brandLogo,
    @JsonKey(name: 'title', defaultValue: '') required String title,
    @JsonKey(name: 'description', defaultValue: '')
        required String? description,
    @JsonKey(name: 'descriptionHtml', defaultValue: '')
        required String? descriptionHtml,
    @JsonKey(name: 'createdAt', defaultValue: '') required String? createdAt,
    @JsonKey(name: 'sellerName', defaultValue: '') required String sellerName,
    @JsonKey(name: 'sellerAddress', defaultValue: '')
        required String sellerAddress,
    @JsonKey(name: 'sellerPhone', defaultValue: '') required String sellerPhone,
    @JsonKey(name: 'redemDuration', defaultValue: '')
        required String redeemDuration,
    @JsonKey(name: 'hours', defaultValue: '') required String hours,
    @JsonKey(name: 'images', defaultValue: []) required List<String> images,
    @JsonKey(name: 'featuredImage', defaultValue: '')
        required String featuredImage,
    @JsonKey(name: 'priceRange') required MaxVariantPriceDto priceRange,
    @JsonKey(name: 'compareAtPriceRange') required MaxVariantPriceDto compareAtPriceRange,
  }) = _ShopProductDto;

  factory ShopProductDto.fromJson(Map<String, dynamic> json) =>
      _$ShopProductDtoFromJson(json);
}

extension ShopProductDtoExtension on ShopProductDto {
  static ShopProductDto parseRawDataToProductDTO(Map<String, dynamic> rawData) {
    List<String> images = [];
    if (rawData['images']?['nodes'] != null) {
      final List nodes = rawData['images']?['nodes'];
      for (int i = 0; i < nodes.length; i++) {
        images.add(nodes[i]['url']);
      }
    }
    Map<String, dynamic> parsedJson = {
      'id': rawData['id'],
      'brandLogo': rawData['brandLogo'] ?? '',
      'variantId': rawData['variantId'] ?? '',
      'title': rawData['title'] ?? '',
      'createdAt': rawData['createdAt'] ?? '',
      'description': rawData['description'] ?? '',
      'descriptionHtml': rawData['descriptionHtml'],
      'sellerName': (rawData['sellerName'] ?? {})['value'],
      'sellerAddress': (rawData['sellerAddress'] ?? {})['value'],
      'sellerPhone': (rawData['sellerPhone'] ?? {})['value'],
      'featuredImage': (rawData['featuredImage'] ?? {})['url'],
      'priceRange': (rawData['priceRange'] ?? {})['maxVariantPrice'],
      'compareAtPriceRange':
          (rawData['compareAtPriceRange'] ?? {})['maxVariantPrice'],
      'redemDuration': (rawData['redemDuration'] ?? {})['value'],
      'hours': (rawData['hours'] ?? {})['value'],
      'images': images
    };
    final ShopProductDto shopProduct = ShopProductDto.fromJson(parsedJson);
    return shopProduct;
  }

  static ShopProductDto parseRawDataToProductDTOFromService(
      Map<String, dynamic> rawData) {
    List<String> images = [];

    Map<String, dynamic> parsedJson = {
      'id': rawData['id'],
      'brandLogo': rawData['brandLogo'] ?? '',
      'title': rawData['title'] ?? '',
      'description': rawData['description'] ?? '',
      'descriptionHtml': rawData['descriptionHtml'],
      'sellerName': (rawData['sellerName'] ?? {})['value'],
      'sellerAddress': (rawData['sellerAddress'] ?? {})['value'],
      'sellerPhone': (rawData['sellerPhone'] ?? {})['value'],
      'featuredImage': (rawData['featuredImage'] ?? {})['url'],
      'priceRange': (rawData['priceRange'] ?? {})['maxVariantPrice'],
      'compareAtPriceRange':
          (rawData['compareAtPriceRange'] ?? {})['maxVariantPrice'],
      'hours': (rawData['hours'] ?? {})['value'],
      'images': []
    };
    final ShopProductDto shopProduct = ShopProductDto.fromJson(parsedJson);
    return shopProduct;
  }
}

