// To parse this JSON data, do
//
//     final customerOrderWithHistoryDto = customerOrderWithHistoryDtoFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'customer_order_with_history_dto.freezed.dart';
part 'customer_order_with_history_dto.g.dart';

CustomerOrderWithHistoryDto customerOrderWithHistoryDtoFromJson(String str) => CustomerOrderWithHistoryDto.fromJson(json.decode(str));

String customerOrderWithHistoryDtoToJson(CustomerOrderWithHistoryDto data) => json.encode(data.toJson());

@freezed
class CustomerOrderWithHistoryDto with _$CustomerOrderWithHistoryDto {
    const factory CustomerOrderWithHistoryDto({
        @JsonKey(name: 'shopifyOrderId')
        required String shopifyOrderId,
        @JsonKey(name: 'userId')
        required String userId,
        @JsonKey(name: 'customerName')
        required String customerName,
        @JsonKey(name: 'dealId')
        required String dealId,
        @JsonKey(name: 'dealPrice')
        required double dealPrice,
        @JsonKey(name: 'dealName')
        required String dealName,
        @JsonKey(name: 'datePurchase')
        required DateTime datePurchase,
        @JsonKey(name: 'dateExpired')
        required DateTime dateExpired,
        @JsonKey(name: 'noOfCoupons')
        required int noOfCoupons,
        @JsonKey(name: 'noOfCouponsRedeemed')
        required int noOfCouponsRedeemed,
        @JsonKey(name: 'giftedCount')
        required int giftedCount,
        @JsonKey(name: 'isGifted')
        required int isGifted,
        @JsonKey(name: 'redemptionHistory')
        required List<RedemptionHistory> redemptionHistory,
    }) = _CustomerOrderWithHistoryDto;

    factory CustomerOrderWithHistoryDto.fromJson(Map<String, dynamic> json) => _$CustomerOrderWithHistoryDtoFromJson(json);
}

@freezed
class RedemptionHistory with _$RedemptionHistory {
    const factory RedemptionHistory({
        @JsonKey(name: 'isRedeemed')
        required bool isRedeemed,
        @JsonKey(name: 'isGifted')
        required bool isGifted,
        @JsonKey(name: 'isVerified')
        required bool isVerified,
        @JsonKey(name: 'date')
        required String date,
        @JsonKey(name: 'time')
        required String time,
    }) = _RedemptionHistory;

    factory RedemptionHistory.fromJson(Map<String, dynamic> json) => _$RedemptionHistoryFromJson(json);
}
