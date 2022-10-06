part of 'home_screen_bloc.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState(
      {required bool isLoading,
      required int currentPage,
      required bool showBottom}) = _HomeScreenState;

  factory HomeScreenState.initial({
    required final int currentPage,
  }) {
    return HomeScreenState(
        isLoading: false, currentPage: currentPage, showBottom: true);
  }
}

extension HomeScreenStateExtension on HomeScreenState {
  HomeScreenState get resetState {
    return copyWith(
      isLoading: false,
    );
  }
}
