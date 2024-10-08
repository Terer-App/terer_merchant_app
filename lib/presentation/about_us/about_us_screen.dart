import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

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
          AppConstants.aboutUsTitle,
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
                    // first
                    Image.asset(
                      AssetConstants.logoImage,
                      width: 50.w,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: AboutUsConstants.para1,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.5.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                        TextSpan(
                          text: AppConstants.webLink,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Uri url =
                                  Uri.parse('https://${AppConstants.webLink}');
                              launchUrl(url);
                            },
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff0097a7),
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text: AboutUsConstants.companyRegNo,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.5.sp,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                          ),
                        ])),

                    SizedBox(
                      height: 10.h,
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
