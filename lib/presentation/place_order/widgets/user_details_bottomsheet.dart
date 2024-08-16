import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../core/custom_alert.dart';

import '../../../application/cart/cart_bloc.dart';
import '../../../domain/constants/asset_constants.dart';
import '../../../domain/constants/string_constants.dart';
import '../../../domain/core/configs/app_config.dart';
import '../../../domain/core/configs/injection.dart';
import '../../../domain/services/navigation_service/navigation_service.dart';
import '../../../domain/services/navigation_service/routers/route_names.dart';
import '../../../infrastructure/dtos/place_order/outlet_product/outlet_product_dto.dart';
import '../../core/custom_button.dart';
import '../../core/custom_text_field.dart';

class UserDetailsBottomSheet extends StatelessWidget {
  const UserDetailsBottomSheet(
      {super.key,
      required this.phoneNumber,
      required this.selectedCountry,
      required this.zoomDrawerController,
      required this.addedProducts});
  final Map<String, dynamic> selectedCountry;
  final String phoneNumber;
  final ZoomDrawerController zoomDrawerController;
  final List<OutletProductDto> addedProducts;

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
          zoomDrawerController: zoomDrawerController))
        ..add(CartEvent.updatePhoneNumber(
          selectedCountry: selectedCountry,
          phoneNumber: phoneNumber,
        )),
      child: const UserDetailsBottomSheetConsumer(),
    );
  }
}

class UserDetailsBottomSheetConsumer extends StatelessWidget {
  const UserDetailsBottomSheetConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state.isSuccess) {
          navigator<NavigationService>().goBack();
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
                    reverseTextColor: true,
                    isExtraBtn: false,
                    makeTextBold: true,
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
      },
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(
              inAsyncCall: state.isLoading,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 5.w, top: 5.h, left: 5.w),
                  child: Column(
                    children: [
                      PrimaryTextField(
                        inputWithLabel: true,
                        keyboardType: TextInputType.emailAddress,
                        controller: state.emailController,
                        onChanged: (_) {
                          EasyDebounce.debounce(
                              'email-debounce', // <-- An ID for this particular debouncer
                              const Duration(
                                  milliseconds:
                                      500), // <-- The debounce duration
                              () => BlocProvider.of<CartBloc>(context).add(
                                  const CartEvent
                                      .onChangeEmailAddress()) // <-- The target method
                              );
                        },
                        isImp: true,
                        errorText: state.errorEmailId.isEmpty
                            ? null
                            : state.errorEmailId,
                        labelText: CartConstants.email,
                        hintText: CartConstants.hintEmail,
                      ),
                      PrimaryTextField(
                        inputWithLabel: true,
                        controller: state.nameController,
                        onChanged: (_) {
                          BlocProvider.of<CartBloc>(context)
                              .add(const CartEvent.onChangeName());
                        },
                        errorText:
                            state.errorName.isEmpty ? null : state.errorName,
                        labelText: CartConstants.name,
                        hintText: CartConstants.hintName,
                      ),
                      const Spacer(),
                      PrimaryButton(
                        btnText: CartConstants.placeOrder,
                        width: 100.w,
                        onPressedBtn: () {
                          context.read<CartBloc>().add(
                              const CartEvent.onPlaceOrder(isNewUser: true));
                        },
                        btnTextColor: Theme.of(context).colorScheme.secondary,
                        bgColor: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      PrimaryButton(
                        btnText: AppConstants.cancel,
                        width: 100.w,
                        onPressedBtn: () {
                          navigator<NavigationService>().goBack(
                            responseObject: 'cancel',
                          );
                        },
                        btnTextColor: Theme.of(context).scaffoldBackgroundColor,
                        bgColor: Colors.red,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
