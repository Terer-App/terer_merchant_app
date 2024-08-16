part of 'payout_listing_bloc.dart';

@Freezed(makeCollectionsUnmodifiable: false)
@freezed
class PayoutListingState with _$PayoutListingState {
  const factory PayoutListingState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool noUse,
    required bool hasMoreDocs,
    required bool isSelectedMonth,
    required String serverUrl,
    required String invoiceDocLink,
    required String apiUrl,
    required int skip,
    required bool isMonth,
    required AppStateNotifier appStateNotifier,
    required BrandUserDto profile,
    required ScrollController scrollController,
    required ShopMerchantRepository shopMerchantRepository,
    required PlaceOrderRepository placeOrderRepository,
    required List<BroughtDealDto> broughtDeals,
    required DateTime selectedDateTime,
    required DateTime startDate,
    required DateTime endDate,
  }) = _PayoutListingState;

  factory PayoutListingState.initial({
    required String serverUrl,
    required String apiUrl,
    required AppStateNotifier appStateNotifier,
  }) {
    return PayoutListingState(
        isLoading: false,
        isFailed: false,
        scrollController: ScrollController(),
        hasMoreDocs: false,
        skip: 0,
        isMonth: false,
        shopMerchantRepository:
            IShopMerchantRepository(serverUrl: serverUrl, apiUrl: apiUrl),
        selectedDateTime: DateTime.now(),
        endDate: DateTime.now(),
        startDate: DateTime.now(),
        appStateNotifier: appStateNotifier,
        profile: appStateNotifier.profile!,
        isSuccess: false,
        noUse: false,
        apiUrl: apiUrl,
        serverUrl: serverUrl,
        broughtDeals: [],
        isSelectedMonth: true,
        invoiceDocLink: '',
        placeOrderRepository:
            IPlaceOrderRepository(apiUrl: apiUrl, serverUrl: serverUrl));
  }
}
