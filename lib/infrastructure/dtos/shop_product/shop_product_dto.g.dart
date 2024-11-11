// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopProductDto _$$_ShopProductDtoFromJson(Map<String, dynamic> json) =>
    _$_ShopProductDto(
      id: json['id'] as String? ?? '',
      variantId: json['variantId'] as String? ?? '',
      brandLogo: json['brandLogo'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      descriptionHtml: json['descriptionHtml'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      sellerName: json['sellerName'] as String? ?? '',
      sellerAddress: json['sellerAddress'] as String? ?? '',
      sellerPhone: json['sellerPhone'] as String? ?? '',
      redeemDuration: json['redemDuration'] as String? ?? '',
      hours: json['hours'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      featuredImage: json['featuredImage'] as String? ?? '',
      priceRange: MinVariantPriceDto.fromJson(
          json['priceRange'] as Map<String, dynamic>),
      compareAtPriceRange: MinVariantPriceDto.fromJson(
          json['compareAtPriceRange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ShopProductDtoToJson(_$_ShopProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variantId': instance.variantId,
      'brandLogo': instance.brandLogo,
      'title': instance.title,
      'description': instance.description,
      'descriptionHtml': instance.descriptionHtml,
      'createdAt': instance.createdAt,
      'sellerName': instance.sellerName,
      'sellerAddress': instance.sellerAddress,
      'sellerPhone': instance.sellerPhone,
      'redemDuration': instance.redeemDuration,
      'hours': instance.hours,
      'images': instance.images,
      'featuredImage': instance.featuredImage,
      'priceRange': instance.priceRange,
      'compareAtPriceRange': instance.compareAtPriceRange,
    };
