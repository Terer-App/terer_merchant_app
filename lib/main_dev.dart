import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'app.dart';
import 'package:path_provider/path_provider.dart';
import './domain/core/configs/app_config.dart';
import 'firebase_options.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  Directory? directory = Platform.isAndroid
      ? await getExternalStorageDirectory()
      : await getLibraryDirectory();
  Hive.init(directory!.path);
  final appConfig = AppConfig(
    appTitle: 'Terer Merchant - Dev',
    serverUrl: 'https://terer-server.dev.dreamkasper.com/',
    buildFlavor: 'Dev',
   //apiUrl: 'https://terer-server.dev.dreamkasper.com/',
    apiUrl: 'https://terer-api.dev.dreamkasper.com/api/v1/',
    child: Container(),
  );
  appInitializer(appConfig);
}
