import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

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
  PayoutListingBloc(PayoutListingState initState) : super(initState) {
    on<_Init>((event, emit) {
      add(const PayoutListingEvent.onLoad());
    });
    on<_OnLoad>((event, emit) {
      add(PayoutListingEvent.fetchBroughtDealsByDayOrMonth(
        isMonth: false,
        startDate: state.selectedDateTime,
        endDate: state.selectedDateTime,
      ));
    });

    on<_FetchBroughtDealsByDayOrMonth>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        selectedDateTime: event.startDate,
        isSelectedMonth: event.isMonth,
      ));
      final res = await state.placeOrderRepository.getBroughtDeals(
        brandId: state.profile.brand.id,
        startDate: DateFormat('dd/MM/y').format(event.startDate),
        endDate: DateFormat('dd/MM/y').format(event.endDate),
      );

      final docLink = await state.placeOrderRepository.getInvoiceDocLink(
          brandId: state.profile.brand.id,
          date: DateFormat('y/MM/dd').format(event.startDate),
          isMonth: event.isMonth);

      emit(state.copyWith(
        isLoading: false,
        broughtDeals: res,
        invoiceDocLink: docLink,
      ));
    });

    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
