part of 'payout_details_bloc.dart';

@freezed
class PayoutDetailsEvent with _$PayoutDetailsEvent {
  const factory PayoutDetailsEvent.init() = _Init;
  const factory PayoutDetailsEvent.onLoad() = _OnLoad;
  const factory PayoutDetailsEvent.emitFromAnywhere({required PayoutDetailsState state}) =
      _EmitFromAnywhere;
}