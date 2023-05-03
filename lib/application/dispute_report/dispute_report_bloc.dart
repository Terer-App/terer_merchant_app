// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dispute_report_event.dart';
part 'dispute_report_state.dart';
part 'dispute_report_bloc.freezed.dart';

class DisputeReportBloc extends Bloc<DisputeReportEvent, DisputeReportState> {
  DisputeReportBloc(DisputeReportState initState) : super(initState) {
    on<DisputeReportEvent>((event, emit) {});
  }
}
