import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'app.dart';
import 'package:path_provider/path_provider.dart';
import './domain/core/configs/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory? directory = Platform.isAndroid
      ? await getExternalStorageDirectory()
      : await getLibraryDirectory();
  Hive.init(directory!.path);
  final appConfig = AppConfig(
    appTitle: 'Terer Merchant - Dev',
    serverUrl: 'https://4495-103-50-77-211.ngrok-free.app/merchant/dev/api/',
    buildFlavor: 'Dev',
    child: Container(),
  );
  appInitializer(appConfig);
}
