part of 'customer_purchase_deals_details_bloc.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CustomerPurchaseDealsDetailsState
    with _$CustomerPurchaseDealsDetailsState {
  const factory CustomerPurchaseDealsDetailsState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool noUse,
    required bool hasMore,
    required String responseMsg,
    required String serverUrl,
    required String customerId,
    required String name,
    required int skip,
    required ScrollController scrollController,
    required List<CustomerOrderWithHistoryDto> orderHistory,
    required PlaceOrderRepository placeOrderRepository,
    required BrandUserDto profile,
    required AppStateNotifier appStateNotifier,
    required String apiUrl,
  }) = _CustomerPurchaseDealsDetailsState;

  factory CustomerPurchaseDealsDetailsState.initial({
    required String serverUrl,
    required String apiUrl,
    required String customerId,
    required String name,
    required AppStateNotifier appStateNotifier,
  }) {
    return CustomerPurchaseDealsDetailsState(
      isLoading: false,
      isFailed: false,
      isSuccess: false,
      hasMore: false,
      skip: 0,
      responseMsg: '',
      customerId: customerId,
      name: name,
      scrollController: ScrollController(),
      orderHistory: [],
      appStateNotifier: appStateNotifier,
      profile: appStateNotifier.profile!,
      placeOrderRepository:
          IPlaceOrderRepository(apiUrl: apiUrl, serverUrl: serverUrl),
      noUse: false,
      apiUrl: apiUrl,
      serverUrl: serverUrl,
    );
  }
}
