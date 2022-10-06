import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../core/custom_alert.dart';
import '../core/custom_button.dart';
import '../core/custom_rounded_textfield.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ModalProgressHUD(
        inAsyncCall: false,
        child: Scaffold(
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
                      primary: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(0.7),
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
              child: Text(AppConstants.contactUsTitle,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
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
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.w, horizontal: 5.w),
                    child: Form(
                      // key: state.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5.w,
                          ),
                          CustomRoundedInput(
                            isTitle: true,
                            readOnly: true,
                            enabled: false,
                            titleText: ContactUsConstants.name,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 4.w),
                            validator: (newVal) {
                              if (newVal == null || newVal.isEmpty) {
                                return ErrorConstants.requiredError;
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          CustomRoundedInput(
                              isTitle: true,
                              readOnly: true,
                              enabled: false,
                              titleText: ContactUsConstants.emailAddress,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 4.w),
                              validator: (newVal) {
                                return null;
                              }),
                          SizedBox(
                            height: 5.w,
                          ),
                          CustomRoundedInput(
                            maxLines: 5,
                            hintText: ContactUsConstants.hintWriteMsg,
                            isTitle: true,
                            titleText: ContactUsConstants.enterMsg,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.w),
                            validator: (newVal) {
                              if (newVal == null || newVal.isEmpty) {
                                return ErrorConstants.requiredError;
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Text(
                            ContactUsConstants.attachFile,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          InkWell(
                            onTap: 1 == 0 ? () {} : null,
                            child: Container(
                              height: 40.w,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.2),
                              ),
                              child: 1 == 0
                                  ? Stack(
                                      children: [
                                        const Center(
                                            child:
                                                1 == 1 ? SizedBox() : SizedBox()
                                            //  Image.file(
                                            //     File(state
                                            //         .attachImagePath),
                                            //     fit: BoxFit.cover,
                                            //   ),
                                            ),
                                        Positioned(
                                          right: 10,
                                          top: 10,
                                          child: InkWell(
                                            onTap: () {},
                                            child: CircleAvatar(
                                              backgroundColor: Colors.red,
                                              radius: 15,
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 12.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            AssetConstants.uploadArrowSvg),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        SvgPicture.asset(
                                            AssetConstants.uploadDashSvg),
                                      ],
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          SecondaryButton(
                              btnText: AppConstants.submitText,
                              width: 100.w,
                              height: 8.h,
                              btnBorderRadius: 7.w,
                              onPressedBtn: () {
                                showDialog(
                                    barrierColor: Colors.white.withOpacity(0.5),
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return CustomAlert(
                                        onPressed: () {
                                          navigator<NavigationService>()
                                              .goBack();
                                        },
                                        isReport: true,
                                        makeTextBold: true,
                                        buttonText: 'Back',
                                        content: ContactUsConstants
                                            .thankYouForReporting,
                                        svgUrl: AssetConstants.successSvg,
                                      );
                                    }).then((value) {});
                              }),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
