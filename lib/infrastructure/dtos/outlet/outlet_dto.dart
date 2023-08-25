// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../brand/brand_dto.dart';

part 'outlet_dto.freezed.dart';
part 'outlet_dto.g.dart';

@freezed
class OutletDto with _$OutletDto {
  factory OutletDto({
    required String? id,
    required String? name,
    required String? description,
    required String? logo,
    required String? location,
    required String? latitude,
    required String? longitude,
    required double? distanceInMeters,
    required String? code,
    required BrandDto? brand
  }) = _OutletDto;

  factory OutletDto.fromJson(Map<String, dynamic> json) =>
      _$OutletDtoFromJson(json);
}
