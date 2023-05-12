import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/constants/string_constants.dart';
import '../../../infrastructure/dtos/merchant_deal_dto/merchant_deal_dto.dart';

class TodaysDealItem extends StatelessWidget {
  final MerchantDealDto dealDto;
  final bool isShowIsVerified;
  const TodaysDealItem({
    Key? key,
    required this.dealDto,
    this.isShowIsVerified = false,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: dealDto.customerName,
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
                  RichText(
                      text: TextSpan(
                    text: '${DealsConstants.balance}: ${dealDto.balanceDeals}/${dealDto.totalDeals} coupon left',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                  )),
                  SizedBox(
                    height: 0.2.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              style: commonTextStyle.copyWith(),
                              text: 'Date:  ${dealDto.buyingDate}')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                              style: commonTextStyle.copyWith(),
                              text: 'Time:  ${dealDto.buyingTime}',
                            ),
                          ),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                              style: commonTextStyle.copyWith(),
                              text:
                                  'Qty: ${dealDto.noOfredeemDeals.toString()}',
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                    ],
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
