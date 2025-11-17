import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final double borderRadius;
  final VoidCallback? onTap;
  final bool isLoading;
  final double height;
  final bool isActive;
  final Widget? child;
  const AppButton({
    super.key,
    this.title = '',
    this.backgroundColor = ColorStyles.orangeColor,
    this.titleColor = Colors.white,
    this.onTap,
    this.borderRadius = 100,
    this.isLoading = false,
    this.isActive = true,
    this.height = 50,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: height.h,
      decoration: BoxDecoration(
        color: isActive ? backgroundColor : ColorStyles.dividerColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextButton(
        onPressed: isActive ? onTap : null,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: child ??
            Container(
              child: isLoading
                  ? SizedBox(
                      width: 30.r,
                      height: 30.r,
                      child: const CircularProgressIndicator(
                        color: ColorStyles.loaderColor,
                      ),
                    )
                  : Text(
                      title,
                      style: TextStyle(
                        color: isActive
                            ? titleColor
                            : Colors.black.withOpacity(0.5),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
      ),
    );
  }
}
