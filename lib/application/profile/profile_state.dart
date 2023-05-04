part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,
    required AppStateNotifier appStateNotifier,
    MerchantDto? profile,
    required ZoomDrawerController zoomDrawerController,
  }) = _ProfileState;

  factory ProfileState.initial({
    required AppStateNotifier appStateNotifier,
    required ZoomDrawerController zoomDrawerController,
  }) {
    return ProfileState(
      appStateNotifier: appStateNotifier,
      profile: appStateNotifier.profile,
      zoomDrawerController: zoomDrawerController,
      isLoading: false,
    );
  }
}
