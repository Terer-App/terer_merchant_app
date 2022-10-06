import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/config.dart';

import 'package:sizer/sizer.dart';
import 'package:terer_merchant/domain/core/configs/injection.dart';
import 'package:terer_merchant/domain/services/navigation_service/navigation_service.dart';
import 'package:terer_merchant/domain/services/navigation_service/routers/route_names.dart';
import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../core/custom_button.dart';

class ManageDealsScreen extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;

  const ManageDealsScreen({
    Key? key,
    required this.zoomDrawerController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 100.h,
      child: Stack(children: [
        SizedBox(
          child: Stack(children: [
            Column(
              children: [
                Container(
                  height: 20.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0.w),
                        bottomRight: Radius.circular(8.w),
                        topLeft: Radius.circular(0.w),
                        bottomLeft: Radius.circular(8.w)),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () async {
                          if (zoomDrawerController.isOpen!()) {
                            zoomDrawerController.close!();
                          } else {
                            zoomDrawerController.open!();
                          }
                        },
                        icon: SvgPicture.asset(
                          AssetConstants.burgerSvg,
                          width: 7.w,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: Container(
                      width: double.maxFinite,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(7.w),
                            bottomRight: Radius.circular(0.w),
                            topLeft: Radius.circular(7.w),
                            bottomLeft: Radius.circular(0.w)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4.0,
                                    offset: Offset(0, 5)),
                              ],
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            height: 16.h,
                            width: 100.w,
                            padding: EdgeInsets.all(4.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetConstants.manageDeals,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DealsConstants.manageDeals,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 14.sp,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SecondaryButton(
                                      btnText: DealsConstants.open,
                                      width: 30.w,
                                      height: 4.h,
                                      textFontSize: 12.sp,
                                      btnBorderRadius: 7.w,
                                      onPressedBtn: () {},
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomCard(
                                image: AssetConstants.purchased,
                                title: DealsConstants.purchased,
                                onClick: () {
                                  navigator<NavigationService>()
                                      .navigateTo(CoreRoute.purchasedRoute);
                                },
                              ),
                              CustomCard(
                                isPrimaryColor: false,
                                image: AssetConstants.payout,
                                title: DealsConstants.payOut,
                                onClick: () {},
                              ),
                              CustomCard(
                                image: AssetConstants.redeemed,
                                title: DealsConstants.redeemed,
                                onClick: () {
                                  navigator<NavigationService>()
                                      .navigateTo(CoreRoute.redeemedRoute);
                                },
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ],
            )
          ]),
        ),
        Positioned(
          left: 10.w,
          top: 17.h,
          child: Container(
            height: 13.h,
            width: 80.w,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.w),
                  bottomRight: Radius.circular(0.w),
                  topLeft: Radius.circular(10.w),
                  bottomLeft: Radius.circular(0.w)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                  child: Text(
                    AppConstants.hello,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                  child: Text(
                    'Hipster Coffee Shop',
                    // state.appStateNotifier.customer!.firstName
                    //     .capitalizeCamel
                    //     ,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        fontWeight: FontWeight.w100,
                        fontSize: 20.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class CustomCard extends StatelessWidget {
  final bool isPrimaryColor;
  final String title;
  final String image;
  final Function()? onClick;

  const CustomCard({
    Key? key,
    required this.image,
    this.onClick,
    required this.title,
    this.isPrimaryColor = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isPrimaryColor
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 4.0, offset: Offset(0, 5)),
              ],
              borderRadius: BorderRadius.circular(6.w),
            ),
            padding: EdgeInsets.all(4.w),
            height: 11.h,
            width: 24.w,
            child: Image.asset(
              image,
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: isPrimaryColor
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                ),
          )
        ],
      ),
    );
  }
}
