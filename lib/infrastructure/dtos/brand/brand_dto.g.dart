// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BrandDto _$$_BrandDtoFromJson(Map<String, dynamic> json) => _$_BrandDto(
      id: json['id'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
      key: json['key'] as String,
      code: json['code'] as String,
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$_BrandDtoToJson(_$_BrandDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'key': instance.key,
      'code': instance.code,
      'description': instance.description,
    };
