import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';
import '../../application/profile/profile_bloc.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/extensions/string_extensions.dart';
import '../../domain/services/navigation_service/routers/route_names.dart';
import '../core/custom_toast.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';

import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../domain/services/storage_service/auth_service.dart';
import '../core/custom_alert.dart';
import '../core/custom_rounded_textfield.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String serverUrl = AppConfig.of(context)!.serverUrl;

    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => ProfileBloc(ProfileState.initial(
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
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              toolbarHeight: 8.h,
              backgroundColor: Theme.of(context).primaryColor,
              centerTitle: true,
              leading: IconButton(
                onPressed: () async {
                  ZoomDrawer.of(context)!.toggle();
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
                              controller: state.firstNameController,
                              titleText: MyProfileConstants.name,
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
                              controller: state.brandNameController,
                              titleText: MyProfileConstants.brandName,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 4.w),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            //email
                            CustomRoundedInput(
                              isTitle: true,
                              enabled: false,
                              controller: state.emailController,
                              titleText: MyProfileConstants.email,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 4.w),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            //email
                            CustomRoundedInput(
                              isTitle: true,
                              enabled: false,
                              controller: TextEditingController(
                                  text: state.profile?.role
                                      .split('_')
                                      .join(' ')
                                      .toLowerCase()
                                      .capitalizeCamel),
                              titleText: MyProfileConstants.access,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 4.w),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            // phone number
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
                                              bothBtnHeight: 6.5.h,
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
