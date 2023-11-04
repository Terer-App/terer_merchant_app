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
      required String showMessage,
      required AppStateNotifier appStateNotifier,
      required ShopMerchantRepository shopMerchantRepository,
      required ZoomDrawerController zoomDrawerController,
      required List<OutletDto> outlets,
      required List<Deal> deals,
      required List<Deal> selectedDeals,
      required List<Deal> searchedDeals,
      required TextEditingController searchController,
      OutletDto? selectedOutlet}) = _PlaceOrderState;

  factory PlaceOrderState.initial({
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
    required ZoomDrawerController zoomDrawerController,
  }) {
    return PlaceOrderState(
      appStateNotifier: appStateNotifier,
      zoomDrawerController: zoomDrawerController,
      isLoading: true,
      isFailed: false,
      isSuccess: false,
      showOutletBottomSheet: false,
      noUse: false,
      searchController: TextEditingController(),
      showMessage: '',
      serverUrl: serverUrl,
      shopMerchantRepository: IShopMerchantRepository(
        serverUrl: serverUrl,
      ),
      outlets: [],
      selectedDeals: [],
      searchedDeals: [],
      deals: [
        Deal(
          productId: 1,
          dealName: 'Coffee 5',
          currencyCode: 'USD',
          assetImage:  AssetConstants.coffeeImage,
          actualPrice: 20.0,
          discountedPrice: 15.0,
        ),
        Deal(
          productId: 2,
          dealName: 'Cake 6',
          currencyCode: 'USD',
          assetImage:  AssetConstants.coffeeImage,
          actualPrice: 30.0,
          discountedPrice: 25.0,
        ),
        Deal(
          productId: 3,
          dealName: 'Coffee 12',
          currencyCode: 'USD',
          assetImage:  AssetConstants.coffeeImage,
          actualPrice: 25.0,
          discountedPrice: 20.0,
        ),
      ],
    );
  }
}

class Deal {
  final int productId;
  final String dealName;
  final String currencyCode;
  final String assetImage;
  final double actualPrice;
  final double discountedPrice;
  int quantity;

  Deal({
    required this.productId,
    required this.dealName,
    required this.currencyCode,
    required this.actualPrice,
    required this.assetImage,
    required this.discountedPrice,
    this.quantity = 0,
  });
}
