// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(ProfileState initState) : super(initState) {
    on<_Init>((event, emit) {
      add(const ProfileEvent.onLoad());
    });
    on<_OnLoad>((event, emit) {});
    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
