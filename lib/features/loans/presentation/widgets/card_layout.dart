import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCardLayout extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsets? padding;
  final double? radius;
  final double? height;
  final bool isNeedBorder;
  final bool isNeedShadow;
  final BoxShadow? shadow;

  const AppCardLayout(
      {required this.child,
      this.isNeedBorder = false,
      this.isNeedShadow = false,
      this.radius,
      this.padding,
      this.color,
      this.height,
      this.shadow,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding ?? EdgeInsets.all(16.w),
        height: height,
        decoration: BoxDecoration(
            boxShadow: !isNeedShadow
                ? null
                : [
                    shadow ??
                        BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10.r)
                  ],
            border: Border.all(
                width: 1,
                color: isNeedBorder
                    ? Colors.black.withValues(alpha: 0.5)
                    : Colors.transparent),
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(radius ?? 20.r)),
        child: child);
  }
}
