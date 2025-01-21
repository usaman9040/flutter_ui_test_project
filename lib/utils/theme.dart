import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_constants.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      primarySwatch: Colors.deepPurple,
      textTheme: TextTheme(
        titleMedium: TextStyle(
          fontFamily: 'AtHauss',
          fontSize: 12.sp,
          color: ColorConstants.darkColor,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
            fontFamily: 'AtHauss',
            color: ColorConstants.darkColor,
            fontSize: 18.sp),
        bodyMedium: TextStyle(
          fontFamily: 'At Hauss',
          fontSize: 16.sp,
          color: ColorConstants.darkColor,
          fontWeight: FontWeight.w600,
        ),
        bodySmall: TextStyle(
            fontFamily: 'AtHauss',
            color: ColorConstants.darkColor,
            fontSize: 14.sp),
        displayLarge: TextStyle(
            fontFamily: 'AtHauss',
            fontSize: 36.sp,
            color: ColorConstants.darkColor,
            fontWeight: FontWeight.w600),
        displayMedium: TextStyle(
            fontFamily: 'AtHauss',
            fontSize: 28.sp,
            color: ColorConstants.darkColor,
            fontWeight: FontWeight.w600),
        displaySmall: TextStyle(
            fontFamily: 'AtHauss',
            fontSize: 14.sp,
            color: ColorConstants.darkColor,
            fontWeight: FontWeight.w600),
        headlineLarge: TextStyle(
            fontFamily: 'AtHauss',
            fontSize: 22.sp,
            color: ColorConstants.darkColor,
            fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(
          fontFamily: 'AtHauss',
          fontSize: 20.sp,
          color: ColorConstants.darkColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'AtHauss',
          fontSize: 8.sp,
          fontWeight: FontWeight.w600,
          color: ColorConstants.darkColor,
        ),
        titleLarge: TextStyle(
          fontFamily: 'AtSlam',
          fontSize: 25.sp,
          fontWeight: FontWeight.w700,
          color: ColorConstants.darkColor,
        ),
      ));
}
