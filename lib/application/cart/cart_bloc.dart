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
import 'package:email_validator/email_validator.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(CartState initState) : super(initState) {
    on<CartEvent>((event, emit) {});
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
    on<_UpdatePhoneNumber>((event, emit) {
      emit(state.copyWith(
          selectedCountry: event.selectedCountry,
          phoneNumberController:
              TextEditingController(text: event.phoneNumber)));
    });
    on<_OnUserExistsByNumber>((event, emit) async {
      if (state.phoneNumberController.text.isEmpty) {
        emit(state.copyWith(
            isFailed: false,
            isLoading: false,
            errorPhoneNumber: ErrorConstants.requiredError));
      } else {
        emit(state.copyWith(isLoading: true));
        final res = await state.placeOrderRepository.checkUserByNumber(
            countryCode: state.selectedCountry['dial_code'].toString(),
            phoneNumber: state.phoneNumberController.text);
        res.fold((l) {
          emit(state.copyWith(
            isFailed: true,
            isLoading: false,
            showMessage: l,
          ));
        }, (r) {
          if (r) {
            add(const CartEvent.onPlaceOrder(isNewUser: false));
          } else {
            emit(state.copyWith(showBottomSheet: true));
          }
        });
      }
    });

    on<_OnPlaceOrder>((event, emit) async {
      if (event.isNewUser && state.errorEmailId.isNotEmpty ||
          event.isNewUser && state.nameController.text.isEmpty) {
        emit(state.copyWith(
            isFailed: false,
            isLoading: false,
            errorEmailId: state.emailController.text.isEmpty
                ? ErrorConstants.requiredError
                : state.errorEmailId.isEmpty
                    ? ''
                    : state.errorEmailId,
            errorName: state.nameController.text.isEmpty
                ? ErrorConstants.requiredError
                : ''));
      } else if (!event.isNewUser && state.phoneNumberController.text.isEmpty) {
        emit(state.copyWith(
            isFailed: false,
            isLoading: false,
            errorPhoneNumber: ErrorConstants.requiredError));
      } else {
        emit(state.copyWith(isLoading: true));
        List<Map<String, dynamic>> selectedProducts = state.addedProducts
            .map((product) => {
          
                  'id': product.variantId,
                  'qty': product.quantity,
                })
            .toList();
        final res = await state.placeOrderRepository.placeOrder(
            addedProducts: selectedProducts,
            countryCode: state.selectedCountry['dial_code'].toString(),
            phoneNumber: state.phoneNumberController.text,
            emailId: state.emailController.text,
            name: state.nameController.text,
            isNewUser: event.isNewUser);

        res.fold((l) {
          emit(state.copyWith(
            isFailed: true,
            isLoading: false,
            showMessage: l,
          ));
        }, (r) {
          emit(
            state.copyWith(
              isSuccess: true,
              showMessage: r,
            ),
          );
        });
      }
    });

    on<_OnChangeName>((event, emit) {
      final firstName = state.nameController.text.trim();
      emit(state.copyWith(
        errorName: firstName.isEmpty ? ErrorConstants.requiredError : '',
        isFailed: firstName.isEmpty,
        isSuccess: false,
      ));
    });

    on<_OnChangeEmailAddress>((event, emit) async {
      final emailAddress = state.emailController.text.trim();
      String errorEmailAddress = '';
      if (EmailValidator.validate(emailAddress)) {
        final res = await state.placeOrderRepository
            .checkUserByEmail(email: emailAddress);
        res.fold((l) {
          emit(state.copyWith(
            isFailed: true,
            isLoading: false,
            showMessage: l,
          ));
        }, (r) {
          if (r) {
            add(CartEvent.emitFromAnywhere(
                state: state.copyWith(
                    isFailed: false,
                    isLoading: false,
                    noUse: !state.noUse,
                    errorEmailId: 'Email already Exists')));
          } else {
            emit(state.copyWith(
                isFailed: false, isLoading: false, errorEmailId: ''));
          }
        });
      } else {
        errorEmailAddress = 'Invalid Email';
      }
      emit(state.copyWith(
        errorEmailId: errorEmailAddress,
        isSuccess: false,
      ));
    });
  }
}
