import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/constants/asset_constants.dart';

import '../../core/custom_button.dart';

class PurchasedItem extends StatelessWidget {
  const PurchasedItem({
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
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
                      height: 0.2.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date Of Purchase',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontSize: 9.sp,
                                color: Theme.of(context).colorScheme.background,
                              ),
                        ),
                        Text(
                          '15th Oct 2022',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontSize: 9.sp,
                                color: Theme.of(context).colorScheme.background,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Expiry: ',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontSize: 9.sp,
                                color: Theme.of(context).colorScheme.background,
                              ),
                        ),
                        SizedBox(
                            height: 3.h,
                            width: 28.w,
                            child: SecondaryButton(
                              btnText: DateFormat('d MMM yyyy')
                                  .format(DateTime.now()),
                              bgColor: Theme.of(context).colorScheme.primary,
                              btnTextColor:
                                  Theme.of(context).colorScheme.secondary,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                              btnBorderRadius: 2.w,
                              onPressedBtn: 1 == 0 ? () async {} : null,
                            )),
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
