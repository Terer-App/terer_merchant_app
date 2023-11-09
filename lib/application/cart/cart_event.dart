part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.init() = _Init;
  const factory CartEvent.emitFromAnywhere({required CartState state}) =
      _EmitFromAnywhere;
  const factory CartEvent.toggleKeyboard() = _ToggleKeyboard;
  const factory CartEvent.onPlaceOrder({required bool isNewUser}) = _OnPlaceOrder;
  const factory CartEvent.updateCountryCode(
      {required Map<String, dynamic> selectedCountry}) = _UpdateCountryCode;

  const factory CartEvent.onUserExistsByNumber() = _OnUserExistsByNumber;
  const factory CartEvent.onUserExistsByEmail() = _OnUserExistsByEmail;

   const factory CartEvent.onChangeEmailAddress() = _OnChangeEmailAddress;
  const factory CartEvent.onChangeName() = _OnChangeName;
  const factory CartEvent.updatePhoneNumber(
      {required Map<String, dynamic> selectedCountry, required String phoneNumber}) = _UpdatePhoneNumber;
}

