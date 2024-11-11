// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brought_deal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BroughtDealDto _$$_BroughtDealDtoFromJson(Map<String, dynamic> json) =>
    _$_BroughtDealDto(
      shopifyOrderId: json['shopifyOrderId'] as String,
      invoiceNumber: json['invoiceNumber'] as String,
      userId: json['userId'] as String,
      customerName: json['customerName'] as String,
      dealId: json['dealId'] as String,
      dealName: json['dealName'] as String,
      dealPrice: (json['dealPrice'] as num?)?.toDouble(),
      dealQuantity: json['dealQuantity'] as int?,
      datePurchase: DateTime.parse(json['datePurchase'] as String),
      dateExpired: DateTime.parse(json['dateExpired'] as String),
      noOfCoupons: json['noOfCoupons'] as int,
      noOfCouponsRedeemed: json['noOfCouponsRedeemed'] as int,
      giftedCount: json['giftedCount'] as int,
      isGifted: json['isGifted'] as int,
      isPaid: json['isPaid'] as int? ?? 0,
      lastRedeemedAt: json['lastRedeemedAt'] as String?,
    );

Map<String, dynamic> _$$_BroughtDealDtoToJson(_$_BroughtDealDto instance) =>
    <String, dynamic>{
      'shopifyOrderId': instance.shopifyOrderId,
      'invoiceNumber': instance.invoiceNumber,
      'userId': instance.userId,
      'customerName': instance.customerName,
      'dealId': instance.dealId,
      'dealName': instance.dealName,
      'dealPrice': instance.dealPrice,
      'dealQuantity': instance.dealQuantity,
      'datePurchase': instance.datePurchase.toIso8601String(),
      'dateExpired': instance.dateExpired.toIso8601String(),
      'noOfCoupons': instance.noOfCoupons,
      'noOfCouponsRedeemed': instance.noOfCouponsRedeemed,
      'giftedCount': instance.giftedCount,
      'isGifted': instance.isGifted,
      'isPaid': instance.isPaid,
      'lastRedeemedAt': instance.lastRedeemedAt,
    };
