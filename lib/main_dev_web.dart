import 'package:flutter/material.dart';
import 'app.dart';
import './domain/core/configs/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfig = AppConfig(
    appTitle: 'Terer',
    serverUrl: '',
    buildFlavor: 'Dev',
    child: Container(),
  );
  appInitializer(appConfig);
}
