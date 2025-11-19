import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class TextStyles {
  static String fontFamily = 'SFProDisplay';
  static double textHeight = 1.2;

  static TextStyle h2 = TextStyle(
      fontFamily: fontFamily,
      color: ColorStyles.white,
      fontWeight: FontWeight.w500,
      height: textHeight,
      fontSize: 18.sp);

  static TextStyle h1 = TextStyle(
      fontFamily: fontFamily,
      color: ColorStyles.black,
      fontWeight: FontWeight.w600,
      height: textHeight,
      fontSize: 24.sp);

  static TextStyle h3 = TextStyle(
      fontFamily: fontFamily,
      color: ColorStyles.white,
      fontWeight: FontWeight.w400,
      height: textHeight,
      fontSize: 16.sp);

  static TextStyle h4 = TextStyle(
      fontFamily: fontFamily,
      color: ColorStyles.white,
      fontWeight: FontWeight.w400,
      height: textHeight,
      fontSize: 15.sp);

  static TextStyle h5 = TextStyle(
      fontFamily: fontFamily,
      color: ColorStyles.white,
      fontWeight: FontWeight.w400,
      height: textHeight,
      fontSize: 14.sp);
}
