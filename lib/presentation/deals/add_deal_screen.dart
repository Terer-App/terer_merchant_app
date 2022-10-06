import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../core/custom_button.dart';
import '../core/custom_rounded_textfield.dart';

class AddDealScreen extends StatelessWidget {
  const AddDealScreen({Key? key}) : super(key: key);

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
            centerTitle: true,
            leading: Center(
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
                  child: SvgPicture.asset(AssetConstants.backSvg)),
            ),
            title: Text(DealsConstants.deals,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
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
                height: 10.w,
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
                            titleText: DealsConstants.productName,
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
                            titleText: DealsConstants.originalPrice,
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
                            titleText: DealsConstants.dealPrice,
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
                            titleText: DealsConstants.quantity,
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
                            titleText: DealsConstants.redemptionDuration,
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
                            maxLines: 5,
                            titleText: DealsConstants.aboutDeal,
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
                          SizedBox(
                            height: 5.w,
                          ),
                          Text(
                            DealsConstants.uploadImage,
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
                                            child: 1 == 0
                                                ? SizedBox()

                                                // Image.memory(
                                                //     state.attachImageMemory!,
                                                //     fit: BoxFit.cover,
                                                //   )
                                                : SizedBox()
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
                                        Icon(
                                          Icons.upload_rounded,
                                          size: 50.sp,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                        ),
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
                              onPressedBtn: () {}),
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
