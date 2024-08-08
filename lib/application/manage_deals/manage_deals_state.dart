part of 'manage_deals_bloc.dart';

@freezed
class ManageDealsState with _$ManageDealsState {
  const factory ManageDealsState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool isAccountDeleted,
    required bool isShowLatestDealPopup,
    required String serverUrl,
    required String showMessage,
    required bool hasMoreDocs,
    required int currentPage,
    required int totalDeals,
    required DateTime currentDate,
    required AppStateNotifier appStateNotifier,
    required int skip,
    required int todaysDealsCount,
    required int latestDealCount,
    required double todaysRevenue,
    required String searchCustomerName,
    required DateTime startDate,
    required TextEditingController searchCustomerController,
    required List<BroughtDealDto> customerDeals,
    required ShopMerchantRepository shopMerchantRepository,
    required PlaceOrderRepository placeOrderRepository,
    required ScrollController scrollController,
    required ConfettiController confettiController,
    required ZoomDrawerController zoomDrawerController,
    required Function(int moveTo)? navCallBack,
    DateTime? endDate,
    BrandUserDto? profile,
  }) = _ManageDealsState;

  factory ManageDealsState.initial({
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
    required String apiUrl,
    required Function(int moveTo)? navCallBack,
    required ZoomDrawerController zoomDrawerController,
  }) {
    return ManageDealsState(
      currentDate: DateTime.now(),
      profile: appStateNotifier.profile,
      customerDeals: [],
      todaysRevenue: 0,
      navCallBack: navCallBack,

      skip: 0,
      isShowLatestDealPopup: false,
      startDate: DateTime.now(),
      searchCustomerName: '',
      confettiController:
          ConfettiController(duration: const Duration(seconds: 2)),
      placeOrderRepository:
          IPlaceOrderRepository(apiUrl: apiUrl, serverUrl: serverUrl),
      appStateNotifier: appStateNotifier,
      zoomDrawerController: zoomDrawerController,
      scrollController: ScrollController(),
      searchCustomerController: TextEditingController(),
      isLoading: true,
      isFailed: false,
      isSuccess: false,
      isAccountDeleted: false,
      todaysDealsCount: 0,
      showMessage: '',
      totalDeals: 0,
      latestDealCount: 0,
      currentPage: 1,
      hasMoreDocs: false,
      serverUrl: serverUrl,
      shopMerchantRepository: IShopMerchantRepository(
        serverUrl: serverUrl,
      ),
    );
  }
}
