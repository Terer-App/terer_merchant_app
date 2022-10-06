import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/constants/asset_constants.dart';

class RedeemedItem extends StatelessWidget {
  const RedeemedItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle commonTextStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.background,
              fontSize: 10.sp,
              overflow: TextOverflow.ellipsis,
            );
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
              // child: CachedNetworkImage(
              //   imageUrl: deal.imageUrl!,
              //   width: 30.w,
              //   height: double.infinity,
              //   fit: BoxFit.cover,
              // ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Andrew',
                      style: commonTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '10 Hot Coffee Beverage',
                      style: commonTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 0.2.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Date: ',
                              style: commonTextStyle.copyWith(),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              DateFormat('d MMM y').format(DateTime.now()),
                              style: commonTextStyle.copyWith(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Time: ',
                              style: commonTextStyle.copyWith(),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              DateFormat('HH:MM').format(DateTime.now()),
                              style: commonTextStyle.copyWith(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Quantity: ',
                              style: commonTextStyle.copyWith(),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              '2',
                              style: commonTextStyle.copyWith(),
                            ),
                          ],
                        )
                      ],
                    )
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
