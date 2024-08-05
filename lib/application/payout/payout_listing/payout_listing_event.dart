part of 'payout_listing_bloc.dart';

@freezed
class PayoutListingEvent with _$PayoutListingEvent {
  const factory PayoutListingEvent.init() = _Init;
  const factory PayoutListingEvent.onLoad() = _OnLoad;
  const factory PayoutListingEvent.loadMore() = _LoadMore;
  const factory PayoutListingEvent.fetchBroughtDealsByDayOrMonth({
    required bool isMonth,
    required DateTime startDate,
    required DateTime endDate,
  }) = _FetchBroughtDealsByDayOrMonth;

  const factory PayoutListingEvent.emitFromAnywhere({required PayoutListingState state}) =
      _EmitFromAnywhere;
}