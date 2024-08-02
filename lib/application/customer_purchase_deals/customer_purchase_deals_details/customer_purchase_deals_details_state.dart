part of 'customer_purchase_deals_details_bloc.dart';

@freezed
class CustomerPurchaseDealsDetailsState with _$CustomerPurchaseDealsDetailsState {
  const factory CustomerPurchaseDealsDetailsState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool noUse,
        required String serverUrl, 
    required String apiUrl
  }) = _CustomerPurchaseDealsDetailsState;

  factory CustomerPurchaseDealsDetailsState.initial(
      {required String serverUrl, required String apiUrl}) {
    return CustomerPurchaseDealsDetailsState(
      isLoading: false,
      isFailed: false,
      isSuccess: false,
      noUse: false,
      apiUrl: apiUrl,
      serverUrl: serverUrl,
    );
  }
}
