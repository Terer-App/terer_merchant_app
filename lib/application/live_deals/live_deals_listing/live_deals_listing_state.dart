part of 'live_deals_listing_bloc.dart';

@freezed
class LiveDealsListingState with _$LiveDealsListingState {
  const factory LiveDealsListingState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool noUse,
    required List<OutletProductDto> products,
    required ShopMerchantRepository shopMerchantRepository,
    required ScrollController scrollController,
    required String serverUrl,
    required String apiUrl,
    required BrandUserDto profile,
    required AppStateNotifier appStateNotifier,
  }) = _LiveDealsListingState;

  factory LiveDealsListingState.initial({
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
    required String apiUrl,
  }) {
    return LiveDealsListingState(
      isLoading: true,
      appStateNotifier: appStateNotifier,
      profile: appStateNotifier.profile!,
      isFailed: false,
      isSuccess: false,
      noUse: false,
      scrollController: ScrollController(),
      apiUrl: apiUrl,
      serverUrl: serverUrl,
      products: [],
      shopMerchantRepository: IShopMerchantRepository(
      serverUrl: serverUrl,
      apiUrl: apiUrl,
      ),
    );
  }
}
