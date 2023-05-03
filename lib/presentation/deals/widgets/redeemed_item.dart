import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:terer_merchant/domain/constants/string_constants.dart';

import '../../../domain/constants/asset_constants.dart';

class RedeemedOrVerifyItem extends StatelessWidget {
  const RedeemedOrVerifyItem({
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
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(40),
      ),
      height: 16.h,
      padding: EdgeInsets.only(
        right: 2.w,
      ),
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
                            text: 'Andrew',
                            style: commonTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text:
                              '10 Hot Coffee Beverage is good food u must try at hine',
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
                                      'Date:  ${DateFormat('d MMM y').format(DateTime.now())}\nTime:  ${DateFormat('HH:MM').format(DateTime.now())}')),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                                style: commonTextStyle.copyWith(),
                                text: 'Quantity: 2'),
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
                        1 == 1
                            ? AssetConstants.exMarkSvg
                            : AssetConstants.tickSvg,
                      ),
                    ),
                  ),
                  if (1 == 1)
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
