import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:terer_merchant/domain/constants/string_constants.dart';
import 'package:terer_merchant/presentation/deals/widgets/redeemed_item.dart';

import '../../../domain/constants/asset_constants.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/services/navigation_service/navigation_service.dart';
import '../../core/report_filter_tab.dart';

class RedeemedReportScreen extends StatelessWidget {
  const RedeemedReportScreen({Key? key}) : super(key: key);

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
                  backgroundColor:
                      Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: SvgPicture.asset(
                  AssetConstants.backSvg,
                  width: 16.w,
                )),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(DealsConstants.redeemedReport,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
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
              ReportFilterTab(
                title: DealsConstants.balance,
                onClick: () {},
              ),
              ReportFilterTab(
                title: DealsConstants.redeemed,
                onClick: () {},
                isActive: true,
              ),
              ReportFilterTab(
                title: DealsConstants.verify,
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
                RedeemedOrVerifyItem(),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
