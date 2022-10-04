import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sizer/sizer.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    Key? key,
    this.autoFocus = false,
    this.autoCorrect = false,
    this.errorText,
    this.controller,
    this.counterText,
    this.initialVal,
    this.enabled = true,
    this.textStyle,
    this.hintText,
    this.initialValue,
    this.keyboardType,
    this.labelText,
    this.maxLength,
    this.maxLines,
    this.obscureText = false,
    this.onChanged,
    this.suffixIconTap,
    this.onFieldSubmitted,
    this.onTap,
    this.isImp = false,
    this.prefixIcon,
    this.readOnly = false,
    this.inputWithLabel = false,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.textInputAction,
    this.validator,
    this.height,
    this.width,
    this.customContentPadding,
    this.isUpload = false,
    this.inputFormatters,
    this.textCapitalization,
    this.prefixWidget,
    this.textAlign,
    this.labelColor,
    this.inputBorderRadius,
  }) : super(key: key);

  final TextCapitalization? textCapitalization;
  final Function()? onTap;
  final Function()? suffixIconTap;
  final TextStyle? textStyle;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final bool autoCorrect;
  final String? initialVal;
  final Function(String)? onChanged;
  final bool autoFocus;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool? inputWithLabel;
  final String? labelText;
  final bool? isImp;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final double? height;
  final double? width;
  final TextInputAction? textInputAction;
  final Function(String?)? onFieldSubmitted;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefixWidget;
  final String? counterText;
  final TextAlign? textAlign;
  final BoxConstraints? suffixIconConstraints;
  final String? errorText;
  final Color? labelColor;
  final bool isUpload;
  final double? inputBorderRadius;

  final EdgeInsets? customContentPadding;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(inputBorderRadius ?? 20),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primaryContainer.withAlpha(140),
        width: 1,
      ),
    );

    TextFormField textFormField = TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlign: textAlign ?? TextAlign.start,
      style: textStyle ??
          Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
      controller: controller,
      initialValue: initialVal,
      cursorColor: Theme.of(context).colorScheme.primaryContainer,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      cursorWidth: isUpload ? 0 : 2.0,
      obscureText: obscureText,
      maxLength: maxLength,
      validator: validator,
      autocorrect: autoCorrect,
      inputFormatters: inputFormatters,
      onTap: onTap,
      enabled: enabled,
      decoration: InputDecoration(
        fillColor: !enabled
            ? Colors.grey.withOpacity(0.5)
            : Theme.of(context).colorScheme.onTertiary,
        filled: true,
        counter: const Offstage(),
        prefixIconConstraints: prefixIcon != null
            ? BoxConstraints(
                maxWidth: 10.w,
              )
            : null,
        suffixIconConstraints: suffixIcon != null
            ? BoxConstraints(
                maxWidth: 14.w,
              )
            : null,
        focusedBorder: outlineInputBorder.copyWith(
          borderSide: BorderSide(
            color:
                Theme.of(context).colorScheme.primaryContainer.withAlpha(140),
          ),
        ),
        enabledBorder: outlineInputBorder,
        border: outlineInputBorder.copyWith(
            borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onTertiary,
        )),
        disabledBorder: outlineInputBorder.copyWith(),
        hintText: hintText,
        contentPadding: customContentPadding ??
            EdgeInsets.symmetric(
              horizontal: 3.w,
              // vertical: 4.w,
            ),
        prefixIcon: prefixIcon,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              overflow: TextOverflow.ellipsis,
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.5),
            ),
        errorText: errorText,
      ),
      onChanged: onChanged,
    );

    return SizedBox(
      width: width ?? double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (inputWithLabel ?? false)
          Text(
            labelText ?? '',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: labelColor ??
                      Theme.of(context).colorScheme.primaryContainer,
                ),
          ),
        SizedBox(
          height: 0.5.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            prefixWidget ?? const SizedBox(),
            Expanded(child: textFormField),
          ],
        )
      ]),
    );
  }
}

class SecondaryTextField extends StatelessWidget {
  const SecondaryTextField({
    Key? key,
    this.autoFocus = false,
    this.autoCorrect = false,
    this.errorText,
    this.borderColor,
    this.controller,
    this.counterText,
    this.initialVal,
    this.enabled = true,
    this.textStyle,
    this.hintText,
    this.initialValue,
    this.keyboardType,
    this.labelText,
    this.maxLength,
    this.maxLines,
    this.textFontSize,
    this.obscureText = false,
    this.onChanged,
    this.suffixIconTap,
    this.onFieldSubmitted,
    this.onTap,
    this.isImp = false,
    this.prefixIcon,
    this.readOnly = false,
    this.inputWithLabel = false,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.textInputAction,
    this.validator,
    this.height,
    this.width,
    this.isUpload = false,
    this.inputFormatters,
    this.textCapitalization,
    this.prefixWidget,
    this.textAlign,
  }) : super(key: key);

  final TextCapitalization? textCapitalization;
  final Function()? onTap;
  final Function()? suffixIconTap;
  final TextStyle? textStyle;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final bool autoCorrect;
  final String? initialVal;
  final Function(String)? onChanged;
  final bool autoFocus;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool? inputWithLabel;
  final Color? borderColor;
  final String? labelText;
  final bool? isImp;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final double? height;
  final double? width;
  final TextInputAction? textInputAction;
  final Function(String?)? onFieldSubmitted;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefixWidget;
  final String? counterText;
  final TextAlign? textAlign;
  final BoxConstraints? suffixIconConstraints;
  final String? errorText;
  final bool isUpload;
  final double? textFontSize;

  @override
  Widget build(BuildContext context) {
    UnderlineInputBorder underlineInputBorder = UnderlineInputBorder(
      // borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: borderColor ??
            Theme.of(context).colorScheme.primaryContainer.withAlpha(140),
        width: 1,
      ),
    );

