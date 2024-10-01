import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'payout_details_event.dart';
part 'payout_details_state.dart';
part 'payout_details_bloc.freezed.dart';

class PayoutDetailsBloc extends Bloc<PayoutDetailsEvent, PayoutDetailsState> {
  PayoutDetailsBloc(PayoutDetailsState initState) : super(initState) {
    on<_Init>((event, emit) {
      add(const PayoutDetailsEvent.onLoad());
    });
    on<_OnLoad>((event, emit) {});

    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
