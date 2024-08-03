// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_order_with_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerOrderWithHistoryDto _$$_CustomerOrderWithHistoryDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerOrderWithHistoryDto(
      shopifyOrderId: json['shopifyOrderId'] as String,
      userId: json['userId'] as String,
      customerName: json['customerName'] as String,
      dealId: json['dealId'] as String,
      dealPrice: json['dealPrice'] as int,
      dealName: json['dealName'] as String,
      datePurchase: DateTime.parse(json['datePurchase'] as String),
      dateExpired: DateTime.parse(json['dateExpired'] as String),
      noOfCoupons: json['noOfCoupons'] as int,
      noOfCouponsRedeemed: json['noOfCouponsRedeemed'] as int,
      giftedCount: json['giftedCount'] as int,
      isGifted: json['isGifted'] as int,
      redemptionHistory: (json['redemptionHistory'] as List<dynamic>)
          .map((e) => RedemptionHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CustomerOrderWithHistoryDtoToJson(
        _$_CustomerOrderWithHistoryDto instance) =>
    <String, dynamic>{
      'shopifyOrderId': instance.shopifyOrderId,
      'userId': instance.userId,
      'customerName': instance.customerName,
      'dealId': instance.dealId,
      'dealPrice': instance.dealPrice,
      'dealName': instance.dealName,
      'datePurchase': instance.datePurchase.toIso8601String(),
      'dateExpired': instance.dateExpired.toIso8601String(),
      'noOfCoupons': instance.noOfCoupons,
      'noOfCouponsRedeemed': instance.noOfCouponsRedeemed,
      'giftedCount': instance.giftedCount,
      'isGifted': instance.isGifted,
      'redemptionHistory': instance.redemptionHistory,
    };

_$_RedemptionHistory _$$_RedemptionHistoryFromJson(Map<String, dynamic> json) =>
    _$_RedemptionHistory(
      isRedeemed: json['isRedeemed'] as bool,
      isGifted: json['isGifted'] as bool,
      isVerified: json['isVerified'] as bool,
      date: json['date'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$$_RedemptionHistoryToJson(
        _$_RedemptionHistory instance) =>
    <String, dynamic>{
      'isRedeemed': instance.isRedeemed,
      'isGifted': instance.isGifted,
      'isVerified': instance.isVerified,
      'date': instance.date,
      'time': instance.time,
    };
