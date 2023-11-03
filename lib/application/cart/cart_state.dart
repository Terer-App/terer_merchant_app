part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState(
      {required bool isLoading,
      required bool isFailed,
      required bool isSuccess,
      required bool noUse,
      required String serverUrl,
      required String showMessage,
      required AppStateNotifier appStateNotifier,
      required ShopMerchantRepository shopMerchantRepository,
      required ZoomDrawerController zoomDrawerController,
      required TextEditingController phoneNumberController,
      required Map<String, dynamic> selectedCountry,
      required bool showKeyboard,
      required List<Deal> selectedDeals}) = _CartState;

  factory CartState.initial(
      {required AppStateNotifier appStateNotifier,
      required String serverUrl,
      required ZoomDrawerController zoomDrawerController,
      required List<Deal> selectedDeals}) {
    return CartState(
      appStateNotifier: appStateNotifier,
      zoomDrawerController: zoomDrawerController,
      isLoading: true,
      isFailed: false,
      isSuccess: false,
      noUse: false,
      showKeyboard: false,
      showMessage: '',
      serverUrl: serverUrl,
      shopMerchantRepository: IShopMerchantRepository(
        serverUrl: serverUrl,
      ),
      selectedDeals: selectedDeals,
      phoneNumberController: TextEditingController(),
      selectedCountry: country[0],
    );
  }
}
