part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState(
      {required bool isLoading,
      required bool isFailed,
      required bool isSuccess,
      required bool noUse,
            required bool showBottomSheet,
      required String apiUrl,
      required String showMessage,
      required AppStateNotifier appStateNotifier,
      required PlaceOrderRepository placeOrderRepository,
      required ZoomDrawerController zoomDrawerController,
      required TextEditingController phoneNumberController,
            required TextEditingController emailController,

      required TextEditingController nameController,

      required String errorPhoneNumber,
            required String errorEmailId,
      required String errorName,

      required Map<String, dynamic> selectedCountry,
      required bool showKeyboard,
      required List<OutletProductDto> addedProducts,
      required FocusNode focusNode}) = _CartState;

  factory CartState.initial(
      {required AppStateNotifier appStateNotifier,
      required String apiUrl,
      required String serverUrl,
      required ZoomDrawerController zoomDrawerController,
      required List<OutletProductDto> addedProducts}) {
    return CartState(
        appStateNotifier: appStateNotifier,
        zoomDrawerController: zoomDrawerController,
        isLoading: false,
        isFailed: false,
        isSuccess: false,
        noUse: false,
        showKeyboard: false,
        showBottomSheet: false,
        showMessage: '',
        errorEmailId: '',
        errorName: '',
        errorPhoneNumber: '',
        apiUrl: apiUrl,
        placeOrderRepository: IPlaceOrderRepository(
          apiUrl: apiUrl,
          serverUrl: serverUrl
        ),
        addedProducts: addedProducts,
        phoneNumberController: TextEditingController(),
        emailController:  TextEditingController(),
        nameController: TextEditingController(),
        selectedCountry: country[0],
        focusNode: FocusNode());
  }
}
