part of 'payout_details_bloc.dart';

@freezed
class PayoutDetailsState with _$PayoutDetailsState {
  const factory PayoutDetailsState({
    required bool isLoading,
    required bool isFailed,
    required bool isSuccess,
    required bool noUse,
    required String serverUrl, 
    required String apiUrl
  }) = _PayoutDetailsState;

  factory PayoutDetailsState.initial(
      {required String serverUrl, required String apiUrl}) {
    return PayoutDetailsState(
      isLoading: false,
      isFailed: false,
      isSuccess: false,
      noUse: false,
      apiUrl: apiUrl,
      serverUrl: serverUrl,
    );

  }
}
