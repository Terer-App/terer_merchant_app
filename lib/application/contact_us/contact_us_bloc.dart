// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';
part 'contact_us_bloc.freezed.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  ContactUsBloc(ContactUsState initState) : super(initState) {
    on<_Init>((event, emit) {
      add(const ContactUsEvent.onLoad());
    });
    on<_OnLoad>((event, emit) {});
    on<_EmitFromAnywhere>((event, emit) {
      emit(event.state);
    });
  }
}
