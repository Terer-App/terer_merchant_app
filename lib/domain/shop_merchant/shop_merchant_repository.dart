import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../infrastructure/dtos/brand/user/brand_user_dto.dart';
import '../../infrastructure/dtos/outlet/outlet_dto.dart';
import '../../infrastructure/dtos/place_order/outlet_product/outlet_product_dto.dart';
import '../../infrastructure/dtos/shop_product/shop_product_dto.dart';

abstract class ShopMerchantRepository {
  Future<BrandUserDto?> merchantProfile({String? token});
  Future<ShopProductDto?> getProductById({
    required String productId,
  });

  Future<List<OutletProductDto>> getProductsByMerchant(
      {required String brandId});

  Future<List<OutletDto>> getAllotedBrandOutlets();

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
  Future<Either<String, Map<String, dynamic>>> verifyDealAnyways(
      {required Map<String, dynamic> data, required int isItFreeDeal});

  Future<Map<String, dynamic>> merchantDeals({
    required String dealType,
    int page = 1,
    String? currentDate,
  });
}
