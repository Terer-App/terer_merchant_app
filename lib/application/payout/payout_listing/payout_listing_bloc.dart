import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../../domain/constants/api_constants.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/place_order/place_order_repository.dart';
import '../../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../../infrastructure/dtos/brand/user/brand_user_dto.dart';
import '../../../infrastructure/dtos/brought_deal_dto/brought_deal_dto.dart';
import '../../../infrastructure/place_order_repository/i_place_order_repository.dart';
import '../../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';

part 'payout_listing_event.dart';
part 'payout_listing_state.dart';
part 'payout_listing_bloc.freezed.dart';

class PayoutListingBloc extends Bloc<PayoutListingEvent, PayoutListingState> {
  bool isFetching = false;

  PayoutListingBloc(PayoutListingState initState) : super(initState) {
    on<_Init>((event, emit) {
      add(const PayoutListingEvent.onLoad());

      state.scrollController.addListener(() {
        final double maxScroll =
            state.scrollController.position.maxScrollExtent;
        final double currentScroll = state.scrollController.position.pixels;
        const double delta = 50.0; // or something else..(-50.0)
        if (maxScroll - currentScroll <= delta) {
          if (state.hasMoreDocs) {
            if (!isFetching) {
              isFetching = true;
              add(const PayoutListingEvent.loadMore());
            }
          }
        }
      });
    });

    // on load
    on<_OnLoad>((event, emit) {
      add(PayoutListingEvent.fetchBroughtDealsByDayOrMonth(
        isMonth: false,
        startDate: state.selectedDateTime,
        endDate: state.selectedDateTime,
      ));
    });

    on<_LoadMore>((event, emit) async {
      emit(state.copyWith(
        skip: state.skip + APIConstants.limit,
      ));

      final res = await state.placeOrderRepository.getBroughtDealsByInvoiceDate(
        brandId: state.profile.brand.id,
        skip: state.skip,
        startDate: DateFormat('dd/MM/y').format(
          state.startDate,
        ),
        endDate: DateFormat('dd/MM/y').format(
          state.endDate,
        ),
      );

      List<BroughtDealDto> updatedDeals = [...res, ...state.broughtDeals];

      emit(state.copyWith(
        isLoading: false,
        broughtDeals: updatedDeals,
        hasMoreDocs: res.length == APIConstants.limit,
      ));

      isFetching = false;
    });

    on<_FetchBroughtDealsByDayOrMonth>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          selectedDateTime: event.startDate,
          isSelectedMonth: event.isMonth,
          startDate: event.startDate,
          endDate: event.endDate,
        ),
      );

      final res = await state.placeOrderRepository.getBroughtDealsByInvoiceDate(
        brandId: state.profile.brand.id,
        limit: APIConstants.limit,
        skip: state.skip,
        startDate: DateFormat('dd/MM/y').format(event.startDate),
        endDate: DateFormat('dd/MM/y').format(event.endDate),
      );

      final docLink = await state.placeOrderRepository.getInvoiceDocLink(
        brandId: state.profile.brand.id,
        date: DateFormat('y/MM/dd').format(
          state.selectedDateTime,
        ),
        isMonth: event.isMonth,
      );

      emit(state.copyWith(
        isLoading: false,
        broughtDeals: res,
        hasMoreDocs: res.length == APIConstants.limit,
        invoiceDocLink: docLink,
      ));

      isFetching = false;
    });

    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
