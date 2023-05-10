part of 'reports_bloc.dart';

@freezed
class ReportsState with _$ReportsState {
  const factory ReportsState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool isAccountDeleted,
    required String serverUrl,
    required String showMessage,
    required bool hasMoreDocs,
    required int currentPage,
    required int currentTab,
    required String currentTabName,
    required DateTime currentDate,
    required int totalDeals,
    required AppStateNotifier appStateNotifier,
    required List<MerchantDealDto> lsOfDeals,
    required ShopMerchantRepository shopMerchantRepository,
    required ScrollController scrollController,
  }) = _ReportsState;

  factory ReportsState.initial({
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
    required String currentTabName,
    required int currentTab,
  }) {
    return ReportsState(
      appStateNotifier: appStateNotifier,
      scrollController: ScrollController(),
      isLoading: true,
      isFailed: false,
      isSuccess: false,
      isAccountDeleted: false,
      lsOfDeals: [],
      currentDate: DateTime.now(),
      showMessage: '',
      currentTab: currentTab,
      currentTabName: currentTabName,
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
