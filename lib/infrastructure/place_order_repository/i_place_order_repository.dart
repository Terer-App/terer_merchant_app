import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../domain/constants/api_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/place_order/place_order_repository.dart';
import '../../domain/services/network_service/rest_service.dart';
import '../../domain/services/storage_service/auth_service.dart';
import '../dtos/place_order/outlet_product/outlet_product_dto.dart';

class IPlaceOrderRepository extends PlaceOrderRepository {
  final String apiUrl;

  IPlaceOrderRepository({required this.apiUrl});

  @override
  Future<List<OutletProductDto>> getOutletProducts(
      {required String outletId}) async {
    final url =
        '$apiUrl${APIConstants.getOutletProducts}?outlet_id=$outletId&limit=200';
    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performGETRequest(
        httpUrl: url,
        token: token,
        isAuth: true,
      );

      final response = json.decode(res.body);
      List<OutletProductDto> outletProducts = [];
      if (response['status'] == 'SUCCESS') {
        outletProducts = (response['data'] as List)
            .map((e) => OutletProductDto.fromJson(e))
            .toList();
      }
      return outletProducts;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<Either<String, String>> placeOrder({required List<Map<String, dynamic>>  addedProducts,required String countryCode,
  required String phoneNumber}) async {

    final Map<String, dynamic> data = {
    'countryCode': countryCode,
    'phoneNumber': phoneNumber,
    'items':addedProducts
  };
   // final url = serverUrl + APIConstants.deleteAccount;
    const url =
        'https://08d8-103-50-77-222.ngrok-free.app/merchant/dev/api/place_order_as_merchant.php';
    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performPOSTRequest(
        httpUrl: url,
        isAuth: true,
        token: token,
        body: jsonEncode(data)
      );

      final response = json.decode(res.body);

      if (response['status'] == 1) {
        return right(response['message']);
      } else {
        return left(response['message']);
      }
    } catch (e) {
      return left(ErrorConstants.genericNetworkIssue);
    }
  }
}
