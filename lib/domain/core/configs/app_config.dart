import 'package:flutter/material.dart';
import '../../../infrastructure/dtos/brand/user/brand_user_dto.dart';

class AppStateNotifier extends ChangeNotifier {
  bool isAuthorized;
  BrandUserDto? profile;

  AppStateNotifier({
    required this.isAuthorized,
    this.profile,
  });
  void updateAuthState({
    required bool isAuthorized,
    required BrandUserDto? profile,
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
  final String apiUrl;
  @override
  // ignore: overridden_fields
  final Widget child;

  // ignore: use_key_in_widget_constructors
  const AppConfig(
      {required this.appTitle,
      required this.buildFlavor,
      required this.child,
      required this.serverUrl,
      required this.apiUrl})
      : super(child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
