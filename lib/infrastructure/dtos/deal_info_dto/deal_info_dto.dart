// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'deal_info_dto.freezed.dart';
part 'deal_info_dto.g.dart';

@freezed
class DealInfoDto with _$DealInfoDto {
  factory DealInfoDto({
    @JsonKey(defaultValue: '') required String dealName,
    @JsonKey(defaultValue: '') required String redeemDate,
    @JsonKey(defaultValue: '') required String redeemTime,
    @JsonKey(defaultValue: '') required String customerName,
    @JsonKey(defaultValue: 0) required int isItFreeDeal,
    @JsonKey(defaultValue: 1) required int redeemDeals,
  }) = _DealInfoDto;

  factory DealInfoDto.fromJson(Map<String, dynamic> json) =>
      _$DealInfoDtoFromJson(json);
}
