part of 'live_deal_details_bloc.dart';

@freezed
class LiveDealDetailsEvent with _$LiveDealDetailsEvent {
  const factory LiveDealDetailsEvent.init() = _Init;
  const factory LiveDealDetailsEvent.onLoad() = _OnLoad;
  const factory LiveDealDetailsEvent.emitFromAnywhere({required LiveDealDetailsState state}) =
      _EmitFromAnywhere;
}