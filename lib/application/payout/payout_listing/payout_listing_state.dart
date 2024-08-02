part of 'payout_listing_bloc.dart';
@Freezed(
  makeCollectionsUnmodifiable: false
)
@freezed
class PayoutListingState with _$PayoutListingState {
  const factory PayoutListingState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool noUse,
    required bool isSelectedMonth,
    required String serverUrl,
    required String invoiceDocLink,
    required String apiUrl,
    required AppStateNotifier appStateNotifier,
    required BrandUserDto profile,
    required ShopMerchantRepository shopMerchantRepository,
    required PlaceOrderRepository placeOrderRepository,
    required List<BroughtDealDto> broughtDeals,
    required DateTime selectedDateTime,
  }) = _PayoutListingState;

  factory PayoutListingState.initial({
    required String serverUrl,
    required String apiUrl,
    required AppStateNotifier appStateNotifier,
  }) {
    return PayoutListingState(
        isLoading: false,
        isFailed: false,
        shopMerchantRepository:
            IShopMerchantRepository(serverUrl: serverUrl, apiUrl: apiUrl),
        selectedDateTime: DateTime.now(),
        appStateNotifier: appStateNotifier,
        profile: appStateNotifier.profile!,
        isSuccess: false,
        noUse: false,
        apiUrl: apiUrl,
        serverUrl: serverUrl,
        broughtDeals: [],
        isSelectedMonth: false,
        invoiceDocLink: '',
        placeOrderRepository:
            IPlaceOrderRepository(apiUrl: apiUrl, serverUrl: serverUrl));
  }
}
