// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'scan_event.dart';
part 'scan_state.dart';
part 'scan_bloc.freezed.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc(ScanState initState) : super(initState) {
    on<ScanEvent>((event, emit) {
      //
    });
  }
}
