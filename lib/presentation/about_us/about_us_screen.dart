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
          child: Text(AppConstants.aboutUsTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
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
                      height: 8.h,
                    ),

                    // second

                    Image.asset(
                      AssetConstants.zeroImage,
                      width: 50.w,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: AboutUsConstants.para2,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                        TextSpan(
                          text: AppConstants.tryZeroWebLink,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Uri url = Uri.parse(
                                  'https://${AppConstants.tryZeroWebLink}');
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
                      height: 2.h,
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
