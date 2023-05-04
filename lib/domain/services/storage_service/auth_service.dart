import 'dart:core';

import 'package:hive/hive.dart';

class AuthTokenService {
  static const String authBoxName = 'core-auth';

  static Future clearBox() async {
    final coreBox = await Hive.openBox(authBoxName);
    await coreBox.clear();
  }

  static Future<bool> isLogin() async {
    final coreBox = await Hive.openBox(authBoxName);
    bool isAuthorized = coreBox.get('isAuthorized', defaultValue: false);
    return isAuthorized;
  }

  static Future setIsLogin({required bool isAuthorized}) async {
    final coreBox = await Hive.openBox(authBoxName);
    await coreBox.put('isAuthorized', isAuthorized);
  }

  static Future<String> getMerchantToken() async {
    final coreBox = await Hive.openBox(authBoxName);
    String jwtToken = coreBox.get('merchant_token', defaultValue: '');
    return jwtToken;
  }

  static Future setMerchantToken({required String merchantToken}) async {
    final coreBox = await Hive.openBox(authBoxName);
    await coreBox.put('merchant_token', merchantToken);
  }
}
