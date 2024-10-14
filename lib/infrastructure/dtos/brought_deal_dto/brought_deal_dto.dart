// To parse this JSON data, do
//
//     final broughtDealDto = broughtDealDtoFromJson(jsonString);

// ignore_for_file: prefer_single_quotes, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'brought_deal_dto.freezed.dart';
part 'brought_deal_dto.g.dart';

BroughtDealDto broughtDealDtoFromJson(String str) => BroughtDealDto.fromJson(json.decode(str));

String broughtDealDtoToJson(BroughtDealDto data) => json.encode(data.toJson());

@freezed
class BroughtDealDto with _$BroughtDealDto {
    const factory BroughtDealDto({
        @JsonKey(name: "shopifyOrderId")
        required String shopifyOrderId,
        @JsonKey(name: "invoiceNumber")
        required String invoiceNumber,
        @JsonKey(name: "userId")
        required String userId,
        @JsonKey(name: "customerName")
        required String customerName,
        @JsonKey(name: "dealId")
        required String dealId,
        @JsonKey(name: "dealName")
        required String dealName,
        @JsonKey(name: "dealPrice")
        required double? dealPrice,
        @JsonKey(name: "datePurchase")
        required DateTime datePurchase,
        @JsonKey(name: "dateExpired")
        required DateTime dateExpired,
        @JsonKey(name: "noOfCoupons")
        required int noOfCoupons,
        @JsonKey(name: "noOfCouponsRedeemed")
        required int noOfCouponsRedeemed,
        @JsonKey(name: "giftedCount")
        required int giftedCount,
        @JsonKey(name: "isGifted")
        required int isGifted,
        @JsonKey(name: "isPaid",defaultValue: 0)
        required int? isPaid,
        @JsonKey(name: "lastRedeemedAt")
        required String? lastRedeemedAt,
    }) = _BroughtDealDto;

    factory BroughtDealDto.fromJson(Map<String, dynamic> json) => _$BroughtDealDtoFromJson(json);
}
