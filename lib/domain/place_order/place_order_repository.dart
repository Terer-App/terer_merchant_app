import 'package:dartz/dartz.dart';

import '../../infrastructure/dtos/brought_deal_dto/brought_deal_dto.dart';
import '../../infrastructure/dtos/customer_order_with_history_dto/customer_order_with_history_dto.dart';
import '../../infrastructure/dtos/place_order/outlet_product/outlet_product_dto.dart';
import '../constants/api_constants.dart';

abstract class PlaceOrderRepository {
  Future<List<OutletProductDto>> getOutletProducts({required String outletId});
  Future<String> getInvoiceDocLink({
    required String brandId,
    required String date,
    bool isMonth = false,
  });

  Future<Either<String, String>> placeOrder(
      {required List<Map<String, dynamic>> addedProducts,
      required String countryCode,
      required String phoneNumber,
      required bool isNewUser,
      String? emailId,
      String? name});
  Future<Either<String, bool>> checkUserByEmail({required String email});

  Future<Either<String, bool>> checkUserByNumber(
      {required String countryCode, required String phoneNumber});

  Future<List<BroughtDealDto>> getBroughtDealsByInvoiceDate({
    required String brandId,
    required String startDate,
    required String endDate,
    int skip = 0,
    int limit = APIConstants.limit,
  });

  Future<Map<String, dynamic>> getCustomersOrders({
    required String startDate,
    required String endDate,
    String customerName = '',
    bool isTodaysCount = false,
    int skip = 0,
    int limit = 10,
  });

  Future<List<CustomerOrderWithHistoryDto>>
      getCustomerOrdersWithRedemptionHistory({
    required String customerId,
    required int skip,
    int limit = APIConstants.limit,
  });

  Future<List<BroughtDealDto>> getLatestDeals({
    required String startTime,
  });

  Future<Either<String, bool>> verifyPurchaseDeal({required String dealId});
}
