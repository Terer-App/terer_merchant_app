import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/constants/country_info.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';
import '../place_order/place_order_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(CartState initState) : super(initState) {
    on<CartEvent>((event, emit) {
      // TODO: implement event handler
    });
        on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
       on<_UpdateCountryCode>((event, emit) {
      emit(state.copyWith(
          noUse: !state.noUse, selectedCountry: event.selectedCountry));
    });
     on<_ToggleKeyboard>((event, emit) {
      emit(state.copyWith(showKeyboard: !state.showKeyboard));
    });
  }
}
