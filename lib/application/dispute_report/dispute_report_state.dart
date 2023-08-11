part of 'dispute_report_bloc.dart';

@freezed
class DisputeReportState with _$DisputeReportState {
  const factory DisputeReportState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool validateForm,
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
    required String showMessage,
    required GlobalKey<FormState> formKey,
    required UploadFileRepository uploadFileRepository,
    required ShopMerchantRepository shopMerchantRepository,
    required TextEditingController messageController,
    BrandUserDto? profile,
    http.MultipartFile? attachImageFile,
    required String attachImagePath,
  }) = _DisputeReportState;

  factory DisputeReportState.initial({
    required AppStateNotifier appStateNotifier,
    required String serverUrl,
  }) {
    return DisputeReportState(
      isLoading: false,
      isFailed: false,
      isSuccess: false,
      messageController: TextEditingController(),
      serverUrl: serverUrl,
      showMessage: '',
      uploadFileRepository: IUploadFileRepository(),
      shopMerchantRepository: IShopMerchantRepository(serverUrl: serverUrl),
      profile: appStateNotifier.profile,
      attachImagePath: '',
      formKey: GlobalKey<FormState>(),
      validateForm: false,
      appStateNotifier: appStateNotifier,
    );
  }
}
