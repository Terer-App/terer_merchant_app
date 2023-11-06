// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'featured_image_dto.freezed.dart';
part 'featured_image_dto.g.dart';

@freezed
class FeaturedImageDto with _$FeaturedImageDto {
    const factory FeaturedImageDto({
        @JsonKey(name: 'url')
        required String url,
    }) = _FeaturedImageDto;

    factory FeaturedImageDto.fromJson(Map<String, dynamic> json) =>
      _$FeaturedImageDtoFromJson(json);
}