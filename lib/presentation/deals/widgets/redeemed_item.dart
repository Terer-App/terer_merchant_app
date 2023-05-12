import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../../domain/constants/string_constants.dart';

import '../../../domain/constants/asset_constants.dart';
import '../../../infrastructure/dtos/merchant_deal_dto/merchant_deal_dto.dart';

class RedeemedOrVerifyItem extends StatelessWidget {
  final MerchantDealDto dealDto;
  const RedeemedOrVerifyItem({
    Key? key,
    required this.dealDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle commonTextStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.background,
              fontSize: 10.sp,
              overflow: TextOverflow.ellipsis,
            );
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(40),
      ),
      height: 18.h,
      padding: EdgeInsets.only(
        right: 2.w,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              dealDto.imageUrl,
              width: 40.w,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: dealDto.isVerified
                                ? dealDto.customerName
                                : dealDto.customerName.split(' ')[0],
                            style: commonTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: dealDto.dealTitle,
                          style: commonTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // ,
                      ),
                      SizedBox(
                        height: 0.2.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: commonTextStyle.copyWith(),
                                  text:
                                      'Date:  ${dealDto.buyingDate}\nTime: ${dealDto.buyingTime}')),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                                style: commonTextStyle.copyWith(),
                                text: 'Quantity: ${dealDto.noOfredeemDeals}'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 1.h,
                    right: 1.w,
                    child: CircleAvatar(
                      radius: 4.w,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: SvgPicture.asset(
                        dealDto.isVerified
                            ? AssetConstants.tickSvg
                            : AssetConstants.exMarkSvg,
                      ),
                    ),
                  ),
                  if (!dealDto.isVerified)
                    Positioned(
                      right: 1.w,
                      child: Text(
                        DealsConstants.notVerified,
                        style: commonTextStyle.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontStyle: FontStyle.italic,
                            fontSize: 12.sp),
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
