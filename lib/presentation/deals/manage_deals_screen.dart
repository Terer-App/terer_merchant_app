import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../application/manage_deals/manage_deals_bloc.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/custom_localization.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/extensions/date_time_extension.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../domain/services/navigation_service/routers/route_names.dart';
import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../core/custom_button.dart';

class ManageDealsScreen extends StatelessWidget {
  final Function(int moveTo)? navCallBack;

  const ManageDealsScreen({
    super.key,
    required this.navCallBack,
  });

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    String serverUrl = AppConfig.of(context)!.serverUrl;
    String apiUrl = AppConfig.of(context)!.apiUrl;

    return BlocProvider(
      create: (context) => ManageDealsBloc(ManageDealsState.initial(
        appStateNotifier: appStateNotifier,
        navCallBack: navCallBack,
        serverUrl: serverUrl,
        apiUrl: apiUrl,
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
        return Stack(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  height: 100.h,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 20.h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 15.h,
                                  color: Theme.of(context).colorScheme.primary,
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 6.h, left: 4.w),
                                        child: IconButton(
                                          onPressed: () async {
                                            ZoomDrawer.of(context)!.toggle();
                                          },
                                          icon: SvgPicture.asset(
                                            AssetConstants.burgerSvg,
                                            width: 7.w,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 4.h),
                                        child: RichText(
                                            text: TextSpan(
                                                text: 'Hello ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                    ),
                                                children: [
                                              TextSpan(
                                                text: state.profile!.firstName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                    ),
                                              )
                                            ])),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 14.w,
                            bottom: 1.8.h,
                            child: SearchCustomerBox(
                                controller: state.searchCustomerController,
                                onChange: (val) {
                                  EasyDebounce.debounce(
                                      'customer-name-debounce',
                                      const Duration(milliseconds: 500), () {
                                    context.read<ManageDealsBloc>().add(
                                          ManageDealsEvent.fetchCustomerOrders(
                                            startDate: state.startDate,
                                            endDate: state.endDate == null
                                                ? state.startDate
                                                : state.endDate!,
                                          ),
                                        );
                                  });
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomCard(
                              image: AssetConstants.createOrder,
                              title: DealsConstants.liveDeals,
                              onClick: () {
                                navigator<NavigationService>().navigateTo(
                                  CoreRoutes.liveDealListingRoute,
                                );
                              },
                            ),
                            CustomCard(
                              isPrimaryColor: false,
                              image: AssetConstants.payOut,
                              title: DealsConstants.payOut,
                              onClick: () {
                                navigator<NavigationService>()
                                    .navigateTo(CoreRoutes.payoutListingRoute);
                              },
                            ),
                            CustomCard(
                              image: AssetConstants.balance,
                              title: DealsConstants.createOrder,
                              onClick: () {
                                navigator<NavigationService>()
                                    .navigateTo(CoreRoutes.createOrderRoute);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.w),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.w),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 12,
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Today\'s Sale',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 11.sp,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      state.todaysDealsCount.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 15.sp,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 2,
                                color: Theme.of(context).colorScheme.background,
                                height: 5.h,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Today\'s Revenue',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 11.sp,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      'RM ${state.todaysRevenue.toStringAsFixed(2)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 15.sp,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 100.w,
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: Localizations.override(
                          context: context,
                          locale: const Locale('en', 'Custom'),
                          delegates: const [
                            CustomMaterialLocalizationsDelegate('dd/MM/yyyy'),
                          ],
                          child: GestureDetector(
                            onTap: () {
                              showDateRangePicker(
                                fieldStartHintText: 'dd/MM/yyyy',
                                fieldEndHintText: 'dd/MM/yyyy',
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      inputDecorationTheme:
                                          InputDecorationTheme(
                                        labelStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: Colors.black,
                                            ),
                                      ),
                                      textTheme:
                                          Theme.of(context).textTheme.copyWith(
                                                subtitle1: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                      fontSize: 12.sp,
                                                    ),
                                              ),
                                      colorScheme: ColorScheme.light(
                                        primary: Theme.of(context).primaryColor,
                                        onPrimary: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        onSurface: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime.now(),
                              ).then((value) {
                                if (value != null) {
                                  context.read<ManageDealsBloc>().add(
                                        ManageDealsEvent.fetchCustomerOrders(
                                            startDate: value.start,
                                            endDate: value.end),
                                      );
                                }
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (state.startDate.year == state.endDate.year)
                                      ? '${state.startDate.displayDateV3} - ${state.endDate.displayDateV2}'
                                      : '${state.startDate.displayDateV2} - ${state.endDate.displayDateV2}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                SvgPicture.asset(
                                  AssetConstants.polygon2Svg,
                                  width: 3.5.w,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: state.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : state.customerDeals.isEmpty
                                ? Container(
                                    alignment: Alignment.center,
                                    color: Colors.transparent,
                                    child: Text(
                                      'No Deals Available!',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 12.sp,
                                          ),
                                    ),
                                  )
                                : RefreshIndicator(
                                    onRefresh: () async {
                                      context.read<ManageDealsBloc>().add(
                                              ManageDealsEvent
                                                  .fetchCustomerOrders(
                                            endDate: state.endDate,
                                            startDate: state.startDate,
                                          ));
                                    },
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
                                            state.customerDeals.length) {
                                          final deal =
                                              state.customerDeals[mainIndex];
                                          return GestureDetector(
                                            onTap: () {
                                              navigator<NavigationService>()
                                                  .navigateTo(
                                                      CoreRoutes
                                                          .customerPurchaseDealDetailsRoute,
                                                      queryParams: {
                                                    'customerName':
                                                        deal.customerName,
                                                    'customerId': deal.userId,
                                                  });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w,
                                                  vertical: 1.h),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.w),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        deal.customerName,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .scaffoldBackgroundColor,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                      SizedBox(
                                                        width: 60.w,
                                                        child: Text(
                                                          deal.dealName,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .scaffoldBackgroundColor,
                                                                    fontSize:
                                                                        11.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Balance: ${deal.noOfCoupons - deal.giftedCount - deal.noOfCouponsRedeemed}/${deal.noOfCoupons} coupon left',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        AssetConstants
                                                            .polygonSvg,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        } else {
                                          return SizedBox(
                                            height: 11.h,
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.grey[400]!,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.w),
                                                  color: Colors.grey[300],
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      itemCount: state.customerDeals.length +
                                          (state.hasMoreDocs ? 2 : 0),
                                    ),
                                  ),
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                    curve: Curves.easeIn,
                    duration: const Duration(seconds: 1),
                    right: state.isShowLatestDealPopup ? 2.w : -100.w,
                    top: 21.5.h,
                    child: Stack(
                      children: [
                        Container(
                          width: 65.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 1.2.h),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          child: Column(children: [
                            Text(
                              'It’s a SALE!',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              'Get ready to verify.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            PrimaryButton(
                                bgColor:
                                    Theme.of(context).colorScheme.secondary,
                                btnTextColor: Theme.of(context).primaryColor,
                                textFontSize: 12.sp,
                                width: 40.w,
                                height: 4.h,
                                btnText: 'Verify Now',
                                onPressedBtn: () {
                                  // go to scan tab
                                  state.navCallBack!(1);
                                })
                          ]),
                        ),
                        Positioned(
                          right: 1.w,
                          top: 2.h,
                          child: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              AssetConstants.closeSvg,
                              width: 8.w,
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        );
      },
    );
  }
}

class SearchCustomerBox extends StatelessWidget {
  final Function(String?)? onChange;
  final TextEditingController controller;
  const SearchCustomerBox({
    super.key,
    required this.onChange,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 6.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 15,
              offset: const Offset(0, 4) // changes position of shadow
              ),
        ],
      ),
      child: TextField(
        onChanged: onChange,
        controller: controller,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 12.sp,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.w),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Customer Name',
          hintStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 12.sp, color: const Color(0xff8C8585)),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 2.w),
            child: Icon(
              Icons.search,
              size: 7.w,
            ),
          ),
          contentPadding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final bool isPrimaryColor;
  final bool isDisabled;
  final String title;
  final String image;
  final Function()? onClick;

  const CustomCard({
    Key? key,
    required this.image,
    this.onClick,
    required this.title,
    this.isPrimaryColor = true,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isDisabled
                  ? Colors.black
                  : isPrimaryColor
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 4.0, offset: Offset(0, 5)),
              ],
              borderRadius: BorderRadius.circular(7.w),
            ),
            padding: EdgeInsets.all(4.w),
            height: 9.5.h,
            width: 20.w,
            child: Image.asset(
              image,
              opacity: isDisabled ? const AlwaysStoppedAnimation(0.2) : null,
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
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
