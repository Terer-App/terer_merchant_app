import 'dart:core';
import 'package:hive/hive.dart';


class AppUpdateService {
  static const String appUpdateBoxName = 'app_update';
  static Future clearAppHashValue() async {
    final coreBox = await Hive.openBox(appUpdateBoxName);
    coreBox.delete('hash');
  }

  static Future<String> getAppHashValue() async {
    final coreBox = await Hive.openBox(appUpdateBoxName);
    String hashValue = coreBox.get('hash', defaultValue: '');
    return hashValue;
  }

  static Future setAppHashValue({String? hashValue}) async {
    final coreBox = await Hive.openBox(appUpdateBoxName);
    coreBox.put('hash', hashValue);
  }
}
