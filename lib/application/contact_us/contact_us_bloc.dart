// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import '../../domain/core/configs/app_config.dart';
import '../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../domain/upload/upload_repository.dart';
import '../../infrastructure/dtos/brand/user/brand_user_dto.dart';
import '../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';
import '../../infrastructure/upload/i_upload_repository.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';
part 'contact_us_bloc.freezed.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  ContactUsBloc(ContactUsState initState) : super(initState) {
    on<_Init>((event, emit) {
      add(const ContactUsEvent.onLoad());
    });
    on<_OnLoad>((event, emit) {
      state.nameController.text = state.profile!.firstName;
      state.emailController.text = state.profile!.email;
      emit(state.copyWith(isLoading: false));
    });

    on<_AttachFile>((event, emit) async {
      final Either<String, dynamic> res =
          await state.uploadFileRepository.selectImageFile();
      res.fold((l) {
        return emit(state.copyWith(
          isFailed: true,
          showMessage: l,
        ));
      }, (r) async {
        add(ContactUsEvent.emitFromAnywhere(
            state: state.copyWith(
                attachImagePath: r.path,
                attachImageFile: await http.MultipartFile.fromPath(
                  'sendimage',
                  r.path,
                ))));
      });
    });

    on<_OnSubmit>((event, emit) async {
      final merchantMessage = state.messageController.text.trim();

      if (merchantMessage.isEmpty) {
        state.messageController.clear();
        emit(state.copyWith(validateForm: true));

        Future.delayed(const Duration(milliseconds: 100), () {
          state.formKey.currentState!.validate();
        });

        return;
      }
      emit(state.copyWith(isLoading: true));
      final res = await state.shopMerchantRepository.contactUs(
          merchantMessage: merchantMessage,
          email: state.profile!.email,
          name: state.profile!.firstName ,
          sendImage: state.attachImageFile);

      res.fold((l) {
        emit(state.copyWith(isFailed: true, isLoading: false, showMessage: l));
      }, (r) {
        emit(
          state.copyWith(
            isSuccess: true,
            showMessage: r,
            isLoading: false,
          ),
        );
      });
    });

    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
