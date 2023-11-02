import 'package:firebase_messaging/firebase_messaging.dart';

import '../../core/configs/injection.dart';
import '../navigation_service/navigation_service.dart';
import '../navigation_service/routers/route_names.dart';


class FCMDynamicLinkService {
  static Future<void> navigateUserToPage(
      {required RemoteMessage message,
    //  required GraphQLService graphQLService
      }) async {
    final data = message.data;
    // if (data['notificationHistoryId'] != null) {
    //   CustomerRepository customerRepository =
    //       ICustomerRepository(graphQLService: graphQLService, apiBaseUrl: '');
    //   await customerRepository
    //       .makeNotificationsSeen(data['notificationHistoryId']);
    // }
    switch (data['type']) {
      // case NotificationNavigateToConstants.cart:
      //   navigator<NavigationService>().navigateTo(
      //     UserRoutes.cartRoute,
      //   );
      //   break;

      default:
           navigator<NavigationService>()
                .navigateTo(CoreRoutes.homeRoute, isClearStack: true);
    }
  }
}
