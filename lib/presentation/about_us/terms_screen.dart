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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 8.h,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            navigator<NavigationService>().goBack();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: SvgPicture.asset(
              AssetConstants.backArrowYellow,
            ),
          ),
        ),
        title: Text(
          AppConstants.termsTitle,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 2.h,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
          ),
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
