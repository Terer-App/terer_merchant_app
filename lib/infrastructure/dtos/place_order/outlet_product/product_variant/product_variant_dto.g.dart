// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductVariantDto _$$_ProductVariantDtoFromJson(Map<String, dynamic> json) =>
    _$_ProductVariantDto(
      id: json['id'] as String,
      title: json['title'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
      quantity: json['quantity'] as int? ?? 1,
      featuredImg: json['featuredImg'] as String,
      price: PriceDto.fromJson(json['price'] as Map<String, dynamic>),
      compareAtPrice:
          PriceDto.fromJson(json['compareAtPrice'] as Map<String, dynamic>),
      productTitle: json['productTitle'] as String,
      sku: json['sku'] as String?,
      redemptionDuration: json['redemptionDuration'] as String?,
    );

Map<String, dynamic> _$$_ProductVariantDtoToJson(
        _$_ProductVariantDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isSelected': instance.isSelected,
      'quantity': instance.quantity,
      'featuredImg': instance.featuredImg,
      'price': instance.price,
      'compareAtPrice': instance.compareAtPrice,
      'productTitle': instance.productTitle,
      'sku': instance.sku,
      'redemptionDuration': instance.redemptionDuration,
    };
