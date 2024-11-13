// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'price_dto.freezed.dart';
part 'price_dto.g.dart';

@HiveType(typeId: 2)
@Freezed(makeCollectionsUnmodifiable: false)
class PriceDto with _$PriceDto {
  factory PriceDto({
    @HiveField(0) @JsonKey(name: 'amount') required String amount,
    @HiveField(1) @JsonKey(name: 'currencyCode') required String currencyCode,
  }) = _PriceDto;

  factory PriceDto.fromJson(Map<String, dynamic> json) =>
      _$PriceDtoFromJson(json);
}
