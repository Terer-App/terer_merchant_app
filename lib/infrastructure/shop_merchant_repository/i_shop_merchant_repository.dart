import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../domain/constants/api_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/services/storage_service/auth_service.dart';
import '../../domain/shop_merchant/shop_merchant_repository.dart';
import '../dtos/deal_info_dto/deal_info_dto.dart';
import '../dtos/merchant_deal_dto/merchant_deal_dto.dart';
import '../dtos/brand/user/brand_user_dto.dart';

import '../../domain/services/network_service/rest_service.dart';
import '../dtos/outlet/outlet_dto.dart';
import '../enums/deal_type.dart';

class IShopMerchantRepository extends ShopMerchantRepository {
  final String serverUrl;

  IShopMerchantRepository({required this.serverUrl});

  @override
  Future<BrandUserDto?> merchantProfile({String? token}) async {
    BrandUserDto? merchantProfile;
    final url = serverUrl + APIConstants.merchantProfile;
    try {
      final currentToken = token ?? await AuthTokenService.getMerchantToken();
      final res = await RESTService.performGETRequest(
        httpUrl: url,
        isAuth: true,
        token: currentToken,
      );

      final response = json.decode(res.body);

      if (response['status'] == 1) {
        final profileData = response['userInfo'];

        merchantProfile = BrandUserDto.fromJson(profileData);

        return merchantProfile;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Either<String, String>> contactUs(
      {required String merchantMessage,
      required String email,
      required String name,
      http.MultipartFile? sendImage}) async {
    String url = serverUrl + APIConstants.contactUs;

    try {
      final token = await AuthTokenService.getMerchantToken();

      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({
        'message': merchantMessage,
        'name': name,
        'email': email,
      });

      if (sendImage != null) {
        request.files.add(sendImage);
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      final resultResponse = await http.Response.fromStream(response);

      final resBody = json.decode(resultResponse.body);

      if (resBody['status'] == 1) {
        return right(resBody['message']);
      } else {
        return left(resBody['message']);
      }
    } catch (e) {
      return left(ErrorConstants.genericNetworkIssue);
    }
  }

  @override
  Future<Either<String, String>> disputeReport(
      {required String merchantMessage, http.MultipartFile? sendImage}) async {
    String url = serverUrl + APIConstants.disputeReport;

    try {
      final token = await AuthTokenService.getMerchantToken();

      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({
        'message': merchantMessage,
      });

      if (sendImage != null) {
        request.files.add(sendImage);
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      final resultResponse = await http.Response.fromStream(response);

      final resBody = json.decode(resultResponse.body);

      if (resBody['status'] == 1) {
        return right(resBody['message']);
      } else {
        return left(resBody['message']);
      }
    } catch (e) {
      return left(ErrorConstants.genericNetworkIssue);
    }
  }

  @override
  Future<Either<String, String>> deleteAccount() async {
    final url = serverUrl + APIConstants.deleteAccount;
    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performGETRequest(
        httpUrl: url,
        isAuth: true,
        token: token,
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

  @override
  Future<Either<String, Map<String, dynamic>>> verifyCustomerDeal({
    required Map<String, dynamic> data
  }) async {
    final url = serverUrl + APIConstants.verifyCustomerDeal;
    try {
      final token = await AuthTokenService.getMerchantToken();

      print(json.encode(data));

      final res = await RESTService.performPOSTRequest(
        httpUrl: url,
        body: json.encode(data),
        token: token,
        isAuth: true,
      );

      final response = json.decode(res.body);

      if (response['status'] == 1 ||
          response['response_code'] == 'DEAL_ALREADY_VERIFIED') {
        final responseData = {
          'msg': response['message'],
          'desc': response['desc'],
          'type': typeOfResponse(response['response_code']),
          'isSuccess': response['response_code'] == 'DEAL_VERIFIED',
        };
        if (response['dealInfo'] != null) {
          responseData['dealInfo'] = DealInfoDto.fromJson(
              response['dealInfo'] as Map<String, dynamic>);
        }
        return right(responseData);
      } else {
        return left(response['message']);
      }
    } catch (e) {
      return left(ErrorConstants.genericNetworkIssue);
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> verifyDealAnyways(
      {required Map<String, dynamic> data, required int isItFreeDeal}) async {
    final url = serverUrl + APIConstants.verifyDealAnyways;
    try {
      final token = await AuthTokenService.getMerchantToken();
      final body = json.encode({...data, 'isItFreeDeal': isItFreeDeal});
      final res = await RESTService.performPOSTRequest(
        httpUrl: url,
        body: body,
        token: token,
        isAuth: true,
      );

      final response = json.decode(res.body);

      if (response['status'] == 1) {
        return right({
          'msg': response['message'],
          'desc': response['desc'],
          'isSuccess': true,
        });
      } else {
        return left(response['message']);
      }
    } catch (e) {
      return left(ErrorConstants.genericNetworkIssue);
    }
  }

  int typeOfResponse(String resData) {
    int type = -1;

    switch (resData) {
      case 'DEAL_VERIFIED':
        type = 0;
        break;
      case 'DEAL_ALREADY_VERIFIED':
        type = 1;
        break;
      case 'NOT_VERIFIED_WITH_IN_TIME':
        type = 2;
        break;
    }

    return type;
  }

  @override
  Future<Map<String, dynamic>> merchantDeals(
      {required String dealType, int page = 1, String? currentDate}) async {
    Map<String, dynamic> result = {};
    final url = serverUrl + APIConstants.merchantDeals;
    try {
      Map<String, String> data = {
        'page': page.toString(),
        'dealtype': dealType
      };

      final token = await AuthTokenService.getMerchantToken();

      if (dealType == DealType.REDEEMED.name.toLowerCase() &&
          currentDate != null) {
        data['date'] = currentDate;
      }

      print(data);

      final res = await RESTService.performPOSTRequest(
        httpUrl: url,
        param: data,
        token: token,
        isAuth: true,
      );

      final response = json.decode(res.body);
      if (response['status'] == 1) {
        String dealName = dealType == DealType.REDEEMED.name.toLowerCase()
            ? 'redeemDeals'
            : dealType == DealType.VERIFIED.name.toLowerCase()
                ? 'verifyDeals'
                : 'balanceDeals';
        final pageData = response['data']['pagedata'] ?? {};

        final dealsData = response['data'][dealName];

        if ((pageData as Map<String, dynamic>).isNotEmpty &&
            (dealsData as List<dynamic>).isNotEmpty) {
          final List<MerchantDealDto> lsOfDeals = [];

          for (var deal in dealsData) {
            lsOfDeals.add(MerchantDealDto.fromJson(deal));
          }

          result = {
            'lsOfDeals': lsOfDeals,
            'totalDeals': pageData['totalDeals'],
            'currentPage': pageData['currentPage'],
          };
        }
      }

      return result;
    } catch (e) {
      return result;
    }
  }

  @override
  Future<List<OutletDto>> getAllotedBrandOutlets() async {
    final url = serverUrl + APIConstants.getAllotedOutlets;
    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performPOSTRequest(
        httpUrl: url,
        token: token,
        isAuth: true,
      );

      final response = json.decode(res.body);
      List<OutletDto> outlets = [];
      if (response['status'] == 1) {
        outlets =
            (response['outlets'] as List).map((e) => OutletDto.fromJson(e)).toList();
      }
      return outlets;
    } catch (e) {
      return [];
    }
  }
}
