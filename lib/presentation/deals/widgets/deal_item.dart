import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

import '../../../domain/constants/asset_constants.dart';

import '../../core/custom_button.dart';

class DealItem extends StatelessWidget {
  const DealItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(40),
        ),
        height: 16.h,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                AssetConstants.coffeeImage,
                width: 40.w,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              // child: CachedNetworkImage(
              //   imageUrl: deal.imageUrl!,
              //   width: 30.w,
              //   height: double.infinity,
              //   fit: BoxFit.cover,
              // ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '10 Hot Coffee Beverage',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'On going',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontSize: 8.sp,
                                color: Theme.of(context).colorScheme.background,
                              ),
                        ),
                        Text(
                          'RM 80',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.background,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                        height: 4.h,
                        width: 35.w,
                        child: PrimaryButton(
                          btnText:
                              DateFormat('d MMM yyyy').format(DateTime.now()),
                          btnTextColor: Theme.of(context).colorScheme.secondary,
                          textFontSize: 10.sp,
                          onPressedBtn: 1 == 0 ? () async {} : null,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      if (1 == 0)
        GestureDetector(
          onTap: () {
            // navigator<NavigationService>()
            //     .navigateTo(CoreRoute.redeemDetailsRoute, queryParams: {
            //   'dealId': deal.dealId,
            //   'orderId': deal.orderId,
            // });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background.withOpacity(0.9),
              borderRadius: BorderRadius.circular(40),
            ),
            height: 16.h,
            width: double.infinity,
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: -math.pi / 25,
              child: 1 == 0
                  ? Text(
                      'Expired',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      'Fully Redeemed',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        ),
    ]);
  }
}
