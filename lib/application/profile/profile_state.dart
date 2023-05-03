part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,
    required ZoomDrawerController zoomDrawerController,
  }) = _ProfileState;

  factory ProfileState.initial({
    required ZoomDrawerController zoomDrawerController,
  }) {
    return ProfileState(
      zoomDrawerController: zoomDrawerController,
      isLoading: false,
    );
  }
}
