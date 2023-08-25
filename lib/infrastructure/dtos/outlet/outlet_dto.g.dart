// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OutletDto _$$_OutletDtoFromJson(Map<String, dynamic> json) => _$_OutletDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      logo: json['logo'] as String?,
      location: json['location'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      distanceInMeters: (json['distanceInMeters'] as num?)?.toDouble(),
      code: json['code'] as String?,
      brand: json['brand'] == null
          ? null
          : BrandDto.fromJson(json['brand'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OutletDtoToJson(_$_OutletDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'logo': instance.logo,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distanceInMeters': instance.distanceInMeters,
      'code': instance.code,
      'brand': instance.brand,
    };
