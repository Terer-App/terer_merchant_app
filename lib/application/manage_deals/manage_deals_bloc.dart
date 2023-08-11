import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../domain/core/configs/app_config.dart';
import '../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../infrastructure/dtos/merchant_deal_dto/merchant_deal_dto.dart';
import '../../infrastructure/dtos/brand/user/brand_user_dto.dart';
import '../../infrastructure/enums/deal_type.dart';
import '../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';

part 'manage_deals_event.dart';
part 'manage_deals_state.dart';
part 'manage_deals_bloc.freezed.dart';

class ManageDealsBloc extends Bloc<ManageDealsEvent, ManageDealsState> {
  ManageDealsBloc(ManageDealsState initState) : super(initState) {
    bool isFetching = false;

    on<_Init>((event, emit) {
      add(const ManageDealsEvent.onLoad());
    });
    on<_OnLoad>((event, emit) async {
      final res = await state.shopMerchantRepository.merchantDeals(
        dealType: DealType.REDEEMED.name.toLowerCase(),
        currentDate: DateFormat('yyyy-MM-dd').format(state.currentDate),
      );

      if (res.isNotEmpty) {
        List<MerchantDealDto> lsOfDeals = res['lsOfDeals'];
        int totalDeals = res['totalDeals'];
        emit(state.copyWith(
          totalDeals: totalDeals,
          todaysDeals: lsOfDeals,
          hasMoreDocs: lsOfDeals.length < totalDeals,
          isLoading: false,
          currentPage: res['currentPage'],
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
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
                add(const ManageDealsEvent.loadMore());
              }
            }
          }
        });
      }
    });

    on<_LoadMore>((event, emit) async {
      final res = await state.shopMerchantRepository.merchantDeals(
        dealType: DealType.REDEEMED.name.toLowerCase(),
        currentDate: DateFormat('yyyy-MM-dd').format(state.currentDate),
        page: state.currentPage + 1,
      );

      if (res.isNotEmpty) {
        List<MerchantDealDto> lsOfDeals = res['lsOfDeals'];
        int totalDeals = res['totalDeals'];

        List<MerchantDealDto> updatedDeals = [
          ...state.todaysDeals,
          ...lsOfDeals
        ];
        emit(state.copyWith(
          totalDeals: totalDeals,
          todaysDeals: updatedDeals,
          hasMoreDocs: updatedDeals.length < totalDeals,
          currentPage: res['currentPage'],
        ));
      }

      isFetching = false;
    });

    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
