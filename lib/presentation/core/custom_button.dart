import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrimaryButton extends StatelessWidget {
  final String? btnText;
  final double? width;
  final double? height;
  final double? textFontSize;
  final FontWeight? textFontWeight;
  final Color? bgColor;
  final Color? btnTextColor;
  final BorderSide? btnBorder;
  final Widget? newChild;
  final EdgeInsets? btnPadding;
  final Function? onPressedBtn;

  const PrimaryButton({
    Key? key,
    required this.btnText,
    required this.onPressedBtn,
    this.bgColor,
    this.btnTextColor,
    this.height,
    this.width,
    this.btnPadding,
    this.textFontSize,
    this.textFontWeight,
    this.btnBorder,
    this.newChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressedBtn!(),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 100, height ?? 50),
        padding: btnPadding,
        backgroundColor: bgColor ?? Theme.of(context).primaryColor,
        // onPrimary: btnTextColor ?? Theme.of(context).primaryColor,
        side: btnBorder,
      ).copyWith(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.w),
                  side: BorderSide(
                      color: bgColor ?? Theme.of(context).primaryColor)))),
      child: newChild ??
          Text(
            btnText!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: textFontSize ?? 16.sp,
                  color:
                      btnTextColor ?? Theme.of(context).colorScheme.secondary,
                  fontWeight: textFontWeight ?? FontWeight.bold,
                ),
          ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String? btnText;
  final double? width;
  final double? height;
  final double? textFontSize;
  final FontWeight? textFontWeight;
  final Color? bgColor;
  final Color? btnTextColor;
  final BorderSide? btnBorder;
  final double? btnBorderRadius;
  final TextStyle? textStyle;

  final Widget? newChild;
  final EdgeInsets? btnPadding;
  final Function? onPressedBtn;

  const SecondaryButton({
    Key? key,
    required this.btnText,
    required this.onPressedBtn,
    this.bgColor,
    this.textStyle,
    this.btnBorderRadius,
    this.btnTextColor,
    this.height,
    this.width,
    this.btnPadding,
    this.textFontSize,
    this.textFontWeight,
    this.btnBorder,
    this.newChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressedBtn!(),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 100.w, height ?? 4.h),
        padding: btnPadding,
        backgroundColor: bgColor ?? Theme.of(context).colorScheme.secondary,
        foregroundColor: btnTextColor ?? Theme.of(context).primaryColor,
        side: btnBorder,
      ).copyWith(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(btnBorderRadius ?? 18.0),
                  side: BorderSide(
                      color: bgColor ??
                          Theme.of(context).colorScheme.secondary)))),
      child: newChild ??
          Text(
            btnText!,
            style: textStyle ??
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                      letterSpacing: 1.1,
                      fontSize: textFontSize ?? 18.sp,
                      color: btnTextColor ?? Theme.of(context).primaryColor,
                      fontWeight: textFontWeight ?? FontWeight.w600,
                    ),
          ),
    );
  }
}
