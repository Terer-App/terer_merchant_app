part of 'manage_deals_bloc.dart';

@freezed
class ManageDealsState with _$ManageDealsState {
  const factory ManageDealsState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool isAccountDeleted,
    required String serverUrl,
    required String showMessage,
    required bool hasMoreDocs,
    required int currentPage,
    required int totalDeals,
    required DateTime currentDate,
    required AppStateNotifier appStateNotifier,
    required int skip,
    required int todaysDealsCount,
    required double todaysRevenue,
    required String searchCustomerName,
    required DateTime startDate,
    required DateTime endDate,
    required TextEditingController searchCustomerController,
    required List<BroughtDealDto> customerDeals,
    required ShopMerchantRepository shopMerchantRepository,
    required PlaceOrderRepository placeOrderRepository,
    required ScrollController scrollController,
    required ZoomDrawerController zoomDrawerController,
    BrandUserDto? profile,
  }) = _ManageDealsState;

  factory ManageDealsState.initial({
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
    required String apiUrl,
    required ZoomDrawerController zoomDrawerController,
  }) {
    return ManageDealsState(
      currentDate: DateTime.now(),
      profile: appStateNotifier.profile,
      customerDeals: [],
      todaysRevenue: 0,
      skip: 0,
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      searchCustomerName: '',
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
      todaysDealsCount:0,
      showMessage: '',
      totalDeals: 0,
      currentPage: 1,
      hasMoreDocs: false,
      serverUrl: serverUrl,
      shopMerchantRepository: IShopMerchantRepository(
        serverUrl: serverUrl,
      ),
    );
  }
}
