import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../application/customer_purchase_deals/customer_purchase_deals_details/customer_purchase_deals_details_bloc.dart';
import '../../domain/constants/asset_constants.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';

class CustomerPurchaseDealDetailsScreen extends StatelessWidget {
  const CustomerPurchaseDealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String serverUrl = AppConfig.of(context)!.serverUrl;
    String apiUrl = AppConfig.of(context)!.apiUrl;
    return BlocProvider(
      create: (context) => CustomerPurchaseDealsDetailsBloc(
          CustomerPurchaseDealsDetailsState.initial(
              serverUrl: serverUrl, apiUrl: apiUrl)),
      child: const CustomerPurchaseDealDetailsConsumer(),
    );
  }
}

class CustomerPurchaseDealDetailsConsumer extends StatelessWidget {
  const CustomerPurchaseDealDetailsConsumer({super.key});

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
          'Andrew',
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
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '10 Hot Coffee Beverage',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      Text('Date Purchase: 27th Aug 2024',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                              )),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        children: List.generate(10, (index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                    child: index <= 1
                                        ? CircleAvatar(
                                            radius: 4.w,
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            child: SvgPicture.asset(
                                              index == 1
                                                  ? AssetConstants.tickSvg
                                                  : AssetConstants.exMarkSvg,
                                              width: index == 1 ? 4.w : 2.w,
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
                                                  fontWeight: FontWeight.w600,
                                                )),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Verified',
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
                                        'Date: 29th Aug 2024  Time: 7.32pm',
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
              },
              separatorBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 2.h),
                  height: 2.h,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                );
              },
              itemCount: 2,
            ),
          )
        ],
      ),
    );
  }
}
