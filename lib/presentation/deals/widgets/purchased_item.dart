import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/constants/asset_constants.dart';

import '../../../domain/constants/string_constants.dart';

class BalanceItem extends StatelessWidget {
  const BalanceItem({
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
        padding: EdgeInsets.only(right: 2.w),
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
                          text: 'Andrew',
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
                        text: '10 Hot Coffee Beverage',
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
                      text: '${DealsConstants.balance}: 4/5 coupon left',
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
