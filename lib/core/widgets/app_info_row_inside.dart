import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInfoRowInside extends StatelessWidget {
  final String title;
  final String value;
  const AppInfoRowInside({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        /*  padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
            color: ColorStyles.fillColor,
            borderRadius: BorderRadius.circular(14)), */
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: Colors.white.withValues(alpha: 0.5),
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ));
  }
}
