import 'package:freezed_annotation/freezed_annotation.dart';
part 'routing_dto.freezed.dart';
part 'routing_dto.g.dart';

@freezed
class RoutingDto with _$RoutingDto {
  factory RoutingDto({
    required String route,
    required Map<String, String> queryParameters,
  }) = _RoutingDto;

  factory RoutingDto.initial({
    required String route,
    required Map<String, String> queryParameters,
  }) =>
      RoutingDto(
        queryParameters: queryParameters,
        route: route,
      );

  factory RoutingDto.fromJson(Map<String, dynamic> json) =>
      _$RoutingDtoFromJson(json);
}
