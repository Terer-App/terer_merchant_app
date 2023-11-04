import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String, String>> loginAsMerchant({
    required String userName,
    required String password,
  });

  Future<void> addOrRemoveFcmToken(
      {required String userEmail,
      required String brandId,
      required String fcmToken,
      bool isRemove = false});
}
