import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'domain/constants/string_constants.dart';
import 'domain/services/fcm_dynamic_link_services/fcm_dynamic_link_service.dart';
import 'domain/services/storage_service/app_update_service.dart';
import 'domain/services/storage_service/auth_service.dart';
import 'infrastructure/dtos/brand/user/brand_user_dto.dart';
import 'infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';
import 'domain/core/configs/app_config.dart';
import 'domain/core/configs/injection.dart';
import 'domain/extensions/sizer_extension.dart';
import 'domain/services/navigation_service/navigation_service.dart';
import 'domain/services/navigation_service/routers/route_names.dart';
import 'domain/services/navigation_service/routers/routing_config.dart';
import 'presentation/app_update/app_update.dart';

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
      // initialRoute: CoreRoutes.customerPurchaseDealDetailsRoute,
      initialRoute: Provider.of<AppStateNotifier>(context).isAuthorized
          ? CoreRoutes.homeRoute
          : AuthRoutes.gettingStartedRoute,
    );
  }
}

Future appInitializer(AppConfig appConfig) async {
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  BrandUserDto? profile;
  bool isAuthorized = await AuthTokenService.isLogin();
  print(await AuthTokenService.getMerchantToken());
  if (isAuthorized) {
    profile = await IShopMerchantRepository(
      serverUrl: appConfig.serverUrl,
    ).merchantProfile();

    if (profile == null) {
      await AuthTokenService.clearBox();
      isAuthorized = false;
    }
  }
  if (Platform.isAndroid) {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelGroupKey: AppConstants.channelGroupKey,
            channelKey: AppConstants.channelKey,
            channelName: AppConstants.channelName,
            channelDescription: AppConstants.channelDescription,
            defaultColor: Colors.white,
            ledColor: Colors.white)
      ],
    );
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (ReceivedAction receivedAction) async {
        //when app is in foreground
        if (receivedAction.payload != null) {
          FCMDynamicLinkService.navigateUserToPage(
            message: RemoteMessage(
                data: receivedAction.payload!
                    .map((key, value) => MapEntry(key, value))),
          );
        }
      },
    );
  }
  initMessagingService(navigationKey: navKey);

  AppStateNotifier appStateNotifier = AppStateNotifier(
    isAuthorized: isAuthorized,
    profile: profile,
  );
  final AppConfig configuredApp = AppConfig(
    appTitle: appConfig.appTitle,
    serverUrl: appConfig.serverUrl,
    apiUrl: appConfig.apiUrl,
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
  setupLocator(navKey);
  checkForAppUpdate(navKey);
  return runApp(
    configuredApp,
  );
}

Future<Map<String, dynamic>> getRemoteConfigs() async {
  Map<String, dynamic> configs = {};
  String hash = '';
  String appLink = '';
  int minVersion = 0;
  int latestVersion = 0;

  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(minutes: 2),
  ));
  await remoteConfig.fetchAndActivate().then((value) {
    appLink = remoteConfig.getString('app_link_merchant');
    minVersion = remoteConfig.getInt('min_version_merchant');
    latestVersion = remoteConfig.getInt('latest_version_merchant');
    hash = remoteConfig.getString('hash_merchant');
    configs = {
      'hash_merchant': hash,
      'app_link_merchant': appLink,
      'min_version_merchant': minVersion,
      'latest_version_merchant': latestVersion,
    };
  });

  return configs;
}

// check for app update
Future checkForAppUpdate(GlobalKey<NavigatorState> navKey) async {
  await Future.delayed(
    const Duration(milliseconds: 100),
  );

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  int buildNumber = int.parse(packageInfo.buildNumber);
  int minVersion = 0;

  bool isForceUpdate = false;
  String appLink = '';
  String currentAppHash = await AppUpdateService.getAppHashValue();
  String newAppHash = '';
  int latestVersion = 0;
  bool isNewReleaseAvailable = false;
  try {
    Map<String, dynamic> appUpdateData = await getRemoteConfigs();
    newAppHash = appUpdateData['hash_merchant'];
    appLink = appUpdateData['app_link_merchant'];
    latestVersion = appUpdateData['latest_version_merchant'];
    minVersion = appUpdateData['min_version_merchant'];
    isForceUpdate = buildNumber < minVersion;
    isNewReleaseAvailable = buildNumber < latestVersion;

    if (isForceUpdate) {
      showDialog(
          context: navKey.currentContext!,
          builder: (BuildContext ctx) {
            return WillPopScope(
              onWillPop: () async => false,
              child: ForceUpdateWidget(
                downloadLink: appLink,
              ),
            );
          });
    } else if (isNewReleaseAvailable) {
      if (currentAppHash != newAppHash) {
        return showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            context: navKey.currentContext!,
            builder: (context) {
              return NewReleaseAvailable(
                hashValue: newAppHash,
                downloadLink: appLink,
              );
            });
      }
    }
  } catch (error) {
    debugPrint(error.toString());
  }
}

Future initMessagingService({
  required GlobalKey<NavigatorState> navigationKey,
}) async {
  bool isPermissionGranted = true;
  try {
    FirebaseMessaging fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    isPermissionGranted = true;
  } catch (error) {
    debugPrint(error.toString());
  }
  //when app is in terminated state
  FirebaseMessaging.instance.getInitialMessage().then((message) {
    if (message != null) {
      Future.delayed(const Duration(seconds: 2)).then(
        (value) {
          return FCMDynamicLinkService.navigateUserToPage(
            message: message,
          );
        },
      );
    }
  });

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  if (isPermissionGranted) {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (Platform.isAndroid) {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: DateTime.now().microsecond,
            channelKey: AppConstants.channelKey,
            title: message.notification?.title,
            body: message.notification?.body,
            actionType: ActionType.Default,
            payload: message.data
                .map((key, value) => MapEntry(key, value.toString())),
          ),
        );
      }
      if (message.data.isEmpty) {
        return;
      }

      if (message.data['is_fcm'] == null) {
        return;
      }
    });
    //when app is in background state
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      FCMDynamicLinkService.navigateUserToPage(message: message);
    });
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
