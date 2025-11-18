import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditMiniCard extends StatelessWidget {
  final SvgGenImage icon;
  final String text;
  final VoidCallback onTap;
  const CreditMiniCard(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            color: ColorStyles.fillColor,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon.svg(),
            SizedBox(height: 16.h),
            SizedBox(
              width: 130.w,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 1.1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
