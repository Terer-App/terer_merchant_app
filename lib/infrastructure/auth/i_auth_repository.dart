import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../domain/constants/api_constants.dart';
import '../../domain/services/network_service/rest_service.dart';

import '../../domain/auth/auth_repository.dart';

class IAuthRepository extends AuthRepository {
  final String serverUrl;
  final String apiUrl;
  IAuthRepository({required this.serverUrl, required this.apiUrl});

  @override
  Future<Either<String, String>> loginAsMerchant({
    required String userName,
    required String password,
  }) async {
    final url = serverUrl + APIConstants.loginAsMerchant;
    try {
      final res = await RESTService.performPOSTRequest(
          httpUrl: url,
          body: json.encode({'email': userName, 'password': password}));

      final response = json.decode(res.body);

      if (response['status'] == 1) {
        return right(response['token']);
      } else {
        return left(response['message']);
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  //add or remove fcm token
  @override
  Future<void> addOrRemoveFcmToken(
      {required String userEmail,
      required String brandId,
      required String fcmToken,
      bool isRemove = false}) async {
    final url =  serverUrl +
        (isRemove ? APIConstants.removeFcmToken : APIConstants.addFcmToken);
    try {
      debugPrint('fcm : $fcmToken');
      final res = await RESTService.performPOSTRequest(
          isAuth: true,
          httpUrl: url,
          body: json.encode({
            'userEmail': userEmail,
            'fcmToken': fcmToken,
            'isCustomer': false,
            'brandId': brandId
          }));
      debugPrint(res.body);
    } catch (e) {
      //
    }
  }
}
