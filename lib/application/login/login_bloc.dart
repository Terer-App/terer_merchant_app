// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/auth/auth_repository.dart';
import '../../domain/services/storage_service/auth_service.dart';
import '../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../infrastructure/auth/i_auth_repository.dart';
import '../../infrastructure/dtos/brand/user/brand_user_dto.dart';
import '../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initState) : super(initState) {
    on<_Init>((event, emit) {
      add(const LoginEvent.onLoad());
    });
    on<_OnLoad>((event, emit) {});

    on<_OnLogin>((event, emit) async {
      final userName = state.userNameController.text.trim();
      final password = state.passwordController.text.trim();

      if (userName.isEmpty || password.isEmpty) {
        if (userName.isEmpty) state.userNameController.clear();
        if (password.isEmpty) state.passwordController.clear();

        emit(state.copyWith(validateForm: true));

        Future.delayed(const Duration(milliseconds: 100), () {
          state.formKey.currentState!.validate();
        });
        return;
      }

      emit(
        state.copyWith(
          isLoading: true,
        ),
      );

      final res = await state.authRepository
          .loginAsMerchant(password: password, userName: userName);

      res.fold((l) {
        emit(state.copyWith(
          isFailed: true,
          isLoading: false,
          showMessage: l,
        ));
      }, (r) async {
        await AuthTokenService.setIsLogin(isAuthorized: true);

        await AuthTokenService.setMerchantToken(merchantToken: r);

        final merchantProfile =
            await state.shopMerchantRepository.merchantProfile(
          token: r,
        );

        if (merchantProfile == null) {
          add(LoginEvent.emitFromAnywhere(
              state: state.copyWith(
            isFailed: true,
            isLoading: false,
            showMessage: 'Profile not found!',
          )));
        } else {
            FirebaseMessaging.instance.getToken().then((fcmToken) async {
            if (fcmToken != null) {
              print('////////fcm//////////');
              print(fcmToken);
            }
          });
          add(LoginEvent.emitFromAnywhere(
              state: state.copyWith(
            isSuccess: true,
            profile: merchantProfile,
          )));
        }
      });
    });
    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
