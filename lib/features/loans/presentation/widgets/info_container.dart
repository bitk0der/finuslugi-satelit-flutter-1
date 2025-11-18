import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/translator.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final String? text;
  final List? textList;
  final Color textColor;

  const InfoContainer({
    super.key,
    required this.title,
    this.text,
    this.textList,
    this.textColor = ColorStyles.white,
  }) : assert(text != null || textList != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              color: textColor.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 6.h),
          if (text != null)
            HtmlWidget(
              Translator.translateCommaSeparatedString(text!),
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17.sp,
                color: textColor,
              ),
            ),
          if (textList != null && textList!.isNotEmpty) _getTextList(textList!),
        ],
      ),
    );
  }

  Widget _getTextList(List textList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        textList.length,
        (index) {
          return Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '—',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: textColor,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    textList[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
