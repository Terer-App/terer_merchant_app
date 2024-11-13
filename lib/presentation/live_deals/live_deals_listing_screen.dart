import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../application/live_deals/live_deals_listing/live_deals_listing_bloc.dart';
import '../../domain/constants/asset_constants.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../domain/services/navigation_service/routers/route_names.dart';

class LiveDealsListingScreen extends StatelessWidget {
  const LiveDealsListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String serverUrl = AppConfig.of(context)!.serverUrl;
    String apiUrl = AppConfig.of(context)!.apiUrl;
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => LiveDealsListingBloc(LiveDealsListingState.initial(
        appStateNotifier: appStateNotifier,
        serverUrl: serverUrl,
        apiUrl: apiUrl,
      ))
        ..add(
          const LiveDealsListingEvent.onLoad(),
        ),
      child: const LiveDealsListingConsumer(),
    );
  }
}

class LiveDealsListingConsumer extends StatelessWidget {
  const LiveDealsListingConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LiveDealsListingBloc, LiveDealsListingState>(
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
              'Live Deals',
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
              Expanded(
                  child: state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state.products.isEmpty
                          ? const Center(
                              child: Text('No Deals found!'),
                            )
                          : ListView.separated(
                              controller: state.scrollController,
                              padding: EdgeInsets.symmetric(
                                vertical: 3.h,
                                horizontal: 5.w,
                              ),
                              itemBuilder: (context, index) {
                                final product = state.products[index];
                                return GestureDetector(
                                  onTap: () {
                                    navigator<NavigationService>().navigateTo(
                                      CoreRoutes.liveDealDetailsRoute,
                                      arguments: product,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.w),
                                        border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                        )),
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5.w),
                                                  bottomLeft:
                                                      Radius.circular(5.w)),
                                              child: Image.network(
                                                product.featuredImage.url,
                                                width: 28.w,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  width: 50.w,
                                                  child: Text(
                                                    product.title,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                    softWrap: true,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 0.5.h,
                                                ),
                                                // SizedBox(
                                                //   width: 50.w,
                                                //   child: Text(
                                                //     product.description!
                                                //         .substring(0, 10),
                                                //     overflow:
                                                //         TextOverflow.ellipsis,
                                                //     maxLines: 1,
                                                //     softWrap: true,
                                                //     style: Theme.of(context)
                                                //         .textTheme
                                                //         .bodySmall!
                                                //         .copyWith(
                                                //           fontWeight:
                                                //               FontWeight.w400,
                                                //           color:
                                                //               Theme.of(context)
                                                //                   .colorScheme
                                                //                   .secondary,
                                                //         ),
                                                //   ),
                                                // ),
                                               
                                                Text(
                                                  'MYR ${product.priceRange.minVariantPrice.amount}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primaryContainer,
                                                      ),
                                                ),
                                                Text(
                                                  'MYR ${product.compareAtPriceRange.minVariantPrice.amount}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        decorationColor:
                                                            Theme.of(context)
                                                                .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary,
                                                      ),
                                                ),
                                             
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(1.w),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      border: Border.all(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      )),
                                                  child: Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    size: 4.w,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 2.h,
                                );
                              },
                              itemCount: state.products.length))
            ],
          ),
        );
      },
    );
  }
}
