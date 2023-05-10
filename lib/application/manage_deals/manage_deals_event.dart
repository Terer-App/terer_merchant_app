part of 'manage_deals_bloc.dart';

@freezed
class ManageDealsEvent with _$ManageDealsEvent {
  const factory ManageDealsEvent.init() = _Init;
  const factory ManageDealsEvent.onLoad() = _OnLoad;
  const factory ManageDealsEvent.loadMore() = _LoadMore;

  const factory ManageDealsEvent.emitFromAnywhere(
      {required ManageDealsState state}) = _EmitFromAnywhere;
}
