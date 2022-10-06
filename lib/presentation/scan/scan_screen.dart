import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            // if (state.zoomDrawerController.isOpen!()) {
            //   state.zoomDrawerController.close!();
            // } else {
            //   state.zoomDrawerController.open!();
            // }
          },
          icon: SvgPicture.asset(
            AssetConstants.burgerSvg,
            width: 7.w,
          ),
        ),
        title: Text(AppConstants.scanTitle,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
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
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            child: Column(
              children: [
                Container(
                  height: 40.h,
                  width: 100.w,
                  color: Theme.of(context).colorScheme.background,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  ScanConstants.scanQRInstruction,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 12.sp,
                      ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
