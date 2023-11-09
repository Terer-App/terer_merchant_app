import 'package:dartz/dartz.dart';

import '../../infrastructure/dtos/place_order/outlet_product/outlet_product_dto.dart';

abstract class PlaceOrderRepository {
  Future<List<OutletProductDto>> getOutletProducts({required String outletId});
  Future<Either<String, String>> placeOrder(
      {required List<Map<String, dynamic>> addedProducts,
      required String countryCode,
      required String phoneNumber,
      required bool isNewUser,
      String? emailId,
      String? name});
  Future<Either<String, bool>> checkUserByEmail({required String email});
    Future<Either<String, bool>> checkUserByNumber(
      {required String countryCode,
      required String phoneNumber});
}
