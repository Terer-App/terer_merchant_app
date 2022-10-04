import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void showToast(
      {required String msg,
      Toast? toastLength = Toast.LENGTH_SHORT,
      String? webBgColor,
      Color? backgroundColor}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      webBgColor:
          'linear-gradient(to right, ${webBgColor ?? '#D33F49'}, ${webBgColor ?? '#D33F49'})',
      backgroundColor: backgroundColor ?? const Color(0xffD33F49),
      gravity: ToastGravity.TOP,
    );
  }
}
