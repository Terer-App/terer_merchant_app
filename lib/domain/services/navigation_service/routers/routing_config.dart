import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import '../../../../infrastructure/dtos/place_order/outlet_product/outlet_product_dto.dart';
import '../../../../presentation/about_us/about_us_screen.dart';
import '../../../../presentation/about_us/terms_screen.dart';
import '../../../../presentation/auth/getting_started_screen.dart';
import '../../../../presentation/contact_us/contact_us_screen.dart';
import '../../../../infrastructure/platform/platform_enum.dart';
import '../../../../presentation/customer_purchase_deals/customer_purchase_deals_details_screen.dart';
import '../../../../presentation/deals/reports/reports_screen.dart';
import '../../../../presentation/dispute_report/dispute_report_screen.dart';
import '../../../../presentation/home/home_screen.dart';
import '../../../../presentation/live_deals/live_deal_details_screen.dart';
import '../../../../presentation/live_deals/live_deals_listing_screen.dart';
import '../../../../presentation/payout/payout_details_screen.dart';
import '../../../../presentation/payout/payout_listing_screen.dart';
import '../../../../presentation/place_order/cart_screen.dart';
import '../../../../presentation/place_order/place_order_screen.dart';
import '../../../core/configs/determine_platform.dart';
import 'route_names.dart';
import '../../../extensions/string_extensions.dart';

Route<dynamic> authorizedNavigation(RouteSettings settings) {
  //Navigation for un authorized or common pages(Home,login,etc)
  final routingData = settings.name!.getRoutingData;
  switch (routingData.route) {
    case CoreRoutes.homeRoute:
      final routeData = routingData.queryParameters;
      return _getPageRoute(
        HomeScreen(
          startPage: int.parse(routeData['tabIndex'] ?? '0'),
        ),
        settings,
      );

    case CoreRoutes.reportsRoute:
      final routeData = routingData.queryParameters;
      return _getPageRoute(
        ReportsScreen(
          tabIndex: int.parse(routeData['tabIndex'] ?? '0'),
          tabName: routeData['tabName'] ?? '',
        ),
        settings,
      );

    case CoreRoutes.disputeReportRoute:
      return _getPageRoute(
        const DisputeReportScreen(),
        settings,
      );

    case CoreRoutes.contactUsRoute:
      return _getPageRoute(
        const ContactUsScreen(),
        settings,
      );

    case CoreRoutes.aboutUsRoute:
      return _getPageRoute(
        const AboutUsScreen(),
        settings,
      );

    case CoreRoutes.termsRoute:
      return _getPageRoute(
        const TermsAndConditionScreen(),
        settings,
      );

    case CoreRoutes.cartRoute:
      final args = settings.arguments;
      return _getPageRoute(
        CartScreen(
          zoomDrawerController: ZoomDrawerController(),
          addedProducts: args as List<OutletProductDto>,
        ),
        settings,
      );
    case CoreRoutes.createOrderRoute:
      return _getPageRoute(
        const PlaceOrderScreen(),
        settings,
      );

    case CoreRoutes.customerPurchaseDealDetailsRoute:
      return _getPageRoute(
        const CustomerPurchaseDealDetailsScreen(),
        settings,
      );

    case CoreRoutes.liveDealListingRoute:
      return _getPageRoute(
        const LiveDealsListingScreen(),
        settings,
      );

    case CoreRoutes.liveDealDetailsRoute:
    final dealDetails = settings.arguments as OutletProductDto;
      return _getPageRoute(
         LiveDealDetailsScreen(dealDetails: dealDetails),
        settings,
      );

    case CoreRoutes.payoutListingRoute:
      return _getPageRoute(
        const PayoutListingScreen(),
        settings,
      );

    case CoreRoutes.payoutDetailsRoute:
      return _getPageRoute(
        const PayoutDetailsScreen(),
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
