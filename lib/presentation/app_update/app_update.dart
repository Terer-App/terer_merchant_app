import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../domain/constants/asset_constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../domain/services/storage_service/app_update_service.dart';
import '../core/custom_button.dart';

class ForceUpdateWidget extends StatelessWidget {
  final String downloadLink;
  const ForceUpdateWidget({
    Key? key,
    required this.downloadLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.onTertiaryContainer, //New
                blurRadius: 25.0,
              )
            ],
          ),
          height: 40.h,
          width: 60.w,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -12.w,
                right: 18.w,
                child: CircleAvatar(
                  radius: 12.w,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              Positioned(
                top: -40.w,
                right: 5.w,
                child: Image.asset(
                  AssetConstants.updateRocket,
                  width: 50.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      AppConstants.updateAvailable,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 18.sp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      AppConstants.updateMessage,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 15.sp,
                            height: 1.5,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    const Spacer(),
                    PrimaryButton(
                        height: 5.h,
                        width: 50.w,
                        textFontSize: 16.sp,
                        textFontWeight: FontWeight.bold,
                        btnTextColor: Colors.white,
                        bgColor: Theme.of(context).colorScheme.primary,
                        btnText: AppConstants.updateNow,
                        onPressedBtn: () {
                          launchUrl(
                            Uri.parse(downloadLink),
                            mode: LaunchMode.externalApplication,
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewReleaseAvailable extends StatelessWidget {
  final String hashValue;
  final String downloadLink;
  const NewReleaseAvailable({
    Key? key,
    required this.hashValue,
    required this.downloadLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.w),
              topRight: Radius.circular(4.w),
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          width: double.infinity,
          // height: 28.h,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    height: 1.w,
                    width: 9.w,
                  )
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Row(
                children: [
                  Text(
                    AppConstants.updateAvailable,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 1.5.h),
                width: double.infinity,
                height: 0.2.h,
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
              Text(
                AppConstants.newReleaseUpdate,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryButton(
                      width: 40.w,
                      height: 5.5.h,
                      btnText: AppConstants.ignore,
                      bgColor: Theme.of(context).scaffoldBackgroundColor,
                      onPressedBtn: () async {
                        await AppUpdateService.setAppHashValue(
                            hashValue: hashValue);
                        navigator<NavigationService>().goBack();
                      }),
                  PrimaryButton(
                      width: 40.w,
                      height: 5.5.h,
                      btnText: AppConstants.installNow,
                      bgColor: Theme.of(context).colorScheme.primary,
                      onPressedBtn: () {
                        launchUrl(
                          Uri.parse(downloadLink),
                          mode: LaunchMode.externalApplication,
                        );
                        navigator<NavigationService>().goBack();
                      }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
