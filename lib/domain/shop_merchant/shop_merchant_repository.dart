import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:terer_merchant/infrastructure/dtos/merchant_dto/merchant_dto.dart';

abstract class ShopMerchantRepository {
  Future<MerchantDto?> merchantProfile({String? token});

  Future<Either<String, String>> disputeReport({
    required String merchantMessage,
    http.MultipartFile? sendImage,
  });

  Future<Either<String, String>> contactUs({
    required String merchantMessage,
    required String email,
    required String name,
    http.MultipartFile? sendImage,
  });

  Future<Either<String, String>> deleteAccount();
}
