import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:sizer/sizer.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/extensions/sizer_extension.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../domain/services/navigation_service/routers/route_names.dart';
import 'custom_button.dart';

class MenuWidget extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;
  const MenuWidget({Key? key, required this.zoomDrawerController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppStateNotifier appStateNotifier =
    //     Provider.of<AppStateNotifier>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 5.h,
            ),
            Image.asset(
              AssetConstants.logoImage,
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              AppConstants.welcome,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            Text(
              'Hipster Coffee Shop',
              // appStateNotifier.customer!.firstName.capitalizeCamel,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize:
                      (SizerUtilExtension.checkSizerIsSupported) ? 14.sp : 18,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            SizedBox(
              height: 7.h,
            ),
            MenuItem(
              zoomDrawerController: zoomDrawerController,
              icon: AssetConstants.reportSvg,
              title: MenuConstants.disputeReport,
              onClick: () {
                zoomDrawerController.close!();
                navigator<NavigationService>()
                    .navigateTo(CoreRoutes.disputeReportRoute);
              },
            ),
            MenuItem(
              zoomDrawerController: zoomDrawerController,
              icon: AssetConstants.editSvg,
              title: MenuConstants.termsAndConditions,
              onClick: () {
                zoomDrawerController.close!();
                navigator<NavigationService>()
                    .navigateTo(CoreRoutes.termsRoute);
              },
            ),
            MenuItem(
              zoomDrawerController: zoomDrawerController,
              icon: AssetConstants.phoneSvg,
              title: MenuConstants.contactUs,
              onClick: () {
                zoomDrawerController.close!();
                navigator<NavigationService>()
                    .navigateTo(CoreRoutes.contactUsRoute);
              },
            ),
            MenuItem(
              zoomDrawerController: zoomDrawerController,
              icon: AssetConstants.iconSvg,
              title: MenuConstants.about,
              onClick: () {
                zoomDrawerController.close!();
                navigator<NavigationService>()
                    .navigateTo(CoreRoutes.aboutUsRoute);
              },
            ),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: SecondaryButton(
                    btnBorderRadius: 10.w,
                    newChild: Row(children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      SvgPicture.asset(AssetConstants.logoutSvg),
                      const Spacer(),
                      Text(
                        AuthConstants.logout,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              letterSpacing: 1.1,
                              fontSize: 16.sp,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const Spacer(),
                    ]),
                    btnText: '',
                    onPressedBtn: () async {}))
          ]),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function()? onClick;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
    this.onClick,
    required this.zoomDrawerController,
  }) : super(key: key);

  final ZoomDrawerController zoomDrawerController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(icon, width: 6.w),
              SizedBox(
                width: 4.w,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary),
              )
            ],
          ),
          SizedBox(
            height: 1.5.h,
          ),
        ],
      ),
    );
  }
}