import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

import '../../domain/constants/string_constants.dart';

import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../domain/services/navigation_service/routers/route_names.dart';

import '../core/country_picker.dart';
import '../core/custom_app_bar.dart';
import '../core/custom_button.dart';
import '../core/custom_text_field.dart';

import 'getting_started_screen.dart';

class LoginScreen extends StatelessWidget {
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
                backgroundColor:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
                appBar: const CustomAppBar().wrapWithPreferredSize,
                body: Form(
                  // key: state.formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            AuthConstants.login,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                              '${AuthConstants.askMobileNumber} ${(AuthConstants.login).toLowerCase()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.7))),
                          SizedBox(
                            height: 5.h,
                          ),
                          PrimaryTextField(
                            inputWithLabel: true,
                            labelText: AuthConstants.askMobileNumber,
                            // controller: state.phoneNumberController,
                            hintText: AuthConstants.phoneNumberHint,
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
                                  builder: (context) => const CountryPicker(
                                      selectedCountryDialCode: '+91'),
                                ).then((value) {
                                  if (value != null) {
                                    // context.read<RequestOtpBloc>().add(
                                    //     RequestOtpEvent.updateCountryCode(
                                    //         selectedCountry: value));
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
                                        "assets/flags/in.png",

                                        // "assets/flags/${state.selectedCountry["locale"].toString().toLowerCase()}.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 1.w),
                                  Text(
                                    '91',
                                    // state.selectedCountry['dial_code']
                                    //     .toString(),
                                    textScaleFactor: 1.0,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
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
                          SizedBox(
                            height: 7.h,
                          ),
                          PrimaryButton(
                              btnText: AuthConstants.login,
                              width: 100.w,
                              onPressedBtn: () {
                                navigator<NavigationService>()
                                    .navigateTo(AuthRoutes.verifyOtpRoute);
                                // if (state.formKey.currentState!
                                //     .validate()) {
                                //   // context
                                //   //     .read<RequestOtpBloc>()
                                //   //     .add(const RequestOtpEvent.login());
                                // }
                              }),
                          const Spacer(),
                          Center(
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: AuthConstants.donNotHaveAccount,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  TextSpan(
                                      text: AuthConstants.register,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          navigator<NavigationService>()
                                              .navigateTo(
                                                  AuthRoutes.registerRoute);
                                        },
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ))
                                ])),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                        ]),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
