import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../domain/constants/api_constants.dart';
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
  bool isFetching = false;
  // ignore: no_leading_underscores_for_local_identifiers
  Timer? _timer;
  @override
  Future<void> close() async {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.close();
  }

  ManageDealsBloc(ManageDealsState initState) : super(initState) {
    on<_Init>((event, emit) {
      add(const ManageDealsEvent.onLoad());

      state.scrollController.addListener(() {
        final double maxScroll =
            state.scrollController.position.maxScrollExtent;
        final double currentScroll = state.scrollController.position.pixels;
        const double delta = 50.0; // or something else..(-50.0)
        if (maxScroll - currentScroll <= delta) {
          if (state.hasMoreDocs) {
            if (!isFetching) {
              isFetching = true;
              add(const ManageDealsEvent.loadMore());
            }
          }
        }
      });

// check for latest deal after every 5 sec
      _timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
        add(const ManageDealsEvent.checkForLatestDeal());
      });
    });

    // on load
    on<_OnLoad>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        startDate: state.selectedDateTimeRange.start,
        endDate: state.selectedDateTimeRange.end,
      ));
      final res = await state.placeOrderRepository.getCustomersOrders(
        skip: 0,
        startDate: DateFormat('dd/MM/y').format(state.startDate),
        endDate: DateFormat('dd/MM/y').format(
          state.endDate,
        ),
        limit: APIConstants.limit,
        isTodaysCount: true,
      );

      if (res.isNotEmpty) {
        emit(state.copyWith(
          isLoading: false,
          customerDeals: res['deals'],
          hasMoreDocs: res['deals'].length == APIConstants.limit,
          todaysDealsCount: res['todaysDeals'],
          todaysRevenue: res['todaysRevenue'],
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          hasMoreDocs: false,
        ));
      }
      isFetching = false;
    });

    on<_LoadMore>((event, emit) async {
      emit(state.copyWith(skip: state.skip + APIConstants.limit));
      final res = await state.placeOrderRepository.getCustomersOrders(
        startDate: DateFormat('dd/MM/y').format(state.startDate),
        endDate: DateFormat('dd/MM/y').format(state.endDate),
        limit: APIConstants.limit,
        skip: state.skip,
      );

      if (res.isNotEmpty) {
        List<BroughtDealDto> lsOfDeals = res['deals'];
        List<BroughtDealDto> updatedDeals = [
          ...state.customerDeals,
          ...lsOfDeals
        ];

        emit(state.copyWith(
          hasMoreDocs: lsOfDeals.length == APIConstants.limit,
          customerDeals: updatedDeals,
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
        skip: 0,
        selectedDateTimeRange:
            DateTimeRange(start: event.startDate, end: event.endDate),
        endDate: event.endDate,
        startDate: event.startDate,
      ));

      final res = await state.placeOrderRepository.getCustomersOrders(
        startDate: DateFormat('dd/MM/y').format(state.startDate),
        endDate: DateFormat('dd/MM/y').format(
          state.endDate,
        ),
        limit: APIConstants.limit,
        skip: state.skip,
        isTodaysCount: true,
        customerName: state.searchCustomerController.text.trim(),
      );

      if (res.isNotEmpty) {
        emit(state.copyWith(
          isLoading: false,
          hasMoreDocs: res['deals'].length == APIConstants.limit,
          customerDeals: res['deals'],
          todaysDealsCount: res['todaysDeals'],
          todaysRevenue: res['todaysRevenue'],
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          hasMoreDocs: false,
        ));
      }
    });

    on<_CheckForLatestDeal>((event, emit) async {
      final res = await state.placeOrderRepository.getLatestDeals(
        startTime: state.latestDealTime.toString(),
      );

      if (res.isNotEmpty) {
        emit(state.copyWith(
          latestDealCount: res.length,
          isShowLatestDealPopup: state.latestDealCount != res.length,
        ));
      }
    });

    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
