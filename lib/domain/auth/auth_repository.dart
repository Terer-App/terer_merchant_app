import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String, String>> loginAsMerchant({
    required String userName,
    required String password,
  });
}
