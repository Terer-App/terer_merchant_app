import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../domain/core/configs/injection.dart';

import '../../domain/services/navigation_service/navigation_service.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leading;
  const CustomAppBar({Key? key, this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: leading ??
          Container(
            padding: EdgeInsets.only(left: 5.w),
            child: Center(
                child: GestureDetector(
              onTap: () {
                navigator<NavigationService>().goBack();
              },
              child: Icon(Icons.arrow_back),
              // SvgPicture.asset(AssetConstants.backSvg, width: 7.w),),
            )),
          ),
    );
  }
}

extension CustomAppBarExtension on CustomAppBar {
  PreferredSizeWidget get wrapWithPreferredSize {
    return PreferredSize(
      preferredSize: Size(double.infinity, 6.h),
      child: this,
    );
  }
}
