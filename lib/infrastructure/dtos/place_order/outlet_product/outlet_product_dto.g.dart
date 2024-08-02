// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OutletProductDto _$$_OutletProductDtoFromJson(Map<String, dynamic> json) =>
    _$_OutletProductDto(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      availableForSale: json['availableForSale'] as bool,
      featuredImage: FeaturedImageDto.fromJson(
          json['featuredImage'] as Map<String, dynamic>),
      compareAtPriceRange: PriceRangeDto.fromJson(
          json['compareAtPriceRange'] as Map<String, dynamic>),
      redeemDuration: json['redemDuration'],
      priceRange:
          PriceRangeDto.fromJson(json['priceRange'] as Map<String, dynamic>),
      sellerName: json['sellerName'],
      variantId: json['variantId'] as String,
      quantity: json['quantity'] as int? ?? 0,
    );

Map<String, dynamic> _$$_OutletProductDtoToJson(_$_OutletProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'availableForSale': instance.availableForSale,
      'featuredImage': instance.featuredImage,
      'compareAtPriceRange': instance.compareAtPriceRange,
      'redemDuration': instance.redeemDuration,
      'priceRange': instance.priceRange,
      'sellerName': instance.sellerName,
      'variantId': instance.variantId,
      'quantity': instance.quantity,
    };
