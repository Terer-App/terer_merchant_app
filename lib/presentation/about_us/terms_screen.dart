import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:sizer/sizer.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0))),
        toolbarHeight: 8.h,
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
                  width: 14.w,
                )),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(AppConstants.termsTitle,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold)),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
                child: Column(
                  children: [
                    Image.asset(
                      AssetConstants.logoImage,
                      width: 50.w,
                    ),
                    // age policy
                    SizedBox(
                      height: 3.h,
                    ),
                    const HtmlWidget(
                        TermsConditionsConstants.termsAndCondition),
                    SizedBox(
                      height: 4.h,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
