import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConstantsHelper {
  static double roundToMultiple(double number, double multiple) {
    return (number + (multiple ~/ 2)) ~/ multiple * multiple;
  }

  static BoxDecoration commonBoxDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.black.withOpacity(0.15)),
    borderRadius: BorderRadius.circular(16.r),
  );
  static void setSharedPreferences() async {
    sp = await SharedPreferences.getInstance();
  }

  static SharedPreferences? sp;
  static EdgeInsets screenHorizontalPadding =
      EdgeInsets.symmetric(horizontal: 16.w);
}
