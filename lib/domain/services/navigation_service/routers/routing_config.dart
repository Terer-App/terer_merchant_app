import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terer_merchant/presentation/about_us/about_us_screen.dart';
import 'package:terer_merchant/presentation/about_us/terms_screen.dart';
import 'package:terer_merchant/presentation/auth/getting_started_screen.dart';
import 'package:terer_merchant/presentation/auth/login_screen.dart';
import 'package:terer_merchant/presentation/auth/verify_otp_screen.dart';
import 'package:terer_merchant/presentation/contact_us/contact_us_screen.dart';
import 'package:terer_merchant/presentation/deals/add_deal_screen.dart';
import 'package:terer_merchant/presentation/deals/deals_screen.dart';
import 'package:terer_merchant/presentation/deals/reports/purchased_reports_screen.dart';
import 'package:terer_merchant/presentation/deals/reports/redeemed_reports_screen.dart';
import 'package:terer_merchant/presentation/profile/profile_screen.dart';
import '../../../../infrastructure/platform/platform_enum.dart';
import '../../../../presentation/dispute_report/dispute_report_screen.dart';
import '../../../../presentation/home/home_screen.dart';
import '../../../core/configs/determine_platform.dart';
import 'route_names.dart';
import '../../../extensions/string_extensions.dart';

Route<dynamic> authorizedNavigation(RouteSettings settings) {
  //Navigation for un authorized or common pages(Home,login,etc)
  final routingData = settings.name!.getRoutingData;
  switch (routingData.route) {
    case CoreRoute.homeRoute:
      // final routeData = routingData.queryParameters;

      return _getPageRoute(
        const HomeScreen(
          startPage: 0,
        ),
        settings,
      );

    case CoreRoute.purchasedRoute:
      return _getPageRoute(
        const PurchasedReportsScreen(),
        settings,
      );

    case CoreRoute.redeemedRoute:
      return _getPageRoute(
        const RedeemedReportsScreen(),
        settings,
      );

    case CoreRoute.addDealRoute:
      return _getPageRoute(
        const AddDealScreen(),
        settings,
      );

    case CoreRoute.dealsRoute:
      return _getPageRoute(
        const DealsScreen(),
        settings,
      );

    case CoreRoute.profileRoute:
      return _getPageRoute(
        ProfileScreen(),
        settings,
      );

    case CoreRoute.disputeReportRoute:
      return _getPageRoute(
        const DisputeReportScreen(),
        settings,
      );

    case CoreRoute.contactUsRoute:
      return _getPageRoute(
        const ContactUsScreen(),
        settings,
      );

    case CoreRoute.aboutUsRoute:
      return _getPageRoute(
        const AboutUsScreen(),
        settings,
      );
    case CoreRoute.termsRoute:
      return _getPageRoute(
        const TermsAndConditionScreen(),
        settings,
      );

    default:
      return commonNavigation(settings);
  }
}

Route<dynamic> commonNavigation(RouteSettings settings) {
  //Navigation for un authorized or common pages(Home,etc)
  final routingData = settings.name!.getRoutingData;
  switch (routingData.route) {
    case AuthRoutes.logInRoute:
      return _getPageRoute(
        LoginScreen(),
        settings,
      );

    case AuthRoutes.verifyOtpRoute:
      return _getPageRoute(
        const VerifyOtpScreen(),
        settings,
      );

    case CoreRoute.dealsRoute:
      return _getPageRoute(
        const DealsScreen(),
        settings,
      );

    case AuthRoutes.gettingStartedRoute:
    default:
      return _getPageRoute(
        const GettingStartedScreen(),
        settings,
      );
  }
}

PageRoute _getPageRoute(
  Widget child,
  RouteSettings settings, {
  bool mainRoute = false,
}) {
  final SupportedPlatform platform = getPlatform();
  if (platform == SupportedPlatform.ios && !mainRoute) {
    return CupertinoPageRoute(builder: (BuildContext context) {
      return child;
    });
  } else if (platform == SupportedPlatform.android && !mainRoute) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return child;
    });
  } else {
    return _FadeRoute(child: child, routeName: settings.name!);
  }
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

class CupertinoRoute extends PageRouteBuilder {
  final Widget enterPage;
  CupertinoRoute({required this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return enterPage;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.linearToEaseOut,
                  reverseCurve: Curves.easeInToLinear,
                ),
              ),
              child: enterPage,
            );
          },
        );
}
