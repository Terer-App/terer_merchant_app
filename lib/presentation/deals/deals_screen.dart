import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:sizer/sizer.dart';
import 'package:terer_merchant/presentation/deals/deal_item.dart';

import '../../domain/constants/asset_constants.dart';
import '../../domain/constants/string_constants.dart';
import '../core/custom_rounded_textfield.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            // if (state.zoomDrawerController.isOpen!()) {
            //   state.zoomDrawerController.close!();
            // } else {
            //   state.zoomDrawerController.open!();
            // }
          },
          icon: SvgPicture.asset(
            AssetConstants.burgerSvg,
            width: 7.w,
          ),
        ),
        title: Text(AppConstants.dealsTitle,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
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
            child: ModalProgressHUD(
              // inAsyncCall: state.isLoading,
              inAsyncCall: false,
              color: Colors.transparent,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w)
                    .copyWith(bottom: 8.h),
                itemBuilder: (bCtx, index) {
                  return const DealItem();
                },
                separatorBuilder: (bCtx2, index2) {
                  return SizedBox(
                    height: 2.h,
                  );
                },
                itemCount: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
