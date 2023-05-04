import 'package:dartz/dartz.dart';
import 'package:terer_merchant/infrastructure/dtos/merchant_dto/merchant_dto.dart';

abstract class ShopMerchantRepository {
  Future<MerchantDto?> merchantProfile({ String? token});
}
