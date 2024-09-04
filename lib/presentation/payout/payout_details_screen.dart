import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../application/payout/payout_details/payout_details_bloc.dart';
import '../../domain/constants/asset_constants.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/configs/injection.dart';
import '../../domain/services/navigation_service/navigation_service.dart';
import '../../presentation/core/custom_button.dart';

class PayoutDetailsScreen extends StatelessWidget {
  const PayoutDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String serverUrl = AppConfig.of(context)!.serverUrl;
    String apiUrl = AppConfig.of(context)!.apiUrl;
    return BlocProvider(
      create: (context) => PayoutDetailsBloc(
          PayoutDetailsState.initial(serverUrl: serverUrl, apiUrl: apiUrl)),
      child: const PayoutDetailsConsumer(),
    );
  }
}

class PayoutDetailsConsumer extends StatelessWidget {
  const PayoutDetailsConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 8.h,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            navigator<NavigationService>().goBack();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: SvgPicture.asset(
              AssetConstants.backArrowWhite,
            ),
          ),
        ),
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: List.generate(5, (index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'INV NO:',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        Text(
                          'DZ0081',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 4.h,
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.5),
                    ),
                  ],
                );
              }),
            ),
            const Spacer(),
            Center(
              child: PrimaryButton(
                  height: 5.5.h,
                  width: 75.w,
                  btnTextColor: Theme.of(context).primaryColor,
                  bgColor: Theme.of(context).colorScheme.secondary,
                  btnText: 'Send to email',
                  onPressedBtn: () {}),
            ),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }
}
