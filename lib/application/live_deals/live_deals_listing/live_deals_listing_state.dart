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
    required String serverUrl, 
    required String apiUrl,
  }) = _LiveDealsListingState;

  factory LiveDealsListingState.initial(
      {required String serverUrl, required String apiUrl}) {
    return LiveDealsListingState(
      isLoading: true,
      isFailed: false,
      isSuccess: false,
      noUse: false,
      apiUrl: apiUrl,
      serverUrl: serverUrl,
      products: [],
      shopMerchantRepository: IShopMerchantRepository(serverUrl: serverUrl,apiUrl: apiUrl,),
    );
  }
}
