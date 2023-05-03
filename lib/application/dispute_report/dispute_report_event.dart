part of 'dispute_report_bloc.dart';

@freezed
class DisputeReportEvent with _$DisputeReportEvent {
  const factory DisputeReportEvent.init() = _Init;
  const factory DisputeReportEvent.onLoad() = _OnLoad;

  const factory DisputeReportEvent.emitFromAnywhere(
      {required DisputeReportState state}) = _EmitFromAnywhere;
}
