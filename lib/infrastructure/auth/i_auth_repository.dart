import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../domain/constants/api_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/services/network_service/rest_service.dart';

import '../../domain/auth/auth_repository.dart';

class IAuthRepository extends AuthRepository {
  final String serverUrl;

  IAuthRepository({required this.serverUrl});

  @override
  Future<Either<String, String>> loginAsMerchant({
    required String userName,
    required String password,
  }) async {
    final url = serverUrl + APIConstants.loginAsMerchant;
    try {
      final res = await RESTService.performPOSTRequest(
          httpUrl: url,
          body: json.encode(
              {'email': userName, 'password': password}));

      final response = json.decode(res.body);

      if (response['status'] == 1) {
        return right(response['token']);
      } else {
        return left(response['message']);
      }
    } catch (e) {
      return left(ErrorConstants.genericNetworkIssue);
    }
  }
}
