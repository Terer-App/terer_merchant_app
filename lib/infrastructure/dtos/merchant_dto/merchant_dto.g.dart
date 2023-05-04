// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MerchantDto _$$_MerchantDtoFromJson(Map<String, dynamic> json) =>
    _$_MerchantDto(
      shopName: json['shopName'] as String? ?? '',
      shopAddress: json['shopAddress'] as String? ?? '',
      shopPhone: json['shopPhone'] as String? ?? '',
      shopEmail: json['shopEmail'] as String? ?? '',
    );

Map<String, dynamic> _$$_MerchantDtoToJson(_$_MerchantDto instance) =>
    <String, dynamic>{
      'shopName': instance.shopName,
      'shopAddress': instance.shopAddress,
      'shopPhone': instance.shopPhone,
      'shopEmail': instance.shopEmail,
    };
