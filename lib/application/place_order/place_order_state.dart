part of 'place_order_bloc.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PlaceOrderState with _$PlaceOrderState {
  const factory PlaceOrderState(
      {required bool isLoading,
      required bool isFailed,
      required bool isSuccess,
      required bool noUse,
      required bool showOutletBottomSheet,
      required String serverUrl,
      required String apiUrl,
      required String showMessage,
      required AppStateNotifier appStateNotifier,
      required PlaceOrderRepository placeOrderRepository,
      required ShopMerchantRepository shopMerchantRepository,
      required List<OutletDto> outlets,
      required List<OutletProductDto> outletProducts,
      required List<OutletProductDto> selectedOutletProducts,
      required List<OutletProductDto> searchedOutletProducts,
      required TextEditingController searchController,
      OutletDto? selectedOutlet}) = _PlaceOrderState;

  factory PlaceOrderState.initial({
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
    required String apiUrl,
  }) {
    return PlaceOrderState(
      appStateNotifier: appStateNotifier,
      isLoading: true,
      isFailed: false,
      isSuccess: false,
      showOutletBottomSheet: false,
      noUse: false,
      searchController: TextEditingController(),
      showMessage: '',
      serverUrl: serverUrl,
      apiUrl: apiUrl,
      shopMerchantRepository: IShopMerchantRepository(serverUrl: serverUrl),
      placeOrderRepository: IPlaceOrderRepository(apiUrl: apiUrl,serverUrl: serverUrl),
      outlets: [],
      outletProducts: [],
      selectedOutletProducts: [],
      searchedOutletProducts: [],
         );
  }
}


