import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../application/payout/payout_listing/payout_listing_bloc.dart';
import '../../domain/constants/asset_constants.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../infrastructure/dtos/brought_deal_dto/brought_deal_dto.dart';
import '../../presentation/core/custom_button.dart';

class PayoutListingScreen extends StatelessWidget {
  const PayoutListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    String serverUrl = AppConfig.of(context)!.serverUrl;
    String apiUrl = AppConfig.of(context)!.apiUrl;
    return BlocProvider(
      create: (context) => PayoutListingBloc(PayoutListingState.initial(
        appStateNotifier: appStateNotifier,
        serverUrl: serverUrl,
        apiUrl: apiUrl,
      ))
        ..add(const PayoutListingEvent.init()),
      child: const PayoutListingConsumer(),
    );
  }
}

class PayoutListingConsumer extends StatelessWidget {
  const PayoutListingConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PayoutListingBloc, PayoutListingState>(
      listener: (context, state) {},
      builder: (context, state) {
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
              'Payout',
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
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.2.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // Shadow only on the bottom
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Spacer(),
                    // GestureDetector(
                    //   onTap: () {
                    //     showDatePicker(
                    //             builder: (context, child) {
                    //               return Theme(
                    //                 data: Theme.of(context).copyWith(
                    //                   colorScheme: ColorScheme.light(
                    //                     primary: Theme.of(context).primaryColor,
                    //                     onPrimary: Theme.of(context)
                    //                         .colorScheme
                    //                         .secondary,
                    //                     onSurface: Theme.of(context)
                    //                         .colorScheme
                    //                         .secondary,
                    //                   ),
                    //                 ),
                    //                 child: child!,
                    //               );
                    //             },
                    //             context: context,
                    //             initialDate: state.selectedDateTime,
                    //             firstDate: DateTime(2000),
                    //             lastDate: DateTime(2100))
                    //         .then((value) {
                    //       if (value != null) {
                    //         context.read<PayoutListingBloc>().add(
                    //             PayoutListingEvent
                    //                 .fetchBroughtDealsByDayOrMonth(
                    //                     isMonth: false,
                    //                     startDate: value,
                    //                     endDate: value));
                    //       }
                    //     });
                    //   },
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         'Daily',
                    //         style:
                    //             Theme.of(context).textTheme.bodySmall!.copyWith(
                    //                   fontSize: 12.sp,
                    //                   fontWeight: FontWeight.w600,
                    //                   color: Theme.of(context).primaryColor,
                    //                 ),
                    //       ),
                    //       SizedBox(
                    //         width: 1.w,
                    //       ),
                    //       SvgPicture.asset(
                    //         AssetConstants.polygon2Svg,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // const Spacer(),
                    // Container(
                    //   width: 1,
                    //   height: 3.h,
                    //   color: Theme.of(context).colorScheme.primaryContainer,
                    // ),
                    // const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        showMonthPicker(
                          context: context,
                          initialDate: state.selectedDateTime,
                        ).then((date) {
                          if (date != null) {
                            context.read<PayoutListingBloc>().add(
                                  PayoutListingEvent
                                      .fetchBroughtDealsByDayOrMonth(
                                    isMonth: true,
                                    startDate: date,
                                    endDate: DateTime(date.year, date.month + 1,
                                        0),
                                  ),
                                );
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            'Month',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          SvgPicture.asset(
                            AssetConstants.polygon2Svg,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: Color(0xffE7E7E7)),
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text(
                  state.isSelectedMonth
                      ? DateFormat('MMMM y').format(state.selectedDateTime)
                      : DateFormat('d MMM y').format(state.selectedDateTime),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
              Expanded(
                  child: state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state.broughtDeals.isEmpty
                          ? const Center(
                              child: Text('No Deals!'),
                            )
                          : ListView.separated(
                              controller: state.scrollController,
                              padding: EdgeInsets.symmetric(
                                vertical: 2.h,
                                horizontal: 5.w,
                              ),
                              itemBuilder: (context, index) {
                                int mainIndex = index;
                                if (mainIndex < state.broughtDeals.length) {
                                  BroughtDealDto deal =
                                      state.broughtDeals[index];

                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              deal.customerName,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    fontSize: 13.sp,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            'Purchased: ${DateFormat('d MMM y').format(deal.datePurchase)}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  fontSize: 11.sp,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 70.w,
                                            child: Text(
                                              deal.dealName,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    fontSize: 11.sp,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            'RM${deal.dealPrice}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  fontSize: 11.sp,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: deal.isPaid == 1
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Colors.grey
                                                      .withOpacity(0.8),
                                              borderRadius:
                                                  BorderRadius.circular(2.w),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 3.w,
                                            ),
                                            child: Text(
                                              deal.isPaid == 1
                                                  ? 'Paid'
                                                  : 'Pending',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
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
                                              BorderRadius.circular(8.w),
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: 4.h,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                      .withOpacity(0.5),
                                );
                              },
                              itemCount: state.hasMoreDocs
                                  ? state.broughtDeals.length + 2
                                  : state.broughtDeals.length,
                            )),
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: PrimaryButton(
                    height: 5.5.h,
                    width: 80.w,
                    btnTextColor: state.invoiceDocLink.isEmpty
                        ? Colors.white.withOpacity(0.5)
                        : Theme.of(context).primaryColor,
                    btnBorder:
                        state.invoiceDocLink.isEmpty ? BorderSide.none : null,
                    bgColor: Theme.of(context).colorScheme.secondary,
                    btnText: 'Extract Invoice',
                    onPressedBtn: state.invoiceDocLink.isEmpty
                        ? null
                        : () {
                            launchUrl(
                              Uri.parse(
                                state.invoiceDocLink,
                              ),
                              mode: LaunchMode.externalApplication,
                            );
                          }),
              ),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
