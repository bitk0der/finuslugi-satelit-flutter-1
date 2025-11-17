import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color color;
  final String title;
  final Widget? child;
  final double? height;
  final Color titleColor;
  final bool isActive;
  final List<Color>? gradient;
  final double borderRadius;

  const CustomButton({
    super.key,
    this.onTap,
    this.color = ColorStyles.blue,
    required this.title,
    this.child,
    this.height,
    this.gradient,
    this.titleColor = Colors.white,
    this.isActive = true,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: isActive ? color : Colors.grey.withOpacity(0.8),
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: gradient != null
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: gradient!)
              : null),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
        onPressed: isActive ? onTap : null,
        child: child ??
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: titleColor,
              ),
            ),
      ),
    );
  }
}
