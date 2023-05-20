// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'merchant_dto.freezed.dart';
part 'merchant_dto.g.dart';

@freezed
class MerchantDto with _$MerchantDto {
  factory MerchantDto({
    @JsonKey(defaultValue: '') String? shopName,
    @JsonKey(defaultValue: '') String? shopAddress,
    @JsonKey(defaultValue: '') String? shopPhone,
    @JsonKey(defaultValue: '') String? shopEmail,
    @JsonKey(defaultValue: '') String? phone,
    @JsonKey(defaultValue: '') String? code,
  }) = _MerchantDto;

  factory MerchantDto.fromJson(Map<String, dynamic> json) =>
      _$MerchantDtoFromJson(json);
}
