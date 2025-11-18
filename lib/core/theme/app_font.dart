import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class UIFonts {
  static String fontFamily = 'SFProDisplay';
  static double textHeight = 1.1;

  static get selectedLabelStyle => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        height: textHeight,
        color: ColorStyles.black,
      );

  static TextStyle get unSelectedLabelStyle => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        height: textHeight,
        color: ColorStyles.black.withOpacity(0.6),
      );

  static TextStyle get bodyMedium => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        height: textHeight,
        color: ColorStyles.black,
      );
  static TextStyle get couponText => TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        height: textHeight,
        color: ColorStyles.black.withOpacity(0.6),
      );
  static get bodySmall => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        height: textHeight,
        color: ColorStyles.black.withOpacity(0.6),
      );
  static TextStyle get hint => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        height: textHeight,
        color: ColorStyles.black.withOpacity(0.4),
      );

  static TextStyle get titleMedium => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        height: textHeight,
        color: ColorStyles.black,
      );

  static TextStyle get blueText => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        height: textHeight,
        color: ColorStyles.blueText,
      );

  static get cardSmallText => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        height: textHeight,
        color: ColorStyles.black,
      );

  static get titleText => TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w700,
        fontFamily: 'MTSWide',
        height: textHeight,
        color: ColorStyles.black,
      );
}
