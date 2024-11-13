import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../domain/constants/api_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/place_order/place_order_repository.dart';
import '../../domain/services/network_service/rest_service.dart';
import '../../domain/services/storage_service/auth_service.dart';
import '../dtos/brought_deal_dto/brought_deal_dto.dart';
import '../dtos/customer_order_with_history_dto/customer_order_with_history_dto.dart';
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
    final Map<String, dynamic> data = isNewUser
        ? {
            'countryCode': countryCode,
            'phoneNumber': phoneNumber,
            'items': addedProducts,
            'emailAddress': emailId,
            'name': name,
          }
        : {
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

  @override
  Future<List<BroughtDealDto>> getBroughtDealsByInvoiceDate(
      {required String brandId,
      required String startDate,
      required String endDate,
      int skip = 0,
      int limit = 10}) async {
    List<BroughtDealDto> deals = [];
    final url =
        '${apiUrl}brands/$brandId/deals-by-invoice-date?skip=$skip&limit=$limit&startDate=$startDate&endDate=$endDate';
    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performGETRequest(
        httpUrl: url,
        token: token,
        isAuth: true,
      );

      final response = json.decode(res.body);
      if (res.statusCode == 200 && response['data'] != null) {
        final dealList = response['data']['broughtDeals'] ?? [];
        if ((dealList as List).isNotEmpty) {
          deals = dealList.map((e) => BroughtDealDto.fromJson(e)).toList();
        }
      }
      return deals;
    } catch (e) {
      return deals;
    }
  }

  @override
  Future<String> getInvoiceDocLink(
      {required String brandId,
      required String date,
      bool isMonth = true}) async {
    String docLink = '';
    final url =
        '$apiUrl${APIConstants.invoiceDocLink}?date=$date&isMonth=$isMonth&brandId=$brandId';
    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performGETRequest(
        httpUrl: url,
        token: token,
        isAuth: true,
      );

      final response = json.decode(res.body);
      if (res.statusCode == 200 && response['data'] != null) {
        docLink = response['data']['fileUrl'] ?? '';
      }
      return docLink;
    } catch (e) {
      return docLink;
    }
  }

  @override
  Future<Map<String, dynamic>> getCustomersOrders(
      {required String startDate,
      required String endDate,
      String customerName = '',
      bool isTodaysCount = false,
      int skip = 0,
      int limit = 10}) async {
    Map<String, dynamic> resData = {};

    String todayDateStr = '';
    if (isTodaysCount) {
      todayDateStr = DateFormat('dd/MM/y').format(DateTime.now());
    }

    final url =
        '$apiUrl/${APIConstants.getCustomerOrders}?startDate=$startDate&endDate=$endDate&skip=$skip&limit=$limit&isTodaysCount=$isTodaysCount&todayDate=$todayDateStr&customerName=$customerName';
    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performGETRequest(
        httpUrl: url,
        token: token,
        isAuth: true,
      );

      final response = json.decode(res.body);
      List<BroughtDealDto> deals = [];

      if (res.statusCode == 200 && response['data'] != null) {
        final dealList = response['data']['deals'] ?? [];
        if ((dealList as List).isNotEmpty) {
          deals = dealList.map((e) => BroughtDealDto.fromJson(e)).toList();
        }

        if (response['data']['todaysDeals'] != null &&
            response['data']['todaysRevenue'] != null) {
          int todaysDeals = 0;
          double todaysRevenue = 0;
          todaysDeals = response['data']['todaysDeals'] ?? 0;
          todaysRevenue = (response['data']['todaysRevenue'] ?? 0).toDouble();
          resData = {
            'todaysDeals': todaysDeals,
            'todaysRevenue': todaysRevenue,
          };
        }
      }

      resData = {
        ...resData,
        'deals': deals,
        'totalDeals': deals.length,
      };

      return resData;
    } catch (e) {
      return resData;
    }
  }

  @override
  Future<List<BroughtDealDto>> getLatestDeals(
      {required String startTime}) async {
    List<BroughtDealDto> latestDeals = [];
    final url = '$apiUrl${APIConstants.getLatestOrders}?startTime=$startTime';
    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performGETRequest(
        httpUrl: url,
        token: token,
        isAuth: true,
      );

      final response = json.decode(res.body);

      if (res.statusCode == 200 && response['data'] != null) {
        final dealList = response['data']['deals'] ?? [];
        if ((dealList as List).isNotEmpty) {
          latestDeals =
              dealList.map((e) => BroughtDealDto.fromJson(e)).toList();
        }
      }

      return latestDeals;
    } catch (e) {
      return latestDeals;
    }
  }

  @override
  Future<List<CustomerOrderWithHistoryDto>>
      getCustomerOrdersWithRedemptionHistory({
    required String customerId,
    required int skip,
    int limit = APIConstants.limit,
  }) async {
    List<CustomerOrderWithHistoryDto> orders = [];
    final url =
        '$apiUrl${APIConstants.getCustomerWithRedemption}?customerId=$customerId&showOutlet=true';

    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performGETRequest(
        httpUrl: url,
        token: token,
        isAuth: true,
      );

      final response = json.decode(res.body);

      if (res.statusCode == 200 && response['data'] != null) {
        final dealList = response['data']['deals'] ?? [];
        if ((dealList as List).isNotEmpty) {
          orders = dealList
              .map((e) => CustomerOrderWithHistoryDto.fromJson(e))
              .toList();
        }
      }
      return orders;
    } catch (e) {
      return orders;
    }
  }

  @override
  Future<Either<String, bool>> verifyPurchaseDeal(
      {required String dealId}) async {
    try {
      final url = '$apiUrl${APIConstants.dealHistory}/?dealId=$dealId';

      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performPUTRequest(
        httpUrl: url,
        token: token,
        isAuth: true,
      );

      return right(res.statusCode == 200);
    } catch (e) {
      if (e is Response) {
        Response error = e;
        final responseError = jsonDecode(error.body);
        return left(responseError['error']['message']);
      } else {
        return left('Something went wrong! please try again');
      }
    }
  }
}
