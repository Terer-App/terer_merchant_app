import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/core/configs/app_config.dart';
import '../../domain/place_order/place_order_repository.dart';
import '../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../infrastructure/dtos/outlet/outlet_dto.dart';
import '../../infrastructure/dtos/place_order/outlet_product/outlet_product_dto.dart';
import '../../infrastructure/dtos/place_order/outlet_product/product_variant/product_variant_dto.dart';
import '../../infrastructure/dtos/place_order/price/price_dto.dart';
import '../../infrastructure/place_order_repository/i_place_order_repository.dart';
import '../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';

part 'place_order_event.dart';
part 'place_order_state.dart';
part 'place_order_bloc.freezed.dart';

class PlaceOrderBloc extends Bloc<PlaceOrderEvent, PlaceOrderState> {
  PlaceOrderBloc(PlaceOrderState initState) : super(initState) {
    on<_Init>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await state.shopMerchantRepository.getAllotedBrandOutlets();

      if (res.length == 1) {
        emit(
          state.copyWith(
            isLoading: false,
            outlets: res,
            selectedOutlet: res[0],
          ),
        );
        await Future.delayed(const Duration(milliseconds: 150));
        add(PlaceOrderEvent.onLoadOutletProducts(
            outletId: state.selectedOutlet!.code!));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            outlets: res,
            showOutletBottomSheet: true,
          ),
        );
      }
    });

    on<_OnLoadOutletProducts>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await state.placeOrderRepository
          .getOutletProducts(outletId: event.outletId);

      final updatedRes = res.map((outletProduct) {
        final updatedVariants = outletProduct.variants
            .asMap()
            .map((index, variant) {
              return MapEntry(
                index,
                variant.copyWith(
                  redemptionDuration: outletProduct.redeemDuration == null
                      ? '-'
                      : '${outletProduct.redeemDuration['value']}'
                          .toUpperCase(),
                  isSelected: index == 0 ? true : variant.isSelected,
                ),
              );
            })
            .values
            .toList();
        return outletProduct.copyWith(variants: updatedVariants);
      }).toList();

      if (res.length == 1) {
        emit(
          state.copyWith(
              isLoading: false,
              outletProducts: updatedRes,
              searchedOutletProducts: updatedRes),
        );
      } else {
        emit(
          state.copyWith(
              isLoading: false,
              outletProducts: updatedRes,
              searchedOutletProducts: updatedRes),
        );
      }
    });

    on<_OnIncrementDealQuantity>((event, emit) {
      final updatedDeals = state.outletProducts.map((deal) {
        if (deal.id == event.productId) {
          return deal.copyWith(quantity: deal.quantity + 1);
        } else {
          return deal;
        }
      }).toList();

      List<OutletProductDto> selectedDeals =
          updatedDeals.where((deal) => deal.quantity > 0).toList();

      emit(
        state.copyWith(
            outletProducts: updatedDeals,
            searchedOutletProducts: updatedDeals,
            selectedOutletProducts: selectedDeals,
            noUse: !state.noUse),
      );
    });

    on<_OnDecrementDealQuantity>((event, emit) {
      final updatedDeals = state.outletProducts.map((deal) {
        if (deal.id == event.productId) {
          if (deal.quantity > 0) {
            return deal.copyWith(quantity: deal.quantity - 1);
          }
        }
        return deal;
      }).toList();
      List<OutletProductDto> selectedDeals =
          updatedDeals.where((deal) => deal.quantity > 0).toList();

      emit(
        state.copyWith(
            outletProducts: updatedDeals,
            searchedOutletProducts: updatedDeals,
            selectedOutletProducts: selectedDeals,
            noUse: !state.noUse),
      );
    });

    //on search
    on<_OnSearchDeals>((event, emit) {
      if (state.outletProducts.isNotEmpty) {
        final currentProducts = state.outletProducts;
        final query = event.query.toLowerCase();

        final product = currentProducts.where((product) {
          final dealName = product.title.toLowerCase();
          return dealName.contains(query);
        }).toList();

        emit(state.copyWith(
          searchedOutletProducts: product,
        ));
      }
    });
    // emit from anywhere
    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });

    on<_OnUpdateSelectedVariant>((event, emit) async {
      final updatedRes = state.searchedOutletProducts.map((outletProduct) {
        if (state.searchedOutletProducts.indexOf(outletProduct) ==
            event.index) {
    
          return outletProduct.copyWith(
            variants: event.variants,
            variantId:
                event.variants.firstWhere((element) => element.isSelected).id,
          );
        }
        return outletProduct;
      }).toList();
      List<OutletProductDto> selectedDeals =
          updatedRes.where((deal) => deal.quantity > 0).toList();
      emit(
        state.copyWith(
            isLoading: false,
            outletProducts: updatedRes,
            selectedOutletProducts: selectedDeals,
            searchedOutletProducts: updatedRes),
      );
    });
  }
}
