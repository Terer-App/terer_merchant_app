import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../../infrastructure/dtos/place_order/outlet_product/outlet_product_dto.dart';
import '../../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';

part 'live_deals_listing_event.dart';
part 'live_deals_listing_state.dart';
part 'live_deals_listing_bloc.freezed.dart';

class LiveDealsListingBloc
    extends Bloc<LiveDealsListingEvent, LiveDealsListingState> {
  LiveDealsListingBloc(LiveDealsListingState initState) : super(initState) {
    on<_Init>((event, emit) {
      add(const LiveDealsListingEvent.onLoad());
    });
    on<_OnLoad>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      final res =
          await state.shopMerchantRepository.getProductsByMerchant(brandId: 'BR_00002');

      emit(state.copyWith(isLoading: false, products: res));
    });

    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
