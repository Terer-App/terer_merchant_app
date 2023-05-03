part of 'dispute_report_bloc.dart';

@freezed
class DisputeReportState with _$DisputeReportState {
  const factory DisputeReportState({
    required bool isLoading,
  }) = _DisputeReportState;

  factory DisputeReportState.initial() {
    return const DisputeReportState(
      isLoading: false,
    );
  }
}
