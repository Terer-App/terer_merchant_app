// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/constants/country_info.dart';

part 'country_picker_event.dart';
part 'country_picker_state.dart';
part 'country_picker_bloc.freezed.dart';

class CountryPickerBloc extends Bloc<CountryPickerEvent, CountryPickerState> {
  CountryPickerBloc(CountryPickerState initialState) : super(initialState) {
    on<_SearchCountry>(
      (event, emit) {
        final List<Map<String, dynamic>> list = [];
        if (event.value.isEmpty) {
          emit(
            state.copyWith(
              tempCountryList: state.countryList.where((el) => true).toList(),
            ),
          );
        } else {
          list.clear();
          list.addAll(
            state.countryList.sublist(1).where(
                  (el) =>
                      el['name']
                          .toLowerCase()
                          .toString()
                          .startsWith(event.value.toLowerCase()) ||
                      el['dial_code']
                              .toLowerCase()
                              .toString()
                              .replaceAll('+', '') ==
                          event.value.toLowerCase(),
                ),
          );

          emit(state.copyWith(
            tempCountryList: list,
          ));
        }
      },
    );
  }
}
