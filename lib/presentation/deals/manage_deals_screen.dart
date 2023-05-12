import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:sizer/sizer.dart';
import '../../application/manage_deals/manage_deals_bloc.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../domain/services/navigation_service/routers/route_names.dart';
import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../infrastructure/enums/deal_type.dart';
import 'widgets/todays_deal_item.dart';

class ManageDealsScreen extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;

  const ManageDealsScreen({
    super.key,
    required this.zoomDrawerController,
  });

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    String serverUrl = AppConfig.of(context)!.serverUrl;

    return BlocProvider(
      create: (context) => ManageDealsBloc(ManageDealsState.initial(
        appStateNotifier: appStateNotifier,
        serverUrl: serverUrl,
        zoomDrawerController: zoomDrawerController,
      ))
        ..add(const ManageDealsEvent.init()),
      child: const ManageDealsConsumer(),
    );
  }
}

class ManageDealsConsumer extends StatelessWidget {
  const ManageDealsConsumer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageDealsBloc, ManageDealsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          color: Colors.transparent,
          height: 100.h,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              child: Stack(children: [
                Column(
                  children: [
                    Container(
                      height: 16.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(0.w),
                          bottomRight: Radius.circular(8.w),
                          topLeft: Radius.circular(0.w),
                          bottomLeft: Radius.circular(8.w),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () async {
                              if (state.zoomDrawerController.isOpen!()) {
                                state.zoomDrawerController.close!();
                              } else {
                                state.zoomDrawerController.open!();
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
                    Container(
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
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomCard(
                                image: AssetConstants.balance,
                                title: DealsConstants.balance,
                                onClick: () {
                                  navigator<NavigationService>().navigateTo(
                                      CoreRoutes.reportsRoute,
                                      queryParams: {
                                        'tabIndex': '0',
                                        'tabName': DealType.BALANCE.name,
                                      });
                                },
                              ),
                              CustomCard(
                                isPrimaryColor: false,
                                image: AssetConstants.redeemed,
                                title: DealsConstants.redeemed,
                                onClick: () {
                                  navigator<NavigationService>().navigateTo(
                                      CoreRoutes.reportsRoute,
                                      queryParams: {
                                        'tabIndex': '1',
                                        'tabName': DealType.REDEEMED.name,
                                      });
                                },
                              ),
                              CustomCard(
                                image: AssetConstants.verified,
                                title: DealsConstants.verified,
                                onClick: () {
                                  navigator<NavigationService>().navigateTo(
                                      CoreRoutes.reportsRoute,
                                      queryParams: {
                                        'tabIndex': '2',
                                        'tabName': DealType.VERIFIED.name,
                                      });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100.w,
                      color: Theme.of(context).colorScheme.background,
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Text(
                        DateFormat('d MMM y').format(DateTime.now()),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                    Expanded(
                      child: state.isLoading
                          ? Container(
                              color: Theme.of(context).colorScheme.background,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : state.todaysDeals.isEmpty
                              ? Container(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                  child: ListView.separated(
                                    controller: state.scrollController,
                                    physics: const BouncingScrollPhysics(),
                                    padding: EdgeInsets.only(
                                      left: 5.w,
                                      right: 5.w,
                                      bottom: 8.h,
                                    ),
                                    separatorBuilder: ((context, index) {
                                      return SizedBox(
                                        height: 2.h,
                                      );
                                    }),
                                    itemBuilder: (ctx, i) {
                                      final mainIndex = i;

                                      if (mainIndex <
                                          state.todaysDeals.length) {
                                        return TodaysDealItem(
                                          dealDto: state.todaysDeals[i],
                                        );
                                      } else {
                                        return SizedBox(
                                          height: 15.h,
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[400]!,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.w),
                                                color: Colors.grey[300],
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    itemCount: state.todaysDeals.length +
                                        (state.hasMoreDocs ? 2 : 0),
                                  ),
                                ),
                    )
                  ],
                )
              ]),
            ),
            Positioned(
              left: 10.w,
              top: 13.h,
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
                      padding: EdgeInsets.only(
                        left: 5.w,
                      ),
                      child: Text(
                        AppConstants.hello,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 5.w,
                      ),
                      child: Text(
                        state.profile!.shopName ?? '',
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
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
      },
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
