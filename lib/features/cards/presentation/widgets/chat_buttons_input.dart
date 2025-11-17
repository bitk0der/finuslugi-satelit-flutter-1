import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatButtonsInput extends StatelessWidget {
  final String valueText1;
  final String valueText2;
  final String? valueText3;
  final String? valueText4;
  final Color? yesColor;
  final Color? noColor;
  final Function(int) onSend;

  const ChatButtonsInput({
    super.key,
    required this.valueText1,
    required this.valueText2,
    required this.onSend,
    this.yesColor = ColorStyles.greenColor3,
    this.noColor = ColorStyles.greenColor6,
    this.valueText3,
    this.valueText4,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          Container(
            width: valueText3 != null || valueText4 != null
                ? null
                : (MediaQuery.of(context).size.width - 50.w) / 2,
            height: 50.h,
            padding: valueText3 != null || valueText4 != null
                ? EdgeInsets.symmetric(horizontal: 20.w)
                : null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: yesColor,
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
              ),
              onPressed: () => onSend(0),
              child: Text(
                valueText1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            width: valueText3 != null || valueText4 != null
                ? null
                : (MediaQuery.of(context).size.width - 50.w) / 2,
            padding: valueText3 != null || valueText4 != null
                ? EdgeInsets.symmetric(horizontal: 20.w)
                : null,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: noColor,
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
              ),
              onPressed: () => onSend(1),
              child: Text(
                valueText2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          if (valueText3 != null) ...[
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromRGBO(236, 155, 34, 1),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                onPressed: () => onSend(2),
                child: Text(
                  valueText3!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
          ],
          if (valueText4 != null)
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromRGBO(69, 156, 156, 1),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                onPressed: () => onSend(3),
                child: Text(
                  valueText4!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
