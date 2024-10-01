class APIConstants {
  // Auth
  static const int limit = 10;
  static const String merchantApis = 'merchant/dev/api/';

  static const String products = 'products/';
  static const String merchant = 'merchant/';

  static const String loginAsMerchant = '${merchantApis}login.php';
  static const String merchantProfile = '${merchantApis}profile.php';
  static const String deleteAccount = '${merchantApis}deleteProfileRequest.php';

  static const String disputeReport = '${merchantApis}disputeReport.php';
  static const String contactUs = '${merchantApis}contactUs.php';

  static const String verifyCustomerDeal =
      '${merchantApis}verifyCustomerDeal.php';
  static const String verifyDealAnyways =
      '${merchantApis}verifyDealAnyways.php';
  static const String merchantDeals = '${merchantApis}merchantDeals.php';
  static const String getAllotedOutlets =
      '${merchantApis}get_alloted_outlets.php';
  static const String placeOrder = '${merchantApis}place_order_as_merchant.php';
  static const String checkUserByEmail =
      '${merchantApis}check_user_by_email.php';
  static const String checkUserByNumber =
      '${merchantApis}check_user_by_phone.php';

  static const String addFcmToken = 'shopify_graphql/add_fcm_token.php';
  static const String getProductById = 'shopify_graphql/get_product_by_id.php';

  static const String removeFcmToken = 'shopify_graphql/delete_fcm_token.php';
  static const String getOutletProducts = '${products}outlet-products';
  static const String getMerchantProducts = '${products}merchant-products';
  static const String invoiceDocLink = 'invoice/doc-link';
  static const String getCustomerOrders = 'brands/get-customer-orders';
  static const String getLatestOrders = 'brands/get-latest-orders';
  static const String getCustomerWithRedemption =
      'brands/get-customer-orders-with-redemption';
  static const String dealHistory = '$merchant/deal_history/verify';
}
