import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/constants/api_constants.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/place_order/place_order_repository.dart';
import '../../../infrastructure/dtos/brand/user/brand_user_dto.dart';
import '../../../infrastructure/dtos/customer_order_with_history_dto/customer_order_with_history_dto.dart';
import '../../../infrastructure/place_order_repository/i_place_order_repository.dart';

part 'customer_purchase_deals_details_event.dart';
part 'customer_purchase_deals_details_state.dart';
part 'customer_purchase_deals_details_bloc.freezed.dart';

class CustomerPurchaseDealsDetailsBloc extends Bloc<
    CustomerPurchaseDealsDetailsEvent, CustomerPurchaseDealsDetailsState> {
  bool isFetching = false;

  CustomerPurchaseDealsDetailsBloc(CustomerPurchaseDealsDetailsState initState)
      : super(initState) {
    on<_Init>((event, emit) {
      add(const CustomerPurchaseDealsDetailsEvent.onLoad());

      state.scrollController.addListener(() {
        final double maxScroll =
            state.scrollController.position.maxScrollExtent;
        final double currentScroll = state.scrollController.position.pixels;
        const double delta = 50.0; // or something else..(-50.0)
        if (maxScroll - currentScroll <= delta) {
          if (state.hasMore) {
            if (!isFetching) {
              isFetching = true;
              add(const CustomerPurchaseDealsDetailsEvent.loadMore());
            }
          }
        }
      });
    });

    // on load
    on<_OnLoad>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final res = await state.placeOrderRepository
          .getCustomerOrdersWithRedemptionHistory(
        customerId: state.customerId,
        skip: state.skip,
        limit: APIConstants.limit,
      );

      if (res.isNotEmpty) {
        emit(state.copyWith(
          isLoading: false,
          orderHistory: res,
        ));
      } else {
        emit(state.copyWith(isLoading: false));
      }

      isFetching = false;
    });

    on<_LoadMore>((event, emit) async {
      emit(state.copyWith(
        skip: state.skip + APIConstants.limit,
      ));

      final res = await state.placeOrderRepository
          .getCustomerOrdersWithRedemptionHistory(
        customerId: state.customerId,
        skip: state.skip,
        limit: APIConstants.limit,
      );

      if (res.isNotEmpty) {
        List<CustomerOrderWithHistoryDto> updatedList = [
          ...res,
          ...state.orderHistory
        ];
        emit(state.copyWith(
          hasMore: res.length == APIConstants.limit,
          orderHistory: updatedList,
        ));
      } else {
        emit(state.copyWith(
          hasMore: false,
        ));
      }
      isFetching = false;
    });

    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
