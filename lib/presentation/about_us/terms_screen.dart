import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  primary:
                      Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
                  onPrimary: Theme.of(context).colorScheme.primary,
                ),
                child: SvgPicture.asset(
                  AssetConstants.backSvg,
                  width: 16.w,
                )),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(AppConstants.termsTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                )),
            height: 2.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
                child: Column(
                  children: [
                    Image.asset(
                      AssetConstants.logoImage,
                      width: 50.w,
                    ),
                    // age policy
                    SizedBox(
                      height: 3.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: TermsConditionsConstants.agePolicy,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: TermsConditionsConstants.agePolicyPara,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),

                    // age verification

                    SizedBox(
                      height: 3.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: TermsConditionsConstants.ageVerification,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: TermsConditionsConstants.ageVerificationPara,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),

                    // billing validation

                    SizedBox(
                      height: 3.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: TermsConditionsConstants.billingValidation,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: TermsConditionsConstants.billingValidationPara,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),

                    // billing validation

                    SizedBox(
                      height: 3.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: TermsConditionsConstants.billingValidation,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: TermsConditionsConstants.billingValidationPara,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),
                    //  credit card validation
                    SizedBox(
                      height: 3.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: TermsConditionsConstants.creditCardValidation,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text:
                              TermsConditionsConstants.creditCardValidationPara,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),

                    //  refusal and limit

                    SizedBox(
                      height: 3.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: TermsConditionsConstants.refusalOrLimit,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: TermsConditionsConstants.refusalOrLimitPara,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: const CustomNavbar(),
    );
  }
}
