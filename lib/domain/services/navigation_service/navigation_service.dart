import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationService(this.navigatorKey);

  Future<dynamic> navigateTo(
    String routeName, {
    Map<String, String> queryParams = const {},
    bool isClearStack = false,
    bool isReplace = false,
    dynamic arguments,
  }) {
    String newRouteName = routeName;
    newRouteName =
        Uri(path: routeName, queryParameters: queryParams).toString();
    if (isClearStack) {
      return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        newRouteName,
        (Route<dynamic> route) => false,
        arguments: arguments,
      );
    } else if (isReplace) {
      return navigatorKey.currentState!.pushReplacementNamed(
        newRouteName,
        arguments: arguments,
      );
    } else {
      return navigatorKey.currentState!
          .pushNamed(newRouteName, arguments: arguments);
    }
  }

  bool goBack({dynamic responseObject}) {
    navigatorKey.currentState!.pop(responseObject);
    return true;
  }

  BuildContext get getNavContext => navigatorKey.currentState!.context;

  GlobalKey<NavigatorState> get getNavKey => navigatorKey;
}
