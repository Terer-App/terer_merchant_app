import 'dart:convert';

import 'package:terer_merchant/domain/constants/api_constants.dart';
import 'package:terer_merchant/domain/services/storage_service/auth_service.dart';
import 'package:terer_merchant/domain/shop_merchant/shop_merchant_repository.dart';
import 'package:terer_merchant/infrastructure/dtos/merchant_dto/merchant_dto.dart';

import '../../domain/services/network_service/rest_service.dart';

class IShopMerchantRepository extends ShopMerchantRepository {
  final String serverUrl;

  IShopMerchantRepository({required this.serverUrl});

  @override
  Future<MerchantDto?> merchantProfile() async {
    MerchantDto? merchantProfile;
    final url = serverUrl + APIConstants.merchantProfile;
    try {
      final token = await AuthTokenService.getMerchantToken();
      final res = await RESTService.performGETRequest(
        httpUrl: url,
        isAuth: true,
        token: token,
      );

      final response = json.decode(res.body);

      if (response['status'] == 1) {
        final profileData = response['shopInfo'];

        merchantProfile = MerchantDto.fromJson(profileData);

        return merchantProfile;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
