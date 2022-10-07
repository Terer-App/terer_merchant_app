part of 'scan_bloc.dart';

@freezed
class ScanState with _$ScanState {
  const factory ScanState({
    required bool isLoading,
    required GlobalKey qrKey,
    Barcode? result,
    QRViewController? controller,
  }) = _ScanState;

  factory ScanState.initial({
    required final int currentPage,
  }) {
    return ScanState(
      isLoading: false,
      qrKey: GlobalKey(debugLabel: 'QR'),
    );
  }
}

extension ScanStateExtension on ScanState {
  ScanState get resetState {
    return copyWith(
      isLoading: false,
    );
  }
}
