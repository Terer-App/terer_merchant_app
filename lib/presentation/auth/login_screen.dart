import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sizer/sizer.dart';
import 'package:terer_merchant/application/login/login_bloc.dart';
import 'package:terer_merchant/domain/core/configs/app_config.dart';
import 'package:terer_merchant/presentation/core/custom_toast.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';

import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';

import '../core/custom_button.dart';

import '../core/custom_rounded_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String merchantApi = AppConfig.of(context)!.merchantApi;
    String serverUrl = AppConfig.of(context)!.serverUrl;

    return BlocProvider(
      create: (context) => LoginBloc(LoginState.initial(
        merchantApi: merchantApi,
        serverUrl: serverUrl,
      )),
      child: const LoginConsumer(),
    );
  }
}

class LoginConsumer extends StatelessWidget {
  const LoginConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.read<LoginBloc>().add(LoginEvent.emitFromAnywhere(
              state: state.copyWith(isFailed: false, showMessage: '')));
        } else if (state.isFailed) {
          if (state.showMessage.isNotEmpty) {
            CustomToast.showToast(
              msg: state.showMessage,
            );
          }

          context.read<LoginBloc>().add(LoginEvent.emitFromAnywhere(
              state: state.copyWith(isFailed: false, showMessage: '')));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white.withOpacity(0.85),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigator<NavigationService>().goBack();
                      },
                      child: CircleAvatar(
                        radius: 7.w,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset(
                          AssetConstants.backSvg,
                          width: 7.w,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Form(
                    key: state.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AuthConstants.login,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        Text(
                          AuthConstants.loginInfo,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        CustomRoundedInput(
                          isTitle: true,
                          controller: state.userNameController,
                          labelTextStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 15.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    fontWeight: FontWeight.w700,
                                  ),
                          boxDecorationContainer: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 4),
                                color: Colors.grey,
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          titleText: AuthConstants.userName,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 2.w,
                          ),
                          validator: (val) {
                            if (!state.validateForm) return null;

                            if (val == null || val.isEmpty) {
                              return ErrorConstants.requiredError;
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        CustomRoundedInput(
                          isTitle: true,
                          controller: state.passwordController,
                          labelTextStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 15.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    fontWeight: FontWeight.w700,
                                  ),
                          boxDecorationContainer: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 4),
                                color: Colors.grey,
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          titleText: AuthConstants.password,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 2.w,
                          ),
                          validator: (val) {
                            if (!state.validateForm) return null;

                            if (val == null || val.isEmpty) {
                              return ErrorConstants.requiredError;
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Center(
                          child: PrimaryButton(
                            btnText: AuthConstants.login,
                            width: 75.w,
                            onPressedBtn: () {
                              FocusScope.of(context).unfocus();
                              context
                                  .read<LoginBloc>()
                                  .add(const LoginEvent.onLogin());
                            },
                          ),
                        ),
                      ],
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
