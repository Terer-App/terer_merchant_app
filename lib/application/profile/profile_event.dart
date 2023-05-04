part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.init() = _Init;
  const factory ProfileEvent.onLoad() = _OnLoad;
  const factory ProfileEvent.onDeleteAccount() = _OnDeleteAccount;

  const factory ProfileEvent.emitFromAnywhere({required ProfileState state}) =
      _EmitFromAnywhere;
}
