import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../application/cart/cart_bloc.dart';
import '../../application/place_order/place_order_bloc.dart';
import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../core/country_picker.dart';
import '../core/custom_app_bar.dart';
import '../core/custom_button.dart';
import '../core/custom_text_field.dart';
import '../core/numeric_keyboard.dart';
import 'widgets/place_order_deal_widget.dart';

class CartScreen extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;
  List<Deal> selectedDeals;
  CartScreen(
      {super.key,
      required this.zoomDrawerController,
      required this.selectedDeals});

  @override
  Widget build(BuildContext context) {
    String serverUrl = AppConfig.of(context)!.serverUrl;

    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => CartBloc(CartState.initial(
          selectedDeals: selectedDeals,
          appStateNotifier: appStateNotifier,
          serverUrl: serverUrl,
          zoomDrawerController: zoomDrawerController)),
      child: CartScreenConsumer(),
    );
  }
}

class CartScreenConsumer extends StatelessWidget {
  CartScreenConsumer({super.key});
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
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
                    width: 16.w,
                  )),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text('Checkout',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          elevation: 0,
        ),
        body: ModalProgressHUD(
          inAsyncCall: false,
          child: state.selectedDeals.isEmpty? Center(child: Text('Cart is Empty'),)   :  Column(
            children: [
              SizedBox(height: 2.h),
              Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    itemBuilder: (context, index) {
                      return PlaceOrderDealWidget(
                          dealName: state.selectedDeals[index].dealName,
                          currencyCode: state.selectedDeals[index].currencyCode,
                          actualPrice: state.selectedDeals[index].actualPrice,
                          assetImage: state.selectedDeals[index].assetImage,
                          discountedPrice:
                              state.selectedDeals[index].discountedPrice,
                          quantity: state.selectedDeals[index].quantity,
                          showAdd: false,
                          increment: () {},
                          decrement: () {});
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 3.w,
                      );
                    },
                    itemCount: state.selectedDeals.length),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: PrimaryTextField(
                  focusNode: focusNode,
                  inputWithLabel: true,
                  readOnly: true,
                  onTap: () {
                    focusNode.unfocus();
                    context
                        .read<CartBloc>()
                        .add(const CartEvent.toggleKeyboard());
                  },
                  labelText: AuthConstants.customerPhoneNumber,
                  controller: state.phoneNumberController,
                  hintText: MyProfileConstants.hintPhoneNumber,
                  keyboardType: TextInputType.phone,
                  // inputFormatters: [],
                  validator: (value) {
                    final phoneNumber = value!;
                    if (phoneNumber.isEmpty) {
                      return ErrorConstants.requiredError;
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
                        builder: (context) =>
                            const CountryPicker(selectedCountryDialCode: '+60'),
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
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.secondary),
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
                        if (state.phoneNumberController.text.length >= 15) {
                          return;
                        }
                        state.phoneNumberController.text =
                            state.phoneNumberController.text + value;
                        context.read<CartBloc>().add(
                            CartEvent.emitFromAnywhere(
                                state:
                                    state.copyWith(noUse: !state.noUse)));
                      },
                      mainAxisAlignment: MainAxisAlignment.center,
                      leftIcon: Image.asset(
                        AssetConstants.backClear,
                      ),
                      rightIcon: Image.asset(
                        AssetConstants.check,
                      ),
                      leftButtonFn: () {
                        if (state.phoneNumberController.text.isNotEmpty) {
                          state.phoneNumberController.text =
                              state.phoneNumberController.text.substring(
                                  0,
                                  state.phoneNumberController.text.length -
                                      1);
                          context.read<CartBloc>().add(
                              CartEvent.emitFromAnywhere(
                                  state:
                                      state.copyWith(noUse: !state.noUse)));
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
                  padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.5),
                  child: PrimaryButton(
                      width: 60.w,
                      btnText: 'Continue',
                      textFontSize: 12.sp,
                      onPressedBtn: () {
                        context.read<CartBloc>().add(
                              CartEvent.emitFromAnywhere(
                                state: state.copyWith(),
                              ),
                            );
                      }),
                ),
            ],
          ),
        ),
      );
    });
  }
}
