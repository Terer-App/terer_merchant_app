import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../application/customer_purchase_deals/customer_purchase_deals_details/customer_purchase_deals_details_bloc.dart';
import '../../domain/constants/asset_constants.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/extensions/date_time_extension.dart';
import '../../domain/services/navigation_service/navigation_service.dart';

class CustomerPurchaseDealDetailsScreen extends StatelessWidget {
  final String name;
  final String customerId;
  const CustomerPurchaseDealDetailsScreen({
    super.key,
    required this.customerId,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    String serverUrl = AppConfig.of(context)!.serverUrl;
    String apiUrl = AppConfig.of(context)!.apiUrl;
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => CustomerPurchaseDealsDetailsBloc(
        CustomerPurchaseDealsDetailsState.initial(
          customerId: customerId,
          name: name,
          appStateNotifier: appStateNotifier,
          serverUrl: serverUrl,
          apiUrl: apiUrl,
        ),
      )..add(const CustomerPurchaseDealsDetailsEvent.init()),
      child: const CustomerPurchaseDealDetailsConsumer(),
    );
  }
}

class CustomerPurchaseDealDetailsConsumer extends StatelessWidget {
  const CustomerPurchaseDealDetailsConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerPurchaseDealsDetailsBloc,
        CustomerPurchaseDealsDetailsState>(
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
              state.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  controller: state.scrollController,
                  itemBuilder: (context, i) {
                    final orderData = state.orderHistory[i];
                    final mainIndex = i;
                    if (mainIndex < state.orderHistory.length) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              orderData.dealName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Text(
                                'Date Purchase: ${orderData.datePurchase.displayDate}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                    )),
                            SizedBox(
                              height: 2.h,
                            ),
                            Column(
                              children: List.generate(
                                  orderData.redemptionHistory.length, (index) {
                                final redemptionData =
                                    orderData.redemptionHistory[index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              )),
                                          width: 11.w,
                                          height: 11.w,
                                          child: redemptionData.isRedeemed
                                              ? CircleAvatar(
                                                  radius: 4.w,
                                                  backgroundColor:
                                                      redemptionData.isGifted
                                                          ? Theme.of(context)
                                                              .colorScheme
                                                              .secondary
                                                          : Theme.of(context)
                                                              .primaryColor,
                                                  child: SvgPicture.asset(
                                                    redemptionData.isGifted ||
                                                            redemptionData
                                                                .isVerified
                                                        ? AssetConstants.tickSvg
                                                        : AssetConstants
                                                            .exMarkSvg,
                                                    width: redemptionData
                                                                .isGifted ||
                                                            redemptionData
                                                                .isVerified
                                                        ? 4.w
                                                        : 2.w,
                                                  ),
                                                )
                                              : Text('${index + 1}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontSize: 11.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              redemptionData.isGifted
                                                  ? 'Gifted'
                                                  : redemptionData.isRedeemed
                                                      ? redemptionData
                                                              .isVerified
                                                          ? 'Verified'
                                                          : 'Not Verified'
                                                      : 'Not Redeem',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                            ),
                                            Text(
                                              'Date: ${redemptionData.date}  Time: ${redemptionData.time}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                  ],
                                );
                              }),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 20.h,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[400]!,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 2.h),
                      height: 2.h,
                      width: double.infinity,
                      color: Theme.of(context).primaryColor,
                    );
                  },
                  itemCount:
                      state.orderHistory.length + (state.hasMore ? 2 : 0),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
