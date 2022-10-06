// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';
part 'home_screen_bloc.freezed.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc(HomeScreenState initialState) : super(initialState) {
    on<HomeScreenEvent>((event, emit) {
      emit(state.resetState);
    });
    on<_ChangePage>((event, emit) async {
      emit(state.copyWith(currentPage: event.currentPage));
    });

    on<_EmitFromAnyWhere>((event, emit) {
      emit(event.state);
    });
  }
}
