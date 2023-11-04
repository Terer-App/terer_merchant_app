import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
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
import '../core/custom_rounded_textfield.dart';
import '../scan/widgets/select_outlet.dart';
import 'widgets/place_order_deal_widget.dart';

class PlaceOrderScreen extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;

  const PlaceOrderScreen({super.key, required this.zoomDrawerController});

  @override
  Widget build(BuildContext context) {
    String serverUrl = AppConfig.of(context)!.serverUrl;

    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => PlaceOrderBloc(PlaceOrderState.initial(
          appStateNotifier: appStateNotifier,
          serverUrl: serverUrl,
          zoomDrawerController: zoomDrawerController))
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
                  outlets: state.outlets,
                  brand: state.appStateNotifier.profile!.brand);
            },
          ).then((value) {
            if (value != null) {
              context.read<PlaceOrderBloc>().add(
                    PlaceOrderEvent.emitFromAnywhere(
                      state: state.copyWith(
                          selectedOutlet: value, showOutletBottomSheet: false),
                    ),
                  );
            }
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            centerTitle: true,
            leading: IconButton(
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
            title: Text(AppConstants.placeOrderTitle,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () async {
                  navigator<NavigationService>().navigateTo(
                      CoreRoutes.cartRoute,
                      arguments: state.selectedDeals);
                },
                icon: SvgPicture.asset(
                  AssetConstants.cartSvg,
                  width: 7.w,
                ),
              ),
            ],
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: '${PlaceOrderConstants.currentlySelected} \n ',
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
                                        text: state.selectedOutlet!.name,
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
                                padding: EdgeInsets.symmetric(horizontal: 1.h),
                                child: PrimaryButton(
                                    width: 40.w,
                                    btnText: PlaceOrderConstants.switchOutlet,
                                    textFontSize: 12.sp,
                                    onPressedBtn: () {
                                      context.read<PlaceOrderBloc>().add(
                                            PlaceOrderEvent.emitFromAnywhere(
                                              state: state.copyWith(
                                                  showOutletBottomSheet: true),
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
                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                          child: CustomRoundedInput(
                            isTitle: false,
                            controller: state.searchController,
                            maxLines: 1,
                            hintText: PlaceOrderConstants.searchDeals,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 4.w),
                            onChanged: (value) {
                              BlocProvider.of<PlaceOrderBloc>(context)
                                  .add(PlaceOrderEvent.onSearchDeals(value));
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
                                    dealName:
                                        state.searchedDeals[index].dealName,
                                    currencyCode:
                                        state.searchedDeals[index].currencyCode,
                                    actualPrice:
                                        state.searchedDeals[index].actualPrice,
                                    assetImage:
                                        state.searchedDeals[index].assetImage,
                                    discountedPrice: state
                                        .searchedDeals[index].discountedPrice,
                                    quantity:
                                        state.searchedDeals[index].quantity,
                                    increment: () {
                                      context.read<PlaceOrderBloc>().add(
                                          PlaceOrderEvent
                                              .onIncrementDealQuantity(
                                                  productId: state
                                                      .searchedDeals[index]
                                                      .productId));
                                    },
                                    decrement: () {
                                      context.read<PlaceOrderBloc>().add(
                                          PlaceOrderEvent
                                              .onDecrementDealQuantity(
                                                  productId: state
                                                      .searchedDeals[index]
                                                      .productId));
                                    });
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 3.w,
                                );
                              },
                              itemCount: state.searchedDeals.length),
                        )
                      ],
                    ),
                  )
              ]),
            ),
          ),
        );
      },
    );
  }
}
