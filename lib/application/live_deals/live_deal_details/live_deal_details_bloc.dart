import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../../infrastructure/dtos/place_order/outlet_product/outlet_product_dto.dart';
import '../../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';

part 'live_deal_details_event.dart';
part 'live_deal_details_state.dart';
part 'live_deal_details_bloc.freezed.dart';

class LiveDealDetailsBloc extends Bloc<LiveDealDetailsEvent, LiveDealDetailsState> {
  LiveDealDetailsBloc(LiveDealDetailsState initState) : super(initState) {
    on<_Init>((event, emit) {
      add(const LiveDealDetailsEvent.onLoad());
    });
    on<_OnLoad>((event, emit) {});

    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
