// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initState) : super(initState) {
    on<_Init>((event, emit) {
      add(const LoginEvent.onLoad());
    });
    on<_OnLoad>((event, emit) {});
    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
