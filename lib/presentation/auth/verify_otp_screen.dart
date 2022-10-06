import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:terer_merchant/domain/core/configs/injection.dart';
import 'package:terer_merchant/domain/services/navigation_service/navigation_service.dart';
import 'package:terer_merchant/domain/services/navigation_service/routers/route_names.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../core/custom_app_bar.dart';
import '../core/custom_button.dart';
import '../core/numeric_keyboard.dart';
import 'getting_started_screen.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ModalProgressHUD(
            // inAsyncCall: state.isLoading,
            inAsyncCall: false,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Stack(children: [
                const GettingStartedScreen(
                  asBackground: true,
                ),
                SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Scaffold(
                      backgroundColor: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.9),
                      appBar: const CustomAppBar().wrapWithPreferredSize,
                      body: Form(
                        // key: state.formKey,
                        child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                AuthConstants.verification,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(AuthConstants.enterOtpWeJustSent,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.7))),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                AuthConstants.otpCode,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              PinCodeTextField(
                                length: 6,
                                obscureText: false,
                                readOnly: true,
                                animationType: AnimationType.fade,
                                keyboardType: TextInputType.number,
                                pinTheme: PinTheme(
                                  activeColor: Colors.white.withAlpha(10),
                                  selectedFillColor: Colors.black.withAlpha(30),
                                  inactiveFillColor: Colors.black.withAlpha(10),
                                  inactiveColor: Colors.black.withAlpha(10),
                                  activeFillColor: Colors.black.withAlpha(10),
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 50,
                                  fieldWidth: 40,
                                ),
                                cursorColor: Colors.black,
                                cursorHeight: 20,
                                validator: (value) {
                                  // if (!state.validateForm) {
                                  //   return null;
                                  // }
                                  if (value!.isEmpty) {
                                    return ErrorConstants.requiredError;
                                  } else if (value.length != 6) {
                                    return ErrorConstants.otpTooShort;
                                  }
                                  return null;
                                },
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                enableActiveFill: true,
                                // controller: state.otpController,
                                onCompleted: (v) {},
                                onChanged: (value) {},
                                onTap: () {
                                  // context.read<VerifyOtpBloc>().add(
                                  //     const VerifyOtpEvent
                                  //         .toggleKeyboard());
                                },
                                beforeTextPaste: (text) {
                                  return true;
                                },
                                appContext: context,
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              SecondaryButton(
                                  btnText: AuthConstants.done,
                                  onPressedBtn: () {
                                    navigator<NavigationService>().navigateTo(
                                        CoreRoute.disputeReportRoute);
                                    // if (state.formKey.currentState!
                                    //     .validate()) {
                                    //   context.read<VerifyOtpBloc>().add(
                                    //       const VerifyOtpEvent.verifyOtp());
                                    // }
                                  }),
                              SizedBox(
                                height: 3.h,
                              ),
                              Center(
                                child: MouseRegion(
                                  cursor: 1 == 0
                                      //  state.canResend
                                      ? SystemMouseCursors.click
                                      : SystemMouseCursors.wait,
                                  child: GestureDetector(
                                    onTap: 1 == 0
                                        // state.canResend
                                        ? () {
                                            // context
                                            //     .read<VerifyOtpBloc>()
                                            //     .add(const VerifyOtpEvent
                                            //             .resendOtp(
                                            //         isInit: false));
                                          }
                                        : null,
                                    child: Text(
                                      1 == 1
                                          ? AuthConstants.resendOtpRequest
                                          : '${AuthConstants.resendOtp} (${2})',

                                      // : '${AuthConstants.resendOtp} (${state.timeLeft  })',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    )),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: 1 == 1
                      ? Container(
                          // height: 100.h,
                          padding: EdgeInsets.only(top: 100.h - (25.h + 8.w)),
                          child: NumericKeyboard(
                            onKeyboardTap: (value) {
                              // if (state.otpController.text.length >= 6) {
                              //   return;
                              // }
                              // state.otpController.text =
                              //     state.otpController.text + value;
                              // context.read<VerifyOtpBloc>().add(
                              //     VerifyOtpEvent.emitFromAnyWhere(
                              //         state: state.copyWith(
                              //             noUse: !state.noUse)));
                            },
                            mainAxisAlignment: MainAxisAlignment.center,
                            leftIcon: Image.asset(
                              AssetConstants.backClear,
                            ),
                            rightIcon: Image.asset(
                              AssetConstants.check,
                            ),
                            leftButtonFn: () {
                              // if (state.otpController.text.isNotEmpty) {
                              //   state.otpController.text =
                              //       state.otpController.text.substring(
                              //           0,
                              //           state.otpController.text.length -
                              //               1);
                              //   context.read<VerifyOtpBloc>().add(
                              //       VerifyOtpEvent.emitFromAnyWhere(
                              //           state: state.copyWith(
                              //               noUse: !state.noUse)));
                              // }
                            },
                            rightButtonFn: () {
                              // context.read<VerifyOtpBloc>().add(
                              //     const VerifyOtpEvent.toggleKeyboard());
                            },
                          ),
                        )
                      : null,
                )
              ]),
            )));
  }
}
