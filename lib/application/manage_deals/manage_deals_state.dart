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
    required DateTime endDate,
    required DateTime latestDealTime,
    required DateTimeRange selectedDateTimeRange,
    required TextEditingController searchCustomerController,
    required List<BroughtDealDto> customerDeals,
    required ShopMerchantRepository shopMerchantRepository,
    required PlaceOrderRepository placeOrderRepository,
    required ScrollController scrollController,
    required Function(int moveTo)? navCallBack,
    BrandUserDto? profile,
  }) = _ManageDealsState;

  factory ManageDealsState.initial({
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
    required String apiUrl,
    required Function(int moveTo)? navCallBack,
  }) {
    return ManageDealsState(
      currentDate: DateTime.now(),
      profile: appStateNotifier.profile,
      customerDeals: [],
      todaysRevenue: 0,
      navCallBack: navCallBack,
      skip: 0,
      selectedDateTimeRange: DateTimeRange(
          start: DateTime(DateTime.now().year, DateTime.now().month, 1),
          end: DateTime.now()),
      isShowLatestDealPopup: false,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      searchCustomerName: '',
      latestDealTime: DateTime.now(),
      placeOrderRepository:
          IPlaceOrderRepository(apiUrl: apiUrl, serverUrl: serverUrl),
      appStateNotifier: appStateNotifier,
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
