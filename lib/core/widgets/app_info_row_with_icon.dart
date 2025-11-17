import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInfoRowWithIcon extends StatelessWidget {
  final SvgGenImage icon;
  final String title;
  final String value;
  const AppInfoRowWithIcon(
      {super.key,
      required this.icon,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon.svg(),
              SizedBox(width: 12.w),
              Text(title,
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.6))),
            ],
          ),
          Text(value,
              style: const TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}
