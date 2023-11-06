part of 'place_order_bloc.dart';

@freezed
class PlaceOrderEvent with _$PlaceOrderEvent {
  const factory PlaceOrderEvent.init() = _Init;
  const factory PlaceOrderEvent.emitFromAnywhere({required PlaceOrderState state}) =
      _EmitFromAnywhere;
        const factory PlaceOrderEvent.onSwitchOutlet() = _OnSwitchOutlet;
  const factory PlaceOrderEvent.onIncrementDealQuantity({required String productId}) = _OnIncrementDealQuantity;
  const factory PlaceOrderEvent.onDecrementDealQuantity({required String productId}) = _OnDecrementDealQuantity;
const factory PlaceOrderEvent.onSearchDeals(String query) = _OnSearchDeals;
  const factory PlaceOrderEvent.onLoadOutletProducts({required String outletId}) = _OnLoadOutletProducts;

}
