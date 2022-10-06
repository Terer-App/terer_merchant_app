import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:terer_merchant/presentation/deals/widgets/redeemed_item.dart';

import '../../../domain/constants/asset_constants.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/services/navigation_service/navigation_service.dart';
import '../../core/custom_button.dart';

class RedeemedReportsScreen extends StatelessWidget {
  const RedeemedReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leadingWidth: 20.w,
        leading: Padding(
          padding: EdgeInsets.only(
            left: 5.w,
          ),
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  navigator<NavigationService>().goBack();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: const CircleBorder(),
                  primary:
                      Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
                  onPrimary: Theme.of(context).colorScheme.primary,
                ),
                child: SvgPicture.asset(
                  AssetConstants.backSvg,
                  width: 16.w,
                )),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text('Redeemed',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                )),
            height: 2.h,
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TimePeriodWidget(
                title: 'Today',
                onClick: () {},
              ),
              TimePeriodWidget(
                title: 'Week',
                onClick: () {},
                isActive: true,
              ),
              TimePeriodWidget(
                title: 'All',
                onClick: () {},
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Column(
              children: const [
                RedeemedItem(),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class TimePeriodWidget extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function()? onClick;

  const TimePeriodWidget({
    Key? key,
    this.onClick,
    this.isActive = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.h,
      width: 25.w,
      child: SecondaryButton(
        btnText: title,
        bgColor: isActive
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary,
        btnTextColor: Theme.of(context).colorScheme.secondary,
        textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
        btnBorderRadius: 3.w,
        onPressedBtn: onClick,
      ),
    );
  }
}
