import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'domain/services/storage_service/auth_service.dart';
import 'infrastructure/dtos/brand/user/brand_user_dto.dart';
import 'infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';
import 'domain/core/configs/app_config.dart';
import 'domain/core/configs/injection.dart';
import 'domain/extensions/sizer_extension.dart';
import 'domain/services/navigation_service/navigation_service.dart';
import 'domain/services/navigation_service/routers/route_names.dart';
import 'domain/services/navigation_service/routers/routing_config.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xffF9A31A),
        scaffoldBackgroundColor: const Color(0xffffffff),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xffF9A31A),
              onPrimary: const Color(0xffF8A41E),
              secondary: const Color(0xff1D3463),
              tertiary: const Color(0xfffef4e4),
              background: const Color(0xFFe4e5e6),
              primaryContainer: Colors.black,
              secondaryContainer: Colors.white,
            ),
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontSize: (SizerUtilExtension.checkSizerIsSupported) ? 10.sp : 14,
          ),
          bodyMedium: TextStyle(
            fontSize: (SizerUtilExtension.checkSizerIsSupported) ? 12.sp : 16,
          ),
          titleSmall: TextStyle(
            fontSize: (SizerUtilExtension.checkSizerIsSupported) ? 14.sp : 16,
          ),
          titleMedium: TextStyle(
            fontSize: (SizerUtilExtension.checkSizerIsSupported) ? 20.sp : 25,
          ),
          titleLarge: TextStyle(
            fontSize: (SizerUtilExtension.checkSizerIsSupported) ? 22.sp : 28,
          ),
        ),
      ),
      builder: (context, child) => Container(
          alignment: Alignment.center,
          decoration: SizerUtil.width == 430
              ? const BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                )
              : null,
          child: child!),
      navigatorKey: navigator<NavigationService>().navigatorKey,
      onGenerateRoute: Provider.of<AppStateNotifier>(context).isAuthorized
          ? authorizedNavigation
          : commonNavigation,
      initialRoute: Provider.of<AppStateNotifier>(context).isAuthorized
          ? CoreRoutes.homeRoute
          : AuthRoutes.gettingStartedRoute,
    );
  }
}

Future appInitializer(AppConfig appConfig) async {
  BrandUserDto? profile;
  bool isAuthorized = await AuthTokenService.isLogin();

  if (isAuthorized) {
    profile = await IShopMerchantRepository(
      serverUrl: appConfig.serverUrl,
    ).merchantProfile();

    if (profile == null) {
      await AuthTokenService.clearBox();
      isAuthorized = false;
    }
  }

  AppStateNotifier appStateNotifier = AppStateNotifier(
    isAuthorized: isAuthorized,
    profile: profile,
  );
  final AppConfig configuredApp = AppConfig(
    appTitle: appConfig.appTitle,
    serverUrl: appConfig.serverUrl,
    buildFlavor: appConfig.buildFlavor,
    child: ChangeNotifierProvider<AppStateNotifier>(
        create: (context) {
          return appStateNotifier;
        },
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 430,
              maxHeight: double.infinity,
            ),
            child: Sizer(
              builder: (context, orientation, deviceType) {
                // ignore: prefer_const_constructors
                return Directionality(
                  textDirection: TextDirection.ltr,
                  // ignore: prefer_const_constructors
                  child: MainApp(),
                );
              },
            ),
          ),
        )),
  );
  setupLocator(GlobalKey<NavigatorState>());
  return runApp(
    configuredApp,
  );
}
