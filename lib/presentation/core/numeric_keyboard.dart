import 'package:flutter/material.dart';
import 'package:flutter_haptic/haptic.dart';
import 'package:sizer/sizer.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Display a custom right icon
  final Widget? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Display a custom left icon
  final Widget? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  final bool hideLeftButton;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  const NumericKeyboard(
      {Key? key,
      required this.onKeyboardTap,
      this.textColor = Colors.black,
      this.rightButtonFn,
      this.rightIcon,
      this.leftButtonFn,
      this.leftIcon,
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
      this.hideLeftButton = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(
      //   left: 2.w,
      //   right: 2.w,
      // ),
      margin: const EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            buttonPadding: EdgeInsets.zero,
            children: <Widget>[
              _calcButton('1', Theme.of(context).primaryColor),
              _calcButton('2', Theme.of(context).colorScheme.secondary),
              _calcButton('3', Theme.of(context).primaryColor),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            buttonPadding: EdgeInsets.zero,
            children: <Widget>[
              _calcButton('4', Theme.of(context).primaryColor),
              _calcButton('5', Theme.of(context).colorScheme.secondary),
              _calcButton('6', Theme.of(context).primaryColor),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            buttonPadding: EdgeInsets.zero,
            children: <Widget>[
              _calcButton('7', Theme.of(context).primaryColor),
              _calcButton('8', Theme.of(context).colorScheme.secondary),
              _calcButton('9', Theme.of(context).primaryColor),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            buttonPadding: EdgeInsets.zero,
            children: <Widget>[
              InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: widget.leftButtonFn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 27.w,
                      height: 5.h,
                      margin:
                          EdgeInsets.symmetric(vertical: 1.w, horizontal: 1.w),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: widget.leftIcon)),
              _calcButton('0', Theme.of(context).colorScheme.secondary),
              if (!widget.hideLeftButton)
                InkWell(
                    borderRadius: BorderRadius.circular(45),
                    onTap: widget.rightButtonFn,
                    child: Container(
                        alignment: Alignment.center,
                        width: 27.w,
                        height: 5.h,
                        margin: EdgeInsets.symmetric(
                            vertical: 1.w, horizontal: 1.w),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: widget.rightIcon))
              else
                Container(
                  alignment: Alignment.center,
                  width: 29.w,
                  height: 5.h,
                )
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value, Color backgroundColor) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          // Feedback.forTap(context);
          Haptic.onSuccess();
          widget.onKeyboardTap(value);
        },
        child: Container(
          alignment: Alignment.center,
          width: 27.w,
          height: 5.h,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.symmetric(vertical: 1.w, horizontal: 1.w),
          child: Text(
            value,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondaryContainer),
          ),
        ));
  }
}
