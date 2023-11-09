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
  final String serverUrl;

  IPlaceOrderRepository({required this.apiUrl, required this.serverUrl});

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
  Future<Either<String, String>> placeOrder(
      {required List<Map<String, dynamic>> addedProducts,
      required String countryCode,
      required String phoneNumber,
      required bool isNewUser,
      String? emailId,
      String? name}) async {
    final Map<String, dynamic> data = isNewUser ? {
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
      'items': addedProducts,
      'emailAddress': emailId,
      'name': name,
    }:{
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
      'items': addedProducts,
    };
    final url = serverUrl + APIConstants.placeOrder;

    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performPOSTRequest(
          httpUrl: url, isAuth: true, token: token, body: jsonEncode(data));

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

  @override
  Future<Either<String, bool>> checkUserByEmail({required String email}) async {
    final Map<String, dynamic> data = {
      'emailAddress': email,
    };
    final url = serverUrl + APIConstants.checkUserByEmail;
    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performPOSTRequest(
          httpUrl: url, isAuth: true, token: token, body: jsonEncode(data));

      final response = json.decode(res.body);

      if (response['status'] == 1) {
        return right(true);
      } else if (response['status'] == 0) {
        return right(false);
      }
      return left(ErrorConstants.genericNetworkIssue);
    } catch (e) {
      return left(ErrorConstants.genericNetworkIssue);
    }
  }

  @override
  Future<Either<String, bool>> checkUserByNumber(
      {required String countryCode, required String phoneNumber}) async {
    final Map<String, dynamic> data = {
      'countryCode': countryCode,
      'phoneNumber': phoneNumber
    };
    final url = serverUrl + APIConstants.checkUserByNumber;
    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performPOSTRequest(
          httpUrl: url, isAuth: true, token: token, body: jsonEncode(data));

      final response = json.decode(res.body);

      if (response['status'] == 1) {
        return right(true);
      } else if (response['status'] == 0) {
        return right(false);
      }
      return left(ErrorConstants.genericNetworkIssue);
    } catch (e) {
      return left(ErrorConstants.genericNetworkIssue);
    }
  }
}
