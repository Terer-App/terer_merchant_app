part of 'live_deal_details_bloc.dart';

@freezed
class LiveDealDetailsState with _$LiveDealDetailsState {
  const factory LiveDealDetailsState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool noUse,
    required String serverUrl,
    required String apiUrl,
    required ShopMerchantRepository shopMerchantRepository,
    required OutletProductDto dealDetails,
    ProductVariantDto? selectedVariant,
  }) = _LiveDealDetailsState;

  factory LiveDealDetailsState.initial({
    required String serverUrl,
    required OutletProductDto dealDetails,
    required String apiUrl,
    ProductVariantDto? selectedVariant,
  }) {
    return LiveDealDetailsState(
      selectedVariant: selectedVariant,
      isLoading: false,
      isFailed: false,
      isSuccess: false,
      noUse: false,
      dealDetails: dealDetails,
      apiUrl: apiUrl,
      shopMerchantRepository: IShopMerchantRepository(serverUrl: serverUrl),
      serverUrl: serverUrl,
    );
  }
}
