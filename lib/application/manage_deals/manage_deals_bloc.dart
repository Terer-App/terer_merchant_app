import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../domain/core/configs/app_config.dart';
import '../../domain/place_order/place_order_repository.dart';
import '../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../infrastructure/dtos/brought_deal_dto/brought_deal_dto.dart';
import '../../infrastructure/dtos/brand/user/brand_user_dto.dart';
import '../../infrastructure/place_order_repository/i_place_order_repository.dart';
import '../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';

part 'manage_deals_event.dart';
part 'manage_deals_state.dart';
part 'manage_deals_bloc.freezed.dart';

class ManageDealsBloc extends Bloc<ManageDealsEvent, ManageDealsState> {
  ManageDealsBloc(ManageDealsState initState) : super(initState) {
    bool isFetching = false;

    on<_Init>((event, emit) {
      add(const ManageDealsEvent.onLoad());

      state.scrollController.addListener(() {
        final double maxScroll =
            state.scrollController.position.maxScrollExtent;
        final double currentScroll = state.scrollController.position.pixels;
        const double delta = 100.0; // or something else..(-50.0)
        if (maxScroll - currentScroll <= delta) {
          if (state.hasMoreDocs) {
            if (!isFetching) {
              isFetching = true;
              add(const ManageDealsEvent.loadMore());
            }
          }
        }
      });
    });

    // on load
    on<_OnLoad>((event, emit) async {
      final res = await state.placeOrderRepository.getCustomersOrders(
        brandId: state.profile!.brand.id,
        startDate: '01/07/2024',
        endDate: '05/08/2024',
        isTodaysCount: true,
      );

      if (res.isNotEmpty) {
        emit(state.copyWith(
          isLoading: false,
          customerDeals: res['deals'],
          todaysDealsCount: res['todaysDeals'],
          todaysRevenue: res['todaysRevenue'],
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
        ));
      }
    });

    on<_LoadMore>((event, emit) async {
      final res = await state.placeOrderRepository.getCustomersOrders(
        brandId: state.profile!.brand.id,
        startDate: DateFormat('dd/MM/y').format(state.startDate),
        endDate: DateFormat('dd/MM/y').format(state.endDate),
        limit: 10,
        skip: state.skip + 10,
      );

      if (res.isNotEmpty) {
        List<BroughtDealDto> lsOfDeals = res['deals'];
        List<BroughtDealDto> updatedDeals = [
          ...state.customerDeals,
          ...lsOfDeals
        ];
        int totalDeals = res['totalDeals'];

        emit(state.copyWith(
          hasMoreDocs: updatedDeals.length <= totalDeals,
          customerDeals: res['deals'],
        ));
      } else {
        emit(state.copyWith(
          hasMoreDocs: false,
        ));
      }

      isFetching = false;
    });

    on<_FetchCustomerOrders>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        endDate: event.endDate,
        startDate: event.startDate,
      ));

      final res = await state.placeOrderRepository.getCustomersOrders(
        brandId: state.profile!.brand.id,
        startDate: DateFormat('dd/MM/y').format(state.startDate),
        endDate: DateFormat('dd/MM/y').format(state.endDate),
        limit: 10,
        skip: state.skip,
        customerName: state.searchCustomerController.text.trim(),
      );

      if (res.isNotEmpty) {
        emit(state.copyWith(
          isLoading: false,
          hasMoreDocs: res['deals'].length <= res['totalDeals'],
          customerDeals: res['deals'],
        ));

      }
    });

    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
