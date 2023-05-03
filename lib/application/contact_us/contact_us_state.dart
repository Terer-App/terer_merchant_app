part of 'contact_us_bloc.dart';

@freezed
class ContactUsState with _$ContactUsState {
  const factory ContactUsState({
    required bool isLoading,
  }) = _ContactUsState;

  factory ContactUsState.initial() {
    return const ContactUsState(
      isLoading: false,
    );
  }
}
