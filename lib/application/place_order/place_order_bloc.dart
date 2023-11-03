import 'package:bloc/bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../infrastructure/dtos/outlet/outlet_dto.dart';
import '../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';

part 'place_order_event.dart';
part 'place_order_state.dart';
part 'place_order_bloc.freezed.dart';

class PlaceOrderBloc extends Bloc<PlaceOrderEvent, PlaceOrderState> {
  PlaceOrderBloc(PlaceOrderState initState) : super(initState) {
    on<_Init>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await state.shopMerchantRepository.getAllotedBrandOutlets();

      if (res.length == 1) {
        emit(
          state.copyWith(
              isLoading: false, outlets: res, selectedOutlet: res[0]),
        );
      } else {
        emit(
          state.copyWith(
              isLoading: false, outlets: res, showOutletBottomSheet: true),
        );
      }
    });
    //
    on<_OnIncrementDealQuantity>((event, emit) {
      final dealIndex =
          state.deals.indexWhere((deal) => deal.productId == event.productId);

      if (dealIndex != -1) {
        final updatedDeal = state.deals[dealIndex];
        updatedDeal.quantity++;
        state.deals[dealIndex] = updatedDeal;
      }
      List<Deal> selectedDeals = state.deals.where((deal) => deal.quantity > 0).toList();

      emit(
        state.copyWith(deals: state.deals,
        selectedDeals: selectedDeals,
        noUse: !state.noUse
        ),
      );
    });
    on<_OnDecrementDealQuantity>((event, emit) {
      final dealIndex =
          state.deals.indexWhere((deal) => deal.productId == event.productId);

      if (dealIndex != -1) {
        final updatedDeal = state.deals[dealIndex];
        if (updatedDeal.quantity > 0) {
          updatedDeal.quantity--;
        }
        state.deals[dealIndex] = updatedDeal;
      }
            List<Deal> selectedDeals = state.deals.where((deal) => deal.quantity > 0).toList();

      emit(
        state.copyWith(deals: state.deals,
        selectedDeals: selectedDeals,
          noUse: !state.noUse),
        
      );
    });
    // emit from anywhere
    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
