import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../custom_button.dart';

class CustomDialogBox extends StatelessWidget {
  final String btnText;
  final String messageText;
  final Function onClick;

  const CustomDialogBox(
      {Key? key,
      required this.btnText,
      required this.messageText,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background.withOpacity(0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 90.w,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Card(
              elevation: 25,
              shadowColor: Colors.grey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 5.w),
                child: Column(
                  children: [
                    Icon(
                      Icons.check,
                      size: 30.sp,
                    ),
                    // Image.asset(
                    //   AssetConstants.rightImage,
                    //   width: 20.w,
                    // ),
                    SizedBox(height: 5.w),
                    Text(
                      messageText,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    SecondaryButton(
                      btnText: btnText,
                      onPressedBtn: () => onClick(),
                      width: double.infinity,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
