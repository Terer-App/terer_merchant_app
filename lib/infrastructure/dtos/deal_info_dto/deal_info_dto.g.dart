// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DealInfoDto _$$_DealInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_DealInfoDto(
      dealName: json['dealName'] as String? ?? '',
      redeemDate: json['redeemDate'] as String? ?? '',
      redeemTime: json['redeemTime'] as String? ?? '',
      customerName: json['customerName'] as String? ?? '',
      redeemDeals: json['redeemDeals'] as int? ?? 1,
    );

Map<String, dynamic> _$$_DealInfoDtoToJson(_$_DealInfoDto instance) =>
    <String, dynamic>{
      'dealName': instance.dealName,
      'redeemDate': instance.redeemDate,
      'redeemTime': instance.redeemTime,
      'customerName': instance.customerName,
      'redeemDeals': instance.redeemDeals,
    };
