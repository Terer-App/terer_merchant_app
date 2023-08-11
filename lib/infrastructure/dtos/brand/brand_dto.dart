// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_dto.freezed.dart';
part 'brand_dto.g.dart';

@freezed
class BrandDto with _$BrandDto {
  factory BrandDto({
    required String id,
    required String name,
    required String logo,
    required String key,
    required String code,
   @JsonKey(defaultValue: '') String? description,
  }) = _BrandDto;

  factory BrandDto.fromJson(Map<String, dynamic> json) =>
      _$BrandDtoFromJson(json);
}
