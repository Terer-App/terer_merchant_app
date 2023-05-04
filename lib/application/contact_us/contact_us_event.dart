part of 'contact_us_bloc.dart';

@freezed
class ContactUsEvent with _$ContactUsEvent {
  const factory ContactUsEvent.init() = _Init;
  const factory ContactUsEvent.onLoad() = _OnLoad;
  const factory ContactUsEvent.attachFile() = _AttachFile;
  const factory ContactUsEvent.onSubmit() = _OnSubmit;

  const factory ContactUsEvent.emitFromAnywhere(
      {required ContactUsState state}) = _EmitFromAnywhere;
}
