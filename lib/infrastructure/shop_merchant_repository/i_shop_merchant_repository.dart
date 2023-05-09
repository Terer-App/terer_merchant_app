import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:terer_merchant/domain/constants/api_constants.dart';
import 'package:terer_merchant/domain/constants/string_constants.dart';
import 'package:terer_merchant/domain/services/storage_service/auth_service.dart';
import 'package:terer_merchant/domain/shop_merchant/shop_merchant_repository.dart';
import 'package:terer_merchant/infrastructure/dtos/merchant_dto/merchant_dto.dart';

import '../../domain/services/network_service/rest_service.dart';

class IShopMerchantRepository extends ShopMerchantRepository {
  final String serverUrl;

  IShopMerchantRepository({required this.serverUrl});

  @override
  Future<MerchantDto?> merchantProfile({String? token}) async {
    MerchantDto? merchantProfile;
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
        final profileData = response['shopInfo'];

        merchantProfile = MerchantDto.fromJson(profileData);

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
        'merchantMessage': merchantMessage,
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
        'merchantMessage': merchantMessage,
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
    required Map<String, dynamic> data,
  }) async {
    final url = serverUrl + APIConstants.verifyCustomerDeal;
    try {
      final token = await AuthTokenService.getMerchantToken();

      final res = await RESTService.performPOSTRequest(
        httpUrl: url,
        body: json.encode(data),
        token: token,
        isAuth: true,
      );

      final response = json.decode(res.body);

      if (response['status'] == 1 ||
          response['response_code'] == 'DEAL_ALREADY_VERIFIED') {
        return right({
          'msg': response['message'],
          'desc': response['desc'],
          'type': typeOfResponse(response['response_code']),
          'isSuccess': response['response_code'] == 'DEAL_VERIFIED',
        });
      } else {
        return left(response['message']);
      }
    } catch (e) {
      return left(ErrorConstants.genericNetworkIssue);
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> verifyDealAnyways({
    required Map<String, dynamic> data,
  }) async {
    final url = serverUrl + APIConstants.verifyDealAnyways;
    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performPOSTRequest(
        httpUrl: url,
        body: json.encode(data),
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
}