// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BrandUserDto _$$_BrandUserDtoFromJson(Map<String, dynamic> json) =>
    _$_BrandUserDto(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      role: json['role'] as String,
      brand: BrandDto.fromJson(json['brand'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BrandUserDtoToJson(_$_BrandUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'role': instance.role,
      'brand': instance.brand,
    };
