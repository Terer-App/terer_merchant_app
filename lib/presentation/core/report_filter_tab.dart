import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_button.dart';

class ReportFilterTab extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function()? onClick;

  const ReportFilterTab({
    Key? key,
    this.onClick,
    this.isActive = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      btnText: title,
      bgColor: isActive
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.primary,
      btnTextColor: Theme.of(context).colorScheme.secondary,
      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
      width: 30.w,
      height: 4.h,
      btnBorderRadius: 3.w,
      onPressedBtn: onClick,
    );
  }
}
