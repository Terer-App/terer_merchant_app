import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../application/place_order/place_order_bloc.dart';
import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../domain/services/navigation_service/routers/route_names.dart';
import '../../infrastructure/dtos/outlet/outlet_dto.dart';
import '../core/custom_button.dart';
import '../core/custom_text_field.dart';
import '../scan/widgets/select_outlet.dart';
import 'widgets/place_order_deal_widget.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String serverUrl = AppConfig.of(context)!.serverUrl;
    String apiUrl = AppConfig.of(context)!.apiUrl;

    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => PlaceOrderBloc(PlaceOrderState.initial(
        appStateNotifier: appStateNotifier,
        serverUrl: serverUrl,
        apiUrl: apiUrl,
      ))
        ..add(const PlaceOrderEvent.init()),
      child: const PlaceOrderScreenConsumer(),
    );
  }
}

class PlaceOrderScreenConsumer extends StatelessWidget {
  const PlaceOrderScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlaceOrderBloc, PlaceOrderState>(
      listener: (context, state) async {
        if (state.showOutletBottomSheet) {
          await showModalBottomSheet<OutletDto?>(
            context: context,
            isDismissible: false,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return SelectOutlet(
                isHome: false,
                outlets: state.outlets,
                brand: state.appStateNotifier.profile!.brand,
                alreadySelectedOutlet: state.selectedOutlet,
              );
            },
          ).then((value) async {
            if (value != null) {
              context.read<PlaceOrderBloc>().add(
                    PlaceOrderEvent.emitFromAnywhere(
                      state: state.copyWith(
                          selectedOutlet: value,
                          showOutletBottomSheet: false,
                          selectedOutletProducts: []),
                    ),
                  );
              // ignore: prefer_const_constructors
              await Future.delayed(Duration(milliseconds: 150));
              context.read<PlaceOrderBloc>().add(
                  PlaceOrderEvent.onLoadOutletProducts(outletId: value.code!));
            } else {
              context.read<PlaceOrderBloc>().add(
                    PlaceOrderEvent.emitFromAnywhere(
                      state: state.copyWith(showOutletBottomSheet: false),
                    ),
                  );
            }
          });
        }
      },
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
              AppConstants.createOrderTitle,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  Container(
                    height: 2.h,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                  ),
                  Expanded(
                    child: ModalProgressHUD(
                      inAsyncCall: state.isLoading,
                      child: Column(children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        if (state.selectedOutlet != null)
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            text:
                                                '${PlaceOrderConstants.currentlySelected} \n ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11.sp,
                                                ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    state.selectedOutlet!.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      fontSize: 11.sp,
                                                    ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Visibility(
                                      visible: state.outlets.length != 1,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.h),
                                        child: PrimaryButton(
                                            width: 40.w,
                                            btnText: PlaceOrderConstants
                                                .switchOutlet,
                                            textFontSize: 12.sp,
                                            onPressedBtn: () {
                                              context
                                                  .read<PlaceOrderBloc>()
                                                  .add(
                                                    PlaceOrderEvent
                                                        .emitFromAnywhere(
                                                      state: state.copyWith(
                                                          showOutletBottomSheet:
                                                              true),
                                                    ),
                                                  );
                                            }),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.h),
                                  child: PrimaryTextField(
                                    controller: state.searchController,
                                    maxLines: 1,
                                    hintText: PlaceOrderConstants.searchDeals,
                                    onChanged: (value) {
                                      BlocProvider.of<PlaceOrderBloc>(context)
                                          .add(PlaceOrderEvent.onSearchDeals(
                                              value));
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Expanded(
                                  child: ListView.separated(
                                      padding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 5.w)
                                          .copyWith(bottom: 120),
                                      itemBuilder: (context, index) {
                                        return PlaceOrderDealWidget(
                                            dealName: state
                                                .searchedOutletProducts[index]
                                                .title,
                                            currencyCode: state
                                                .searchedOutletProducts[index]
                                                .compareAtPriceRange
                                                .maxVariantPrice
                                                .currencyCode,
                                            actualPrice: calculatePrice(
                                                state
                                                    .searchedOutletProducts[
                                                        index]
                                                    .compareAtPriceRange
                                                    .maxVariantPrice
                                                    .amount,
                                                state
                                                    .searchedOutletProducts[
                                                        index]
                                                    .quantity),
                                            assetImage: state
                                                .searchedOutletProducts[index]
                                                .featuredImage
                                                .url,
                                            discountedPrice: calculatePrice(
                                                state
                                                    .searchedOutletProducts[
                                                        index]
                                                    .priceRange
                                                    .maxVariantPrice
                                                    .amount,
                                                state
                                                    .searchedOutletProducts[
                                                        index]
                                                    .quantity),
                                            quantity: state
                                                .searchedOutletProducts[index]
                                                .quantity,
                                            increment: () {
                                              context
                                                  .read<PlaceOrderBloc>()
                                                  .add(PlaceOrderEvent
                                                      .onIncrementDealQuantity(
                                                          productId: state
                                                              .searchedOutletProducts[
                                                                  index]
                                                              .id));
                                            },
                                            decrement: () {
                                              context
                                                  .read<PlaceOrderBloc>()
                                                  .add(PlaceOrderEvent
                                                      .onDecrementDealQuantity(
                                                          productId: state
                                                              .searchedOutletProducts[
                                                                  index]
                                                              .id));
                                            });
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 3.w,
                                        );
                                      },
                                      itemCount:
                                          state.searchedOutletProducts.length),
                                ),
                                PrimaryButton(
                                    width: 90.w,
                                    textFontSize: 12.sp,
                                    bgColor: Theme.of(context).primaryColor,
                                    btnTextColor:
                                        Theme.of(context).colorScheme.secondary,
                                    btnBorder: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                    btnText: AppConstants.checkout,
                                    onPressedBtn: () {
                                      navigator<NavigationService>().navigateTo(
                                          CoreRoutes.cartRoute,
                                          arguments:
                                              state.selectedOutletProducts);
                                    }),
                              ],
                            ),
                          ),
                        SizedBox(
                          height: 1.h,
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String calculatePrice(String priceString, int quantity) {
    double price = double.tryParse(priceString) ?? 0.0;

    if (quantity == 0) {
      return (price * 1).toString();
    } else {
      double totalPrice = quantity * price;
      return totalPrice.toStringAsFixed(1);
    }
  }
}
