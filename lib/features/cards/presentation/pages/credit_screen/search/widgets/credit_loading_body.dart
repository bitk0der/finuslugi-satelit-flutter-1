import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditLoadingBody extends StatelessWidget {
  const CreditLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: LinearProgressIndicator(
            minHeight: 10.h,
            color: Colors.black,
            backgroundColor: Colors.black.withOpacity(0.05),
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          "Загружаем...",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
