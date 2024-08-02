import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_purchase_deals_details_event.dart';
part 'customer_purchase_deals_details_state.dart';
part 'customer_purchase_deals_details_bloc.freezed.dart';

class CustomerPurchaseDealsDetailsBloc extends Bloc<
    CustomerPurchaseDealsDetailsEvent, CustomerPurchaseDealsDetailsState> {
  CustomerPurchaseDealsDetailsBloc(CustomerPurchaseDealsDetailsState initState)
      : super(initState) {
    on<_Init>((event, emit) {
      add(const CustomerPurchaseDealsDetailsEvent.onLoad());
    });
    on<_OnLoad>((event, emit) {});

    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
