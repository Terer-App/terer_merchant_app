part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool validateForm,
    required String showMessage,
    required GlobalKey<FormState> formKey,
    required AuthRepository authRepository,
    required ShopMerchantRepository shopMerchantRepository,
    required TextEditingController userNameController,
    required TextEditingController passwordController,
    MerchantDto? merchantDto,
  }) = _LoginState;

  factory LoginState.initial(
      {required String merchantApi, required String serverUrl}) {
    return LoginState(
      isLoading: false,
      isFailed: false,
      isSuccess: false,
      validateForm: false,
      showMessage: '',
      shopMerchantRepository: IShopMerchantRepository(
        serverUrl: serverUrl,
      ),
      authRepository: IAuthRepository(
        merchantApi: merchantApi,
      ),
      formKey: GlobalKey<FormState>(),
      userNameController: TextEditingController(),
      passwordController: TextEditingController(),
    );
  }
}
