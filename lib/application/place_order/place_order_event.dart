part of 'place_order_bloc.dart';

@freezed
class PlaceOrderEvent with _$PlaceOrderEvent {
  const factory PlaceOrderEvent.init() = _Init;
  const factory PlaceOrderEvent.emitFromAnywhere({required PlaceOrderState state}) =
      _EmitFromAnywhere;
        const factory PlaceOrderEvent.onSwitchOutlet() = _OnSwitchOutlet;
  const factory PlaceOrderEvent.onIncrementDealQuantity({required int productId}) = _OnIncrementDealQuantity;
  const factory PlaceOrderEvent.onDecrementDealQuantity({required int productId}) = _OnDecrementDealQuantity;

}
