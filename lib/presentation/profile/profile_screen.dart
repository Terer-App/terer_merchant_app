import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';
import 'package:terer_merchant/application/profile/profile_bloc.dart';
import 'package:terer_merchant/domain/core/configs/app_config.dart';
import 'package:terer_merchant/domain/services/navigation_service/routers/route_names.dart';
import 'package:terer_merchant/presentation/core/custom_toast.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';

import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../domain/services/storage_service/auth_service.dart';
import '../core/custom_alert.dart';
import '../core/custom_rounded_textfield.dart';
import '../core/custom_text_field.dart';

class ProfileScreen extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;

  const ProfileScreen({super.key, required this.zoomDrawerController});

  @override
  Widget build(BuildContext context) {
    String serverUrl = AppConfig.of(context)!.serverUrl;

    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => ProfileBloc(ProfileState.initial(
        zoomDrawerController: zoomDrawerController,
        appStateNotifier: appStateNotifier,
        serverUrl: serverUrl,
      ))
        ..add(const ProfileEvent.init()),
      child: const ProfileConsumer(),
    );
  }
}

class ProfileConsumer extends StatelessWidget {
  const ProfileConsumer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) async {
        if (state.isSuccess) {
        } else if (state.isFailed) {
          if (state.showMessage.isNotEmpty) {
            CustomToast.showToast(
              msg: state.showMessage,
            );
          }

          context.read<ProfileBloc>().add(
                ProfileEvent.emitFromAnywhere(
                  state: state.copyWith(
                    isFailed: false,
                    showMessage: '',
                  ),
                ),
              );
        }

        if (state.isAccountDeleted) {
          Provider.of<AppStateNotifier>(context, listen: false)
              .updateAuthState(isAuthorized: false, profile: null);

          await AuthTokenService.clearBox();

          Future.delayed(const Duration(milliseconds: 100), () {
            context.read<ProfileBloc>().add(
                  ProfileEvent.emitFromAnywhere(
                    state: state.copyWith(
                      isAccountDeleted: false,
                      isLoading: false,
                    ),
                  ),
                );

            navigator<NavigationService>().navigateTo(
              AuthRoutes.gettingStartedRoute,
              isClearStack: true,
            );
          });
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
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
              title: Text(AppConstants.myProfileTitle,
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
                  height: 2.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.w, horizontal: 8.w),
                      child: Form(
                        // key: state.formKey,
                        child: Column(
                          children: [
                            //first name
                            CustomRoundedInput(
                              isTitle: true,
                              enabled: false,
                              controller: state.shopNameController,
                              titleText: MyProfileConstants.shopName,
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
                            //last name
                            CustomRoundedInput(
                              isTitle: true,
                              enabled: false,
                              controller: state.shopAddressController,
                              maxLines: 2,
                              titleText: MyProfileConstants.shopAddress,
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
                            //email
                            CustomRoundedInput(
                              isTitle: true,
                              enabled: false,
                              controller: state.shopEmailController,
                              titleText: MyProfileConstants.shopEmail,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 4.w),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),

                            // phone number

                            PrimaryTextField(
                              enabled: false,
                              inputWithLabel: true,
                              controller: state.shopPhoneController,
                              labelColor:
                                  Theme.of(context).colorScheme.secondary,
                              labelText: MyProfileConstants.shopPhone,
                              inputBorderRadius: 25,
                              hintText: MyProfileConstants.hintPhoneNumber,
                              keyboardType: TextInputType.phone,
                              customContentPadding: EdgeInsets.symmetric(
                                  vertical: 2.h, horizontal: 4.w),
                              validator: (value) {
                                final phoneNumber = value!;
                                if (phoneNumber.isEmpty) {
                                  return ErrorConstants.requiredError;
                                }
                                return null;
                              },
                              prefixWidget: GestureDetector(
                                onTap: null,
                                child: Container(
                                  width: 20.w,
                                  height: 6.9.h,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(25),
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

                                          // "assets/flags/${state.selectedCountry['locale'].toString().toLowerCase()}.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 1.w),
                                    Text(
                                      '+91',
                                      // state.selectedCountry['dial_code'].toString(),
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

                            SizedBox(height: 6.h),
                            RichText(
                              text: TextSpan(
                                  text: AppConstants.deleteAccount,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    letterSpacing: 0.2,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      showDialog(
                                          barrierColor:
                                              Colors.white.withOpacity(0.5),
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) {
                                            return CustomAlert(
                                              // on press no
                                              onPressed2: () {
                                                navigator<NavigationService>()
                                                    .goBack();
                                              },

                                              button2Text: AppConstants.noText
                                                  .toUpperCase(),
                                              // on press yes
                                              onPressed: () async {
                                                navigator<NavigationService>()
                                                    .goBack(
                                                  responseObject: true,
                                                );
                                              },
                                              isExtraBtn: true,
                                              makeTextBold: true,
                                              buttonText: AppConstants.yesText
                                                  .toUpperCase(),
                                              content: MyProfileConstants
                                                  .deleteYourAccount,
                                              svgUrl: AssetConstants.warning,
                                            );
                                          }).then((value) {
                                        if (value != null) {
                                          context.read<ProfileBloc>().add(
                                              const ProfileEvent
                                                  .onDeleteAccount());
                                        }
                                      });
                                    }),
                            ),

                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              MyProfileConstants.changeInfo,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                            SizedBox(
                              height: 1 == 0 ? 35.h : 5.h,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
