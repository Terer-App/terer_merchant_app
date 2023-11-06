import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/constants/country_info.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/place_order/place_order_repository.dart';
import '../../infrastructure/dtos/place_order/outlet_product/outlet_product_dto.dart';
import '../../infrastructure/place_order_repository/i_place_order_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(CartState initState) : super(initState) {
    on<CartEvent>((event, emit) {
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

    on<_OnPlaceOrder>((event, emit) async {
      if (state.phoneNumberController.text.isEmpty) {
        emit(state.copyWith(
          isFailed: false,
          isLoading: false,
          errorPhoneNumber: ErrorConstants.requiredError
        ));
      } else {
        emit(state.copyWith(isLoading: true));
         List<Map<String, dynamic>> selectedProducts = state.addedProducts
      .map((product) => {
            'id': product.variantId,
            'qty': product.quantity,
          })
      .toList();
        final res = await state.placeOrderRepository.placeOrder(addedProducts: selectedProducts,
        countryCode:  state.selectedCountry['dial_code'].toString(),
        phoneNumber:state.phoneNumberController.text);

        res.fold((l) {
          emit(state.copyWith(
            isFailed: true,
            isLoading: false,
            showMessage: l,
          ));
        }, (r) {
          emit(
            state.copyWith(isSuccess: true, showMessage: r,),
          );
        });
      }
    });
  }
}
