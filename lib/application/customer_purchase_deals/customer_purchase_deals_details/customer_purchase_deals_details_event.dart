part of 'customer_purchase_deals_details_bloc.dart';

@freezed
class CustomerPurchaseDealsDetailsEvent with _$CustomerPurchaseDealsDetailsEvent {
  const factory CustomerPurchaseDealsDetailsEvent.init() = _Init;
  const factory CustomerPurchaseDealsDetailsEvent.onLoad() = _OnLoad;
  const factory CustomerPurchaseDealsDetailsEvent.loadMore() = _LoadMore;
  const factory CustomerPurchaseDealsDetailsEvent.emitFromAnywhere({required CustomerPurchaseDealsDetailsState state}) =
      _EmitFromAnywhere;
}