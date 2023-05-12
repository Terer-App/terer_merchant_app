// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_deal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MerchantDealDto _$$_MerchantDealDtoFromJson(Map<String, dynamic> json) =>
    _$_MerchantDealDto(
      dealTitle: json['dealTitle'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      totalDeals: json['totalDeals'] as int? ?? 0,
      balanceDeals: json['balanceDeals'] as int? ?? 0,
      noOfredeemDeals: json['noOfredeemDeals'] as int? ?? 0,
      noOfDeals: json['noOfDeals'] as int? ?? 0,
      isVerified: json['isVerified'] as bool? ?? false,
      orderId: json['orderId'] as String? ?? '',
      dealerId: json['dealerId'] as String? ?? '',
      customerName: json['customerName'] as String? ?? '',
      customerEmail: json['customerEmail'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      buyingDate: json['buyingDate'] as String? ?? '',
      buyingTime: json['buyingTime'] as String? ?? '',
    );

Map<String, dynamic> _$$_MerchantDealDtoToJson(_$_MerchantDealDto instance) =>
    <String, dynamic>{
      'dealTitle': instance.dealTitle,
      'imageUrl': instance.imageUrl,
      'totalDeals': instance.totalDeals,
      'balanceDeals': instance.balanceDeals,
      'noOfredeemDeals': instance.noOfredeemDeals,
      'noOfDeals': instance.noOfDeals,
      'isVerified': instance.isVerified,
      'orderId': instance.orderId,
      'dealerId': instance.dealerId,
      'customerName': instance.customerName,
      'customerEmail': instance.customerEmail,
      'createdAt': instance.createdAt,
      'buyingDate': instance.buyingDate,
      'buyingTime': instance.buyingTime,
    };
