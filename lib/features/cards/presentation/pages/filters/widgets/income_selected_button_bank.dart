import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncomeSelectedButtonBank extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final List<String> text;

  const IncomeSelectedButtonBank(
    this.text, {
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppCardLayout(
      isNeedShadow: true,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(title, style: TextStyle()),
          SizedBox(height: 10.h),
          text.isNotEmpty
              ? Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    for (var a in text) bankButton(a),
                  ],
                )
              : bankButton('Все банки'),
          SizedBox(height: 10.h),
          Divider(
            height: 1.h,
            color: Colors.black.withOpacity(0.1),
          ),
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 17.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Row(
              children: [
                Icon(CupertinoIcons.add_circled_solid,
                    size: 20.r, color: ColorStyles.blueText),
                SizedBox(width: 10.w),
                Flexible(
                    child: Text(
                  'Добавить банк',
                  style: TextStyle(
                      color: ColorStyles.blueText,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bankButton(String text) {
    return AppCardLayout(
        color: ColorStyles.blue,
        radius: 12,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: Text(text));
  }
}
