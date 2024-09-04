// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../infrastructure/dtos/brand/user/brand_user_dto.dart';
import '../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(ProfileState initState) : super(initState) {
    on<_Init>((event, emit) {
      add(const ProfileEvent.onLoad());
    });
    on<_OnLoad>((event, emit) {
      state.firstNameController.text = '${state.profile!.firstName} ${state.profile!.lastName}';
      state.emailController.text = state.profile!.email;
      state.brandNameController.text = state.profile!.brand.name;
      emit(
        state.copyWith(isLoading: false),
      );
    });

    on<_OnDeleteAccount>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await state.shopMerchantRepository.deleteAccount();

      res.fold((l) {
        emit(state.copyWith(
          isFailed: true,
          isLoading: false,
          showMessage: l,
        ));
      }, (r) {
        emit(
          state.copyWith(
            isAccountDeleted: true,
          ),
        );
      });
    });

    // emit from anywhere
    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
