// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'max_variant_price_dto.freezed.dart';
part 'max_variant_price_dto.g.dart';

@freezed
class MinVariantPriceDto with _$MinVariantPriceDto {
  const factory MinVariantPriceDto({
    @JsonKey(name: 'amount') required String amount,
    @JsonKey(name: 'currencyCode') required String currencyCode,
  }) = _MinVariantPriceDto;

  factory MinVariantPriceDto.fromJson(Map<String, dynamic> json) =>
      _$MinVariantPriceDtoFromJson(json);
}
