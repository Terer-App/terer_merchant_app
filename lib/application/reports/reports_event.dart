part of 'reports_bloc.dart';

@freezed
class ReportsEvent with _$ReportsEvent {
  const factory ReportsEvent.init() = _Init;
  const factory ReportsEvent.onLoad() = _OnLoad;
  const factory ReportsEvent.loadMore() = _LoadMore;
  const factory ReportsEvent.onDateChange({required bool isNext}) =
      _OnDateChange;

  const factory ReportsEvent.onTabChange({
    required int tabIndex,
    required String tabName,
  }) = _OnTabChange;

  const factory ReportsEvent.emitFromAnywhere({required ReportsState state}) =
      _EmitFromAnywhere;
}
