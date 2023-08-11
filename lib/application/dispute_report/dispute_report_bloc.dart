// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import '../../domain/shop_merchant/shop_merchant_repository.dart';
import '../../domain/upload/upload_repository.dart';
import '../../infrastructure/shop_merchant_repository/i_shop_merchant_repository.dart';
import '../../infrastructure/upload/i_upload_repository.dart';

import '../../domain/core/configs/app_config.dart';
import '../../infrastructure/dtos/brand/user/brand_user_dto.dart';

part 'dispute_report_event.dart';
part 'dispute_report_state.dart';
part 'dispute_report_bloc.freezed.dart';

class DisputeReportBloc extends Bloc<DisputeReportEvent, DisputeReportState> {
  DisputeReportBloc(DisputeReportState initState) : super(initState) {
    on<_Init>((event, emit) {});
    on<_OnLoad>((event, emit) {});

    on<_AttachFile>((event, emit) async {
      final Either<String, dynamic> res =
          await state.uploadFileRepository.selectImageFile();
      res.fold((l) {
        return emit(state.copyWith(
          isFailed: true,
          showMessage: l,
        ));
      }, (r) async {
        add(DisputeReportEvent.emitFromAnywhere(
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
      final res = await state.shopMerchantRepository.disputeReport(
        merchantMessage: merchantMessage,
        sendImage: state.attachImageFile,
      );

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
