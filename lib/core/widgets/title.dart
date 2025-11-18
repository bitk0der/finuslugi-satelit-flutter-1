import 'package:fin_uslugi/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTitle extends StatelessWidget {
  final String title;
  final double size;
  final EdgeInsets padding;
  const AppTitle(
    this.title, {
    super.key,
    this.size = 22,
    this.padding = const EdgeInsets.only(bottom: 12, top: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(title, style: TextStyles.h1.copyWith(fontSize: size.sp)),
    );
  }
}
