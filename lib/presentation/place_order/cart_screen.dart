import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../core/custom_alert.dart';
import 'widgets/user_details_bottomsheet.dart';
import '../../infrastructure/dtos/place_order/outlet_product/outlet_product_dto.dart';

import '../../application/cart/cart_bloc.dart';
import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../domain/services/navigation_service/routers/route_names.dart';
import '../core/country_picker.dart';
import '../core/custom_button.dart';
import '../core/custom_text_field.dart';
import '../core/numeric_keyboard.dart';
import 'widgets/place_order_deal_widget.dart';

class CartScreen extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;
  final List<OutletProductDto> addedProducts;
  const CartScreen(
      {super.key,
      required this.zoomDrawerController,
      required this.addedProducts});

  @override
  Widget build(BuildContext context) {
    String apiUrl = AppConfig.of(context)!.apiUrl;
    String serverUrl = AppConfig.of(context)!.serverUrl;

    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => CartBloc(CartState.initial(
          addedProducts: addedProducts,
          appStateNotifier: appStateNotifier,
          apiUrl: apiUrl,
          serverUrl: serverUrl,
          zoomDrawerController: zoomDrawerController)),
      child: const CartScreenConsumer(),
    );
  }
}

class CartScreenConsumer extends StatelessWidget {
  const CartScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(listener: (context, state) async {
      if (state.showBottomSheet) {
        await showModalBottomSheet(
          context: context,
          isDismissible: false,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return UserDetailsBottomSheet(
              zoomDrawerController: state.zoomDrawerController,
              selectedCountry: state.selectedCountry,
              phoneNumber: state.phoneNumberController.text,
              addedProducts: state.addedProducts,
            );
          },
        ).then((value) {
          context.read<CartBloc>().add(CartEvent.emitFromAnywhere(
              state: state.copyWith(
                  isSuccess: false,
                  isFailed: false,
                  isLoading: false,
                  showBottomSheet: false)));
        });
      }
      if (state.isSuccess) {
        showDialog(
            barrierColor: Colors.white.withOpacity(0.5),
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return WillPopScope(
                onWillPop: () async => false,
                child: CustomAlert(
                  onPressed: () async {
                    navigator<NavigationService>().goBack();
                    navigator<NavigationService>()
                        .navigateTo(CoreRoutes.homeRoute, isClearStack: true);
                  },
                  isExtraBtn: false,
                  makeTextBold: true,
                  reverseTextColor: true,
                  buttonText: AppConstants.backToHome,
                  bothBtnHeight: 40,
                  content: CartConstants.collectPaymentText,
                  svgUrl: AssetConstants.successSvg,
                ),
              );
            }).then((value) {});
      } else if (state.isFailed) {
        if (state.showMessage.isNotEmpty) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.showMessage),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: const Duration(seconds: 2),
          ));

          context.read<CartBloc>().add(CartEvent.emitFromAnywhere(
              state: state.copyWith(isFailed: false, showMessage: '')));
        }
      }
    }, builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0))),
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 8.h,
          leadingWidth: 20.w,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 5.w,
            ),
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    navigator<NavigationService>().goBack();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: const CircleBorder(),
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: SvgPicture.asset(
                    AssetConstants.backSvg,
                    width: 14.w,
                  )),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text(CartConstants.checkout,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          elevation: 0,
        ),
        body: ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: state.addedProducts.isEmpty
              ? const Center(
                  child: Text(CartConstants.cartIsEmpty),
                )
              : Column(
                  children: [
                    SizedBox(height: 2.h),
                    Expanded(
                      child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          itemBuilder: (context, index) {
                            return PlaceOrderDealWidget(
                                dealName: state.addedProducts[index].title,
                                currencyCode: state
                                    .addedProducts[index]
                                    .compareAtPriceRange
                                    .maxVariantPrice
                                    .currencyCode,
                                actualPrice: calculatePrice(
                                    state
                                        .addedProducts[index]
                                        .compareAtPriceRange
                                        .maxVariantPrice
                                        .amount,
                                    state.addedProducts[index].quantity),
                                assetImage: state
                                    .addedProducts[index].featuredImage.url,
                                discountedPrice: calculatePrice(
                                    state.addedProducts[index].priceRange
                                        .maxVariantPrice.amount,
                                    state.addedProducts[index].quantity),
                                quantity: state.addedProducts[index].quantity,
                                showAdd: false,
                                increment: () {},
                                decrement: () {});
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 3.w,
                            );
                          },
                          itemCount: state.addedProducts.length),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: PrimaryTextField(
                        focusNode: state.focusNode,
                        inputWithLabel: true,
                        readOnly: true,
                        onTap: () {
                          state.focusNode.unfocus();
                          context
                              .read<CartBloc>()
                              .add(const CartEvent.toggleKeyboard());
                        },
                        labelText: AuthConstants.customerPhoneNumber,
                        controller: state.phoneNumberController,
                        hintText: MyProfileConstants.hintPhoneNumber,
                        keyboardType: TextInputType.phone,
                        errorText: state.errorPhoneNumber.isNotEmpty
                            ? state.errorPhoneNumber
                            : null,
                        // inputFormatters: [],
                        validator: (value) {
                          final phoneNumber = value!;
                          if (phoneNumber.isEmpty) {
                            context.read<CartBloc>().add(
                                CartEvent.emitFromAnywhere(
                                    state: state.copyWith(
                                        errorPhoneNumber:
                                            ErrorConstants.requiredError)));
                          } else {
                            context.read<CartBloc>().add(
                                CartEvent.emitFromAnywhere(
                                    state:
                                        state.copyWith(errorPhoneNumber: '')));
                          }
                          return null;
                        },

                        prefixWidget: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => const CountryPicker(
                                  selectedCountryDialCode: '+60'),
                            ).then((value) {
                              if (value != null) {
                                context.read<CartBloc>().add(
                                    CartEvent.updateCountryCode(
                                        selectedCountry: value));
                              }
                            });
                          },
                          child: Container(
                            width: 20.w,
                            height: 48,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer
                                    .withAlpha(140),
                                width: 1,
                              ),
                            ),
                            child: Row(children: [
                              SizedBox(
                                width: 1.w,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(3.sp),
                                child: SizedBox(
                                  height: 15.sp,
                                  width: 20.sp,
                                  child: Image.asset(
                                    "assets/flags/${state.selectedCountry["locale"].toString().toLowerCase()}.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(width: 1.w),
                              Text(
                                state.selectedCountry['dial_code'].toString(),
                                textScaleFactor: 1.0,
                                softWrap: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: state.showKeyboard
                          ? NumericKeyboard(
                              onKeyboardTap: (value) {
                                if (state.phoneNumberController.text.length >=
                                    15) {
                                  return;
                                }
                                state.phoneNumberController.text =
                                    state.phoneNumberController.text + value;
                                context.read<CartBloc>().add(
                                    CartEvent.emitFromAnywhere(
                                        state: state.copyWith(
                                            noUse: !state.noUse)));
                              },
                              mainAxisAlignment: MainAxisAlignment.center,
                              leftIcon: Image.asset(
                                AssetConstants.backClear,
                              ),
                              rightIcon: Image.asset(
                                AssetConstants.check,
                              ),
                              leftButtonFn: () {
                                if (state
                                    .phoneNumberController.text.isNotEmpty) {
                                  state.phoneNumberController.text = state
                                      .phoneNumberController.text
                                      .substring(
                                          0,
                                          state.phoneNumberController.text
                                                  .length -
                                              1);
                                  context.read<CartBloc>().add(
                                      CartEvent.emitFromAnywhere(
                                          state: state.copyWith(
                                              noUse: !state.noUse)));
                                }
                              },
                              rightButtonFn: () {
                                context
                                    .read<CartBloc>()
                                    .add(const CartEvent.toggleKeyboard());
                              },
                            )
                          : null,
                    ),
                    if (!state.showKeyboard)
                      Padding(
                        padding: EdgeInsets.only(
                            top: 1.h, left: 1.h, right: 1.h, bottom: 5.h),
                        child: PrimaryButton(
                            width: 60.w,
                            btnText: CartConstants.placeOrder,
                            textFontSize: 12.sp,
                            onPressedBtn: () {
                              if (state.phoneNumberController.text.isEmpty) {
                                context.read<CartBloc>().add(
                                    CartEvent.emitFromAnywhere(
                                        state: state.copyWith(
                                            errorPhoneNumber:
                                                ErrorConstants.requiredError)));
                              } else {
                                final parentContext = context;
                                showDialog(
                                    barrierColor: Colors.white.withOpacity(0.5),
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return WillPopScope(
                                        onWillPop: () async => false,
                                        child: CustomAlert(
                                          // on press no
                                          onPressed2: () {
                                            navigator<NavigationService>()
                                                .goBack();
                                          },
                                          customWidget: Text(
                                            CartConstants.confirmDetails,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          button2Text: AppConstants.back,
                                          reverseColor2Btn: true,
                                          // on press yes
                                          onPressed: () async {
                                            navigator<NavigationService>()
                                                .goBack();
                                            parentContext.read<CartBloc>().add(
                                                const CartEvent
                                                    .onUserExistsByNumber());
                                          },
                                          isExtraBtn: true,
                                          makeTextBold: true,
                                          buttonText: AppConstants.confirm,
                                          bothBtnHeight: 40,
                                          content: state
                                                  .selectedCountry['dial_code']
                                                  .toString() +
                                              state.phoneNumberController.text,
                                          svgUrl: AssetConstants.warning,
                                        ),
                                      );
                                    }).then((value) {});
                              }
                            }),
                      ),
                  ],
                ),
        ),
      );
    });
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