    TextFormField textFormField = TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlign: textAlign ?? TextAlign.start,
      style: textStyle ??
          Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
                fontSize: textFontSize,
              ),
      obscuringCharacter: '*',
      controller: controller,
      readOnly: readOnly,
      initialValue: initialVal,
      cursorColor: Theme.of(context).colorScheme.primaryContainer,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      cursorWidth: isUpload ? 0 : 2.0,
      obscureText: obscureText,
      maxLength: maxLength,
      validator: validator,
      autocorrect: autoCorrect,
      inputFormatters: inputFormatters,
      onTap: onTap,
      enabled: enabled,
      decoration: InputDecoration(
        // fillColor: Theme.of(context).colorScheme.onTertiary,
        // filled: true,

        counter: const Offstage(),
        prefixIconConstraints: prefixIcon != null
            ? BoxConstraints(
                maxWidth: 10.w,
              )
            : null,
        suffixIconConstraints: suffixIcon != null
            ? BoxConstraints(
                maxWidth: 14.w,
              )
            : null,
        focusedBorder: underlineInputBorder.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        enabledBorder: underlineInputBorder,
        border: underlineInputBorder.copyWith(
            borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onTertiary,
        )),
        disabledBorder: underlineInputBorder.copyWith(),
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0.w,
          // vertical: 4.w,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              overflow: TextOverflow.ellipsis,
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.5),
            ),
        errorText: errorText,
      ),
      onChanged: onChanged,
    );

    return SizedBox(
      width: width ?? double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (inputWithLabel ?? false)
          Text(
            labelText ?? '',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        SizedBox(
          height: 0.5.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            prefixWidget ?? const SizedBox(),
            Expanded(child: textFormField),
          ],
        )
      ]),
    );
  }
}

class TernaryTextField extends StatefulWidget {
  final bool enabled;
  final bool readOnly;
  final double? width;
  final double? height;

  final double? titleSpace;
  final double? borderRadius;
  final double? fontSize;
  final double? titleSize;
  final double? fontHeight;
  final EdgeInsetsGeometry? padding;

  final bool autofocus;
  final int? maxLines;
  final int? maxLength;
  final bool obscureText;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? counterText;
  final String? initialValue;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Widget? suffixIcon, prefixIcon;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final String? Function(String?)? onFieldSubmitted;
  final List<TextInputFormatter>? textInputFormatter;

  const TernaryTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.maxLength,
    this.enabled = true,
    this.onChanged,
    this.textInputAction,
    this.keyboardType,
    this.onFieldSubmitted,
    this.validator,
    this.hintText,
    this.errorText,
    this.margin,
    this.obscureText = false,
    this.suffixIcon,
    this.autofillHints,
    this.prefixIcon,
    this.initialValue,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.width,
    this.height,
    this.counterText,
    this.borderRadius,
    this.fontSize,
    this.fontHeight,
    this.titleSize,
    this.titleSpace,
    this.padding,
    this.textInputFormatter,
  })  : assert(initialValue == null || controller == null,
            'do not provide initial value or controller at the same time'),
        super(key: key);

  @override
  TernaryTextFieldState createState() => TernaryTextFieldState();
}

class TernaryTextFieldState extends State<TernaryTextField> {
  final _focusNode = FocusNode();
  final _key = GlobalKey<FormFieldState<String>>();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      gapPadding: 0,
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText ?? '',
          style: TextStyle(fontSize: widget.titleSize ?? 10.sp),
        ),
        SizedBox(height: widget.titleSpace ?? 2.w),
        Container(
          width: widget.width ?? 100.w,
          height: widget.height ?? 13.w,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 6.sp),
            color: !widget.enabled
                ? Theme.of(context).disabledColor.withAlpha(25)
                : Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              width: 1,
              color: widget.errorText != null && widget.errorText!.isNotEmpty
                  ? Theme.of(context).errorColor
                  : !widget.enabled
                      ? Theme.of(context).disabledColor
                      : Theme.of(context).dividerColor,
            ),
          ),
          child: TextFormField(
            key: _key,
            onTap: widget.onTap,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            maxLines: widget.maxLines,
            onChanged: widget.onChanged,
            autofocus: widget.autofocus,
            maxLength: widget.maxLength,
            inputFormatters: widget.textInputFormatter ?? [],
            focusNode: _focusNode,
            validator: widget.validator,
            controller: widget.controller,
            obscureText: widget.obscureText,
            initialValue: widget.initialValue,
            keyboardType: widget.keyboardType,
            autofillHints: widget.autofillHints,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onFieldSubmitted,
            cursorColor: Theme.of(context).primaryColor,
            style: TextStyle(fontSize: widget.fontSize ?? 11.sp),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              isCollapsed: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: TextStyle(
                height: widget.fontHeight ?? 3.8.w,
                fontSize: widget.fontSize ?? 11.sp,
                backgroundColor: Colors.transparent,
              ),
              contentPadding: widget.padding ?? EdgeInsets.all(2.w),
              fillColor: !widget.enabled
                  ? Colors.transparent
                  : Theme.of(context).scaffoldBackgroundColor,
              border: outlineInputBorder.copyWith(),
              focusedBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              disabledBorder: outlineInputBorder,
              errorBorder: outlineInputBorder,
              filled: !widget.enabled,
              hintText: widget.hintText,
              labelText: '',
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              helperStyle: TextStyle(height: 0.w),
              counterText: widget.counterText ?? '',
            ),
            obscuringCharacter: '*',
          ),
        ),
        if (widget.errorText != null && widget.errorText!.isNotEmpty)
          Text(
            widget.errorText!,
            style: TextStyle(
              color: Theme.of(context).errorColor,
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
