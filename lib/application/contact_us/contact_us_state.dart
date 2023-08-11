part of 'contact_us_bloc.dart';

@freezed
class ContactUsState with _$ContactUsState {
  const factory ContactUsState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool validateForm,
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
    required String showMessage,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController messageController,
    required ShopMerchantRepository shopMerchantRepository,
    required UploadFileRepository uploadFileRepository,
    required GlobalKey<FormState> formKey,
    BrandUserDto? profile,
    http.MultipartFile? attachImageFile,
    required String attachImagePath,
  }) = _ContactUsState;

  factory ContactUsState.initial({
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
  }) {
    return ContactUsState(
      isLoading: true,
      appStateNotifier: appStateNotifier,
      isFailed: false,
      isSuccess: false,
      attachImagePath: '',
      validateForm: false,
      showMessage: '',
      formKey: GlobalKey<FormState>(),
      serverUrl: serverUrl,
      profile: appStateNotifier.profile,
      uploadFileRepository: IUploadFileRepository(),
      shopMerchantRepository: IShopMerchantRepository(serverUrl: serverUrl),
      emailController: TextEditingController(),
      messageController: TextEditingController(),
      nameController: TextEditingController(),
    );
  }
}
