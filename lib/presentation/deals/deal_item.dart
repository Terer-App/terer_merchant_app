import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../core/custom_button.dart';

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
            const ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
              child: Icon(Icons.gif_box),
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
                      'Merchant Name',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                    Text(
                      'Deal Name',
                      // deal.dealTitle,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.w600,
                            fontSize: 8.sp,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                    Text(
                      'Expired by ${DateFormat.yMMMd().format(DateTime.now())}',

                      // 'Expired by ${DateFormat.yMMMd().format(deal.expireAt)}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 9.sp,
                            color: Theme.of(context).colorScheme.background,
                          ),
                    ),
                    Text(
                      '12',
                      // '${deal.noOfDeals - deal.noOfRedeemDeals}/${deal.noOfDeals} ${DealConstants.tererCouponsLeft}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Center(
                      child: SizedBox(
                          height: 3.5.h,
                          width: 30.w,
                          child: PrimaryButton(
                            btnText: AppConstants.redeem.toUpperCase(),
                            btnTextColor: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            textFontSize: 12.sp,
                            onPressedBtn: 1 == 0
                                ? () async {
                                    // await navigator<NavigationService>()
                                    //     .navigateTo(
                                    //         CoreRoute.redeemDetailsRoute,
                                    //         queryParams: {
                                    //       'dealId': deal.dealId,
                                    //       'orderId': deal.orderId,
                                    //     });
                                    // if (reloadList != null) reloadList!();
                                  }
                                : null,
                          )),
                    )
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
