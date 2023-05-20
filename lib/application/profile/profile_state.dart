part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool isAccountDeleted,
    required String serverUrl,
    required String showMessage,
    required AppStateNotifier appStateNotifier,
    required ShopMerchantRepository shopMerchantRepository,
    required ZoomDrawerController zoomDrawerController,
    required TextEditingController shopNameController,
    required TextEditingController shopAddressController,
    required TextEditingController shopEmailController,
    required TextEditingController shopPhoneController,
    required TextEditingController shopCodeController,
    MerchantDto? profile,
  }) = _ProfileState;

  factory ProfileState.initial({
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
    required ZoomDrawerController zoomDrawerController,
  }) {
    return ProfileState(
      appStateNotifier: appStateNotifier,
      profile: appStateNotifier.profile,
      zoomDrawerController: zoomDrawerController,
      isLoading: true,
      isFailed: false,
      isSuccess: false,
      isAccountDeleted: false,
      showMessage: '',
      serverUrl: serverUrl,
      shopMerchantRepository: IShopMerchantRepository(
        serverUrl: serverUrl,
      ),
      shopAddressController: TextEditingController(),
      shopEmailController: TextEditingController(),
      shopNameController: TextEditingController(),
      shopPhoneController: TextEditingController(),
      shopCodeController:TextEditingController(),
    );
  }
}
