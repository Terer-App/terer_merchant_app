// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../brand_dto.dart';
part 'brand_user_dto.freezed.dart';
part 'brand_user_dto.g.dart';

@freezed
class BrandUserDto with _$BrandUserDto {
  factory BrandUserDto({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String role,
    required BrandDto brand,
  }) = _BrandUserDto;

  factory BrandUserDto.fromJson(Map<String, dynamic> json) =>
      _$BrandUserDtoFromJson(json);
}
