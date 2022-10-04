import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../domain/extensions/sizer_extension.dart';
import 'custom_button.dart';

class CustomAlert extends StatelessWidget {
  final String svgUrl;
  final String? title;

  final String content;
  final String buttonText;
  final String? button2Text;
  final Function() onPressed;
  final Function()? onPressed2;

  final double? height;
  final Widget? customWidget;
  final bool isExtraBtn;
  final bool isReport;
  final bool isPayment;
  final bool isPurchase;

  final bool makeTextBold;

  const CustomAlert(
      {Key? key,
      this.title,
      required this.onPressed,
      required this.buttonText,
      required this.svgUrl,
      this.height,
      this.customWidget,
      this.onPressed2,
      this.button2Text,
      this.isPurchase = false,
      this.isReport = false,
      this.makeTextBold = false,
      this.isPayment = false,
      this.isExtraBtn = false,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        height: height ?? 45.h,
        padding: EdgeInsets.symmetric(
          vertical: 10.w,
          horizontal: 10.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                // spreadRadius: 100,
                color: Colors.black.withAlpha(100),
                offset: const Offset(10, 10))
          ],
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(children: [
          if (svgUrl.endsWith('.svg'))
            SvgPicture.asset(
              svgUrl,
              height: 20.w,
            ),
          if (svgUrl.endsWith('.png'))
            Image.asset(
              svgUrl,
              height: 20.w,
            ),
          if (!isPayment) const Spacer(),
          customWidget ?? const SizedBox(),
          isReport
              ? RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    isPurchase && title != null
                        ? TextSpan(
                            text: title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                          )
                        : TextSpan(
                            text: content.substring(0, 10),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                          ),
                    TextSpan(
                      text: isPurchase ? content : content.substring(10),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                          ),
                    ),
                  ]))
              : isPayment
                  ? Text(
                      content,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      content,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: makeTextBold
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: SecondaryButton(
              btnText: buttonText,
              textFontWeight: FontWeight.w900,
              textFontSize:
                  (SizerUtilExtension.checkSizerIsSupported) ? 10.sp : 14,
              onPressedBtn: onPressed,
            ),
          ),
          if (isExtraBtn)
            SizedBox(
              height: 1.h,
            ),
          if (isExtraBtn)
            SizedBox(
              width: double.infinity,
              child: SecondaryButton(
                btnText: button2Text ?? '',
                textFontWeight: FontWeight.w900,
                textFontSize:
                    (SizerUtilExtension.checkSizerIsSupported) ? 10.sp : 14,
                onPressedBtn: onPressed2,
              ),
            ),
          const Spacer(),
        ]),
      ),
    );
  }
}
