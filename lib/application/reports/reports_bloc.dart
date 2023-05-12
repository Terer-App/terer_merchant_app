import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../domain/core/configs/app_config.dart';
import '../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../infrastructure/dtos/merchant_deal_dto/merchant_deal_dto.dart';
import '../../infrastructure/enums/deal_type.dart';
import '../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';

part 'reports_event.dart';
part 'reports_state.dart';
part 'reports_bloc.freezed.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  ReportsBloc(ReportsState initState) : super(initState) {
    bool isFetching = false;

    on<_Init>((event, emit) {
      add(const ReportsEvent.onLoad());
    });
    on<_OnLoad>((event, emit) async {
      final x = state.currentTab;

      final res = await state.shopMerchantRepository.merchantDeals(
        dealType: state.currentTabName.toLowerCase(),
        currentDate: state.currentTab == 1
            ? DateFormat('yyyy-MM-dd').format(state.currentDate)
            : null,
      );

      final y = state.currentTab;

      if (x != y) {
        return;
      }

      if (res.isNotEmpty) {
        List<MerchantDealDto> lsOfDeals = res['lsOfDeals'];
        int totalDeals = res['totalDeals'];
        emit(state.copyWith(
          totalDeals: totalDeals,
          lsOfDeals: lsOfDeals,
          hasMoreDocs: lsOfDeals.length < totalDeals,
          isLoading: false,
          currentPage: res['currentPage'],
        ));
      } else {
        emit(state.copyWith(
          totalDeals: 0,
          lsOfDeals: [],
          hasMoreDocs: false,
          isLoading: false,
          currentPage: 1,
        ));
      }

      if (state.hasMoreDocs) {
        state.scrollController.addListener(() {
          final double maxScroll =
              state.scrollController.position.maxScrollExtent;
          final double currentScroll = state.scrollController.position.pixels;
          const double delta = 100.0; // or something else..(-50.0)
          if (maxScroll - currentScroll <= delta) {
            if (state.hasMoreDocs) {
              if (!isFetching) {
                isFetching = true;
                add(const ReportsEvent.loadMore());
              }
            }
          }
        });
      }
    });

    on<_LoadMore>((event, emit) async {
      final res = await state.shopMerchantRepository.merchantDeals(
        dealType: state.currentTabName.toLowerCase(),
        currentDate: state.currentTab == 1
            ? DateFormat('yyyy-MM-dd').format(state.currentDate)
            : null,
        page: state.currentPage + 1,
      );

      if (res.isNotEmpty) {
        List<MerchantDealDto> lsOfDeals = res['lsOfDeals'];
        int totalDeals = res['totalDeals'];

        List<MerchantDealDto> updatedDeals = [...state.lsOfDeals, ...lsOfDeals];
        emit(state.copyWith(
          totalDeals: totalDeals,
          lsOfDeals: updatedDeals,
          hasMoreDocs: updatedDeals.length < totalDeals,
          currentPage: res['currentPage'],
        ));
      }

      isFetching = false;
    });

    on<_OnTabChange>((event, emit) {
      if (event.tabIndex == state.currentTab) {
        return;
      }

      emit(
        state.copyWith(
          isLoading: true,
          currentTab: event.tabIndex,
          currentTabName: event.tabName,
          lsOfDeals: [],
          currentDate: DateTime.now(),
          currentPage: 1,
        ),
      );

      add(const ReportsEvent.onLoad());
    });

    on<_OnDateChange>((event, emit) {
      DateTime newDate = state.currentDate;

      if (!event.isSelectedParticular) {
        if (event.isNext) {
          newDate = newDate.add(const Duration(days: 1));
        } else {
          newDate = newDate.subtract(const Duration(days: 1));
        }
      }

      emit(
        state.copyWith(
          currentDate: newDate,
          isLoading: true,
          currentTab: 1,
          lsOfDeals: [],
          currentTabName: DealType.REDEEMED.name,
          currentPage: 1,
        ),
      );

      add(const ReportsEvent.onLoad());
    });

    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
