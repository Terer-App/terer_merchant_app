import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../infrastructure/dtos/merchant_dto/merchant_dto.dart';

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

  Future<Either<String, Map<String, dynamic>>> verifyCustomerDeal({
    required Map<String, dynamic> data,
  });
  Future<Either<String, Map<String, dynamic>>> verifyDealAnyways({
    required Map<String, dynamic> data,
    required int isItFreeDeal
  });

  Future<Map<String, dynamic>> merchantDeals({
    required String dealType,
    int page = 1,
    String? currentDate,
  });
}
