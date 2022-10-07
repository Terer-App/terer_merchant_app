part of 'scan_bloc.dart';

@freezed
class ScanEvent with _$ScanEvent {
  const factory ScanEvent.started() = _Started;
  const factory ScanEvent.emitFromAnywhere({required ScanState state}) =
      _EmitFromAnywhere;
}
