import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncomeSelectedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String text;

  const IncomeSelectedButton(
    this.text, {
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppCardLayout(
      isNeedShadow: true,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle()),
          SizedBox(height: 10.h),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(
                backgroundColor: ColorStyles.fillColor,
                padding: EdgeInsets.all(14.w),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(text.isEmpty ? 'Любые' : text,
                          style: TextStyle())),
                  Icon(CupertinoIcons.chevron_down, size: 26.r),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
