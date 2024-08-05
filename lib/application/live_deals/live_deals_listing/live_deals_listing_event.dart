part of 'live_deals_listing_bloc.dart';

@freezed
class LiveDealsListingEvent with _$LiveDealsListingEvent {
  const factory LiveDealsListingEvent.init() = _Init;
  const factory LiveDealsListingEvent.onLoad() = _OnLoad;
  const factory LiveDealsListingEvent.emitFromAnywhere({required LiveDealsListingState state}) =
      _EmitFromAnywhere;
}