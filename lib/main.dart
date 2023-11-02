import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'app.dart';
import 'package:path_provider/path_provider.dart';
import './domain/core/configs/app_config.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory? directory = Platform.isAndroid
      ? await getExternalStorageDirectory()
      : await getLibraryDirectory();
  Hive.init(directory!.path);

  String mode = 'PROD'; // Default to 'DEV' mode
  try {
    final response = await http.get(Uri.parse(
        'https://gist.githubusercontent.com/sachin-darde/4fb95c95a2a6b13794a159849d1ba882/raw/03e504c180ef263141d898c96242cc4b3dfdefdf/terer_production_env_switcher.txt'));
    if (response.statusCode == 200) {
      mode = response.body.trim();
    }
  } catch (error) {
    mode = 'PROD';
  }

  final appConfig = AppConfig(
    appTitle: 'Terer Merchant',
    serverUrl: mode == 'DEV'
        ? 'https://terer-server.dev.dreamkasper.com/merchant/dev/api/'
        : 'https://server.terer.co/merchant/dev/api/',
    buildFlavor: 'Production',
    child: Container(),
  );
  appInitializer(appConfig);
}
