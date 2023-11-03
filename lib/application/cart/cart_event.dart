part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.init() = _Init;
  const factory CartEvent.emitFromAnywhere({required CartState state}) =
      _EmitFromAnywhere;
        const factory CartEvent.toggleKeyboard() = _ToggleKeyboard;
        const factory CartEvent.onPlaceOrder() = _OnPlaceOrder;
  const factory CartEvent.updateCountryCode(
      {required Map<String, dynamic> selectedCountry}) = _UpdateCountryCode;

      
      }
      