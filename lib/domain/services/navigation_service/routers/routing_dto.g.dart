// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoutingDto _$$_RoutingDtoFromJson(Map<String, dynamic> json) =>
    _$_RoutingDto(
      route: json['route'] as String,
      queryParameters: Map<String, String>.from(json['queryParameters'] as Map),
    );

Map<String, dynamic> _$$_RoutingDtoToJson(_$_RoutingDto instance) =>
    <String, dynamic>{
      'route': instance.route,
      'queryParameters': instance.queryParameters,
    };
