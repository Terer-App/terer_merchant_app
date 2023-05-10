import 'package:flutter/material.dart';
import '../../../infrastructure/dtos/merchant_dto/merchant_dto.dart';

class AppStateNotifier extends ChangeNotifier {
  bool isAuthorized;
  MerchantDto? profile;

  AppStateNotifier({
    required this.isAuthorized,
    this.profile,
  });
  void updateAuthState({
    required bool isAuthorized,
    required MerchantDto? profile,
  }) {
    this.isAuthorized = isAuthorized;
    this.profile = profile;

    notifyListeners();
  }
}

class AppConfig extends InheritedWidget {
  final String appTitle;
  final String serverUrl;
  final String buildFlavor;
  @override
  // ignore: overridden_fields
  final Widget child;

  // ignore: use_key_in_widget_constructors
  const AppConfig(
      {required this.appTitle,
      required this.buildFlavor,
      required this.child,
      required this.serverUrl})
      : super(child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
