// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'merchant_deal_dto.freezed.dart';
part 'merchant_deal_dto.g.dart';

@freezed
class MerchantDealDto with _$MerchantDealDto {
  factory MerchantDealDto({
    @JsonKey(defaultValue: '') required String dealTitle,
    @JsonKey(defaultValue: '') required String imageUrl,
    @JsonKey(defaultValue: 0) required int totalDeals,
    @JsonKey(defaultValue: 0) required int balanceDeals,
    @JsonKey(defaultValue: 0) required int noOfredeemDeals,
    @JsonKey(defaultValue: 0) required int noOfDeals,
    @JsonKey(defaultValue: false) required bool isVerified,
    @JsonKey(defaultValue: '') required String orderId,
    @JsonKey(defaultValue: '') required String dealerId,
    @JsonKey(defaultValue: '') required String customerName,
    @JsonKey(defaultValue: '') required String customerEmail,
    @JsonKey(defaultValue: '') required String createdAt,
    @JsonKey(defaultValue: '') required String buyingDate,
    @JsonKey(defaultValue: '') required String buyingTime,
  }) = _MerchantDealDto;

  factory MerchantDealDto.fromJson(Map<String, dynamic> json) =>
      _$MerchantDealDtoFromJson(json);
}
