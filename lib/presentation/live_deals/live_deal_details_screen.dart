import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:sizer/sizer.dart';

import '../../application/live_deals/live_deal_details/live_deal_details_bloc.dart';
import '../../domain/constants/asset_constants.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../infrastructure/dtos/place_order/outlet_product/outlet_product_dto.dart';

class LiveDealDetailsScreen extends StatelessWidget {
  final OutletProductDto dealDetails;
  const LiveDealDetailsScreen({
    super.key,
    required this.dealDetails,
  });

  @override
  Widget build(BuildContext context) {
    String serverUrl = AppConfig.of(context)!.serverUrl;
    String apiUrl = AppConfig.of(context)!.apiUrl;
    return BlocProvider(
      create: (context) => LiveDealDetailsBloc(LiveDealDetailsState.initial(
        serverUrl: serverUrl,
        apiUrl: apiUrl,
        dealDetails: dealDetails,
        selectedVariant:
            dealDetails.variants.isNotEmpty ? dealDetails.variants.first : null,
      )),
      child: const LiveDealDetailsConsumer(),
    );
  }
}

class LiveDealDetailsConsumer extends StatelessWidget {
  const LiveDealDetailsConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LiveDealDetailsBloc, LiveDealDetailsState>(
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
              'Deal Details',
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          state.dealDetails.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        if (state.dealDetails.variants.isNotEmpty)
                          SizedBox(
                            height: 5.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: state.dealDetails.variants.length,
                              itemBuilder: (context, index) {
                                final variant =
                                    state.dealDetails.variants[index];
                                final bool isSelected =
                                    variant.id == state.selectedVariant?.id;
                                return GestureDetector(
                                  onTap: () {
                                    context.read<LiveDealDetailsBloc>().add(
                                        LiveDealDetailsEvent.onVariantChange(
                                            productId: variant.id));
                                  },
                                  child: Container(
                                    width: 15.w,
                                    margin: EdgeInsets.only(right: 3.w),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: isSelected
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer,
                                        ),
                                        color: isSelected
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        variant.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary,
                                              fontWeight: isSelected
                                                  ? FontWeight.bold
                                                  : FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Redemption Duration',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              width: 100.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 1.5.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.w),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  )),
                              child: Text(
                                state.dealDetails.redeemDuration == null
                                    ? '-'
                                    : '${state.dealDetails.redeemDuration['value']}'
                                        .toUpperCase(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                    ),
                              ),
                            )
                          ],
                        ),

                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Product Description',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        HtmlWidget(
                          state.dealDetails.descriptionHtml ?? '',
                        ),
                        // Text(
                        //   state.dealDetails.description,
                        //   textAlign: TextAlign.justify,
                        //   style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        //         fontSize: 13.sp,
                        //         fontWeight: FontWeight.w300,
                        //         height: 1.6,
                        //         color: Theme.of(context).colorScheme.secondary,
                        //       ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
