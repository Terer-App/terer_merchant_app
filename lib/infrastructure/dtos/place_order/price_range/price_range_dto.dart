// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../max_variant_price/max_variant_price_dto.dart';

part 'price_range_dto.freezed.dart';
part 'price_range_dto.g.dart';

@freezed
class PriceRangeDto with _$PriceRangeDto {
  const factory PriceRangeDto({
    @JsonKey(name: 'maxVariantPrice')
        required MaxVariantPriceDto maxVariantPrice,
  }) = _PriceRangeDto;

  factory PriceRangeDto.fromJson(Map<String, dynamic> json) =>
      _$PriceRangeDtoFromJson(json);
}
