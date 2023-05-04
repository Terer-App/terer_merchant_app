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
    appTitle: 'Terer',
    serverUrl: '',
    merchantApi: '',
    buildFlavor: 'Production',
    child: Container(),
  );
  appInitializer(appConfig);
}
