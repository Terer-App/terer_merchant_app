import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/constants/string_constants.dart';
import '../../../infrastructure/dtos/merchant_deal_dto/merchant_deal_dto.dart';

class BalanceItem extends StatelessWidget {
  final MerchantDealDto dealDto;
  const BalanceItem({
    Key? key,
    required this.dealDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(40),
        ),
        height: 18.h,
        padding: EdgeInsets.only(right: 2.w),
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
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 1.5.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: dealDto.customerName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                              ),
                        )),
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: dealDto.dealTitle,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                      text: '${DealsConstants.balance}: ${dealDto.balanceDeals}/${dealDto.totalDeals} coupon left',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                    )),
                     RichText(
                        text: TextSpan(
                      text: '${DealsConstants.expireAT}: ${dealDto.dealExprireAt}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
