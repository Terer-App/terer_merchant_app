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
    required List<MerchantDealDto> todaysDeals,
    required ShopMerchantRepository shopMerchantRepository,
    required ScrollController scrollController,
    required ZoomDrawerController zoomDrawerController,
    BrandUserDto? profile,
  }) = _ManageDealsState;

  factory ManageDealsState.initial({
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
    required ZoomDrawerController zoomDrawerController,
  }) {
    return ManageDealsState(
      currentDate: DateTime.now(),
      profile: appStateNotifier.profile,
      appStateNotifier: appStateNotifier,
      zoomDrawerController: zoomDrawerController,
      scrollController: ScrollController(),
      isLoading: true,
      isFailed: false,
      isSuccess: false,
      isAccountDeleted: false,
      todaysDeals: [],
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
