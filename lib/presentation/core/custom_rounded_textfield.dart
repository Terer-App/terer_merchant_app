import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CustomRoundedInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final bool enabled;

  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final Widget? suffixIcon;
  final Function? onSuffixPressed;
  final double? width;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  final TextEditingController? controller;
  final double? height;
  final bool isTitle;
  final String? titleText;
  final Color? titleColor;
  final bool readOnly;

  final bool hasDebounce;

  final int? maxLines;
  final int? maxLength;
  final Function()? onTap;

  final double? textFieldRadius;
  final EdgeInsets? contentPadding;
  final TextInputType? keyboardTextType;
  final List<TextInputFormatter>? textInputFormat;

  const CustomRoundedInput({
    Key? key,
    this.hintText,
    this.isTitle = false,
    this.readOnly = false,
    this.hasDebounce = false,
    this.titleText,
    this.enabled = true,
    this.errorText,
    this.maxLength,
    this.controller,
    this.validator,
    this.onTap,
    this.titleColor,
    this.hintTextStyle,
    this.labelText,
    this.labelTextStyle,
    this.onSuffixPressed,
    this.suffixIcon,
    this.contentPadding,
    this.width,
    this.maxLines = 1,
    this.height,
    this.textFieldRadius,
    this.keyboardTextType,
    this.textInputFormat,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomRoundedInput> createState() => _CustomRoundedInputState();
}

class _CustomRoundedInputState extends State<CustomRoundedInput> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onChanged!(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height,
      child: Column(
        children: [
          // rounded input with title
          widget.isTitle
              ? Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.titleText ?? '',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: widget.titleColor ??
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                )
              : const SizedBox(),
          TextFormField(
            enabled: widget.enabled,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 13.sp,
                ),
            readOnly: widget.readOnly,
            onChanged: widget.onChanged != null
                ? widget.hasDebounce
                    ? _onSearchChanged
                    : widget.onChanged
                : null,
            controller: widget.controller,
            onTap: widget.onTap,
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: widget.keyboardTextType,
            inputFormatters: widget.textInputFormat,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              counterText: '',
              fillColor: !widget.enabled
                  ? Colors.grey.withOpacity(0.5)
                  : Theme.of(context).colorScheme.onTertiary,
              filled: true,
              errorText: widget.errorText,
              errorStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 10.sp, color: Colors.red),
              labelText: widget.labelText,
              suffixIcon: widget.suffixIcon,
              hintText: widget.hintText,
              hintStyle: widget.hintTextStyle ??
                  Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 10.sp,
                      ),
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(horizontal: 10.sp, vertical: 14.sp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(widget.textFieldRadius ?? 25)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
