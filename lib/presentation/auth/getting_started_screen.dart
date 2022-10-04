import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../domain/services/navigation_service/routers/route_names.dart';
import '../core/custom_button.dart';

class GettingStartedScreen extends StatelessWidget {
  final bool asBackground;
  final double? buttonHeight;
  const GettingStartedScreen(
      {Key? key, this.asBackground = false, this.buttonHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: 100.h,
        child: Stack(
          children: [
            Image.asset(
              AssetConstants.backgroundImage,
              height: 60.h,
              width: 100.w,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: buttonHeight ?? 55.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.w),
                        topRight: Radius.circular(5.w))),
                child: asBackground
                    ? Container()
                    : ListView(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.w),
                        children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Image.asset(
                                AssetConstants.logoImage,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              AuthConstants.startedTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            PrimaryButton(
                                textFontSize: 16.sp,
                                btnText: AuthConstants.createAnAccount,
                                onPressedBtn: () {
                                  navigator<NavigationService>().navigateTo(
                                    AuthRoutes.registerRoute,
                                  );
                                }),
                            SizedBox(
                              height: 3.h,
                            ),
                            PrimaryButton(
                                textFontSize: 16.sp,
                                btnText: AuthConstants.login,
                                bgColor:
                                    Theme.of(context).colorScheme.secondary,
                                btnTextColor: Theme.of(context).primaryColor,
                                onPressedBtn: () {
                                  navigator<NavigationService>().navigateTo(
                                    AuthRoutes.logInRoute,
                                  );
                                }),
                          ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
