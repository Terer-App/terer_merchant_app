import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../application/dispute_report/dispute_report_bloc.dart';
import '../../domain/services/navigation_service/routers/route_names.dart';
import '../core/custom_toast.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../core/custom_alert.dart';
import '../core/custom_button.dart';
import '../core/custom_rounded_textfield.dart';

class DisputeReportScreen extends StatelessWidget {
  const DisputeReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    String serverUrl = AppConfig.of(context)!.serverUrl;
    return BlocProvider(
      create: (context) => DisputeReportBloc(DisputeReportState.initial(
        appStateNotifier: appStateNotifier,
        serverUrl: serverUrl,
      )),
      child: const DisputeReportConsumer(),
    );
  }
}

class DisputeReportConsumer extends StatelessWidget {
  const DisputeReportConsumer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DisputeReportBloc, DisputeReportState>(
      listener: (context, state) {
        if (state.isSuccess) {
          showDialog(
              barrierColor: Colors.white.withOpacity(0.5),
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return CustomAlert(
                  onPressed: () {
                    navigator<NavigationService>().goBack();
                  },
                  isReport: true,
                  makeTextBold: true,
                  buttonText: AppConstants.backToHome,
                  content: DisputeReportConstants.thankYouForReporting,
                  svgUrl: AssetConstants.successSvg,
                );
              }).then((value) {
            context.read<DisputeReportBloc>().add(
                DisputeReportEvent.emitFromAnywhere(
                    state: state.copyWith(isSuccess: false, showMessage: '')));
            navigator<NavigationService>()
                .navigateTo(CoreRoutes.homeRoute, isClearStack: true);
          });
        } else if (state.isFailed) {
          if (state.showMessage.isNotEmpty) {
            CustomToast.showToast(
                msg: state.showMessage, toastGravity: ToastGravity.BOTTOM);
          }

          context.read<DisputeReportBloc>().add(
              DisputeReportEvent.emitFromAnywhere(
                  state: state.copyWith(isFailed: false, showMessage: '')));
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ModalProgressHUD(
            inAsyncCall: state.isLoading,
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
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withOpacity(0.7),
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        child: SvgPicture.asset(
                          AssetConstants.backSvg,
                          width: 16.w,
                        )),
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(AppConstants.disputeReportTitle,
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
                    child: Form(
                      key: state.formKey,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.w, horizontal: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DisputeReportConstants.tellUsAboutReport,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              CustomRoundedInput(
                                maxLines: 5,
                                validator: (newVal) {
                                  if (!state.validateForm) return null;

                                  if (newVal == null || newVal.isEmpty) {
                                    return ErrorConstants.requiredError;
                                  }

                                  return null;
                                },
                                controller: state.messageController,
                                borderSide: BorderSide(
                                  width: 1,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                hintText:
                                    DisputeReportConstants.hintWriteReport,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 5.w),
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              Text(
                                DisputeReportConstants.attachFile,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              InkWell(
                                onTap: state.attachImagePath.isEmpty
                                    ? () {
                                        context.read<DisputeReportBloc>().add(
                                            const DisputeReportEvent
                                                .attachFile());
                                      }
                                    : null,
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
                                  child: state.attachImagePath.isNotEmpty
                                      ? Stack(
                                          children: [
                                            Center(
                                              child: Image.file(
                                                File(state.attachImagePath),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                              right: 10,
                                              top: 10,
                                              child: InkWell(
                                                onTap: () {
                                                  context
                                                      .read<DisputeReportBloc>()
                                                      .add(
                                                        DisputeReportEvent
                                                            .emitFromAnywhere(
                                                          state: state.copyWith(
                                                              attachImageFile:
                                                                  null,
                                                              attachImagePath:
                                                                  ''),
                                                        ),
                                                      );
                                                },
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
                                  btnBorderRadius: 7.w,
                                  height: 8.h,
                                  onPressedBtn: () {
                                    FocusScope.of(context).unfocus();

                                    context.read<DisputeReportBloc>().add(
                                          const DisputeReportEvent.onSubmit(),
                                        );
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
      },
    );
  }
}
