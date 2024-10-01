// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'max_variant_price_dto.freezed.dart';
part 'max_variant_price_dto.g.dart';

@freezed
class MaxVariantPriceDto with _$MaxVariantPriceDto {
  const factory MaxVariantPriceDto({
    @JsonKey(name: 'amount') required String amount,
    @JsonKey(name: 'currencyCode') required String currencyCode,
  }) = _MaxVariantPriceDto;

  factory MaxVariantPriceDto.fromJson(Map<String, dynamic> json) =>
      _$MaxVariantPriceDtoFromJson(json);
}
