import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'app.dart';
import 'package:path_provider/path_provider.dart';
import './domain/core/configs/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Directory? directory = Platform.isAndroid
      ? await getExternalStorageDirectory()
      : await getLibraryDirectory();
  Hive.init(directory!.path);

  final appConfig = AppConfig(
    appTitle: 'Terer Merchant',
    serverUrl: 'https://server.terer.co/',
    apiUrl: 'https://api.terer.co/api/v1/',
    buildFlavor: 'Production',
    child: Container(),
  );
  appInitializer(appConfig);
}
