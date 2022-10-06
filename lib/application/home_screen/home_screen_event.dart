part of 'home_screen_bloc.dart';

@freezed
class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.changePage({
    required int currentPage,
  }) = _ChangePage;
  const factory HomeScreenEvent.emitFromAnyWhere(
      {required HomeScreenState state}) = _EmitFromAnyWhere;
}
