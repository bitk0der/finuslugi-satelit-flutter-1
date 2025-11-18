import 'package:fin_uslugi/core/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';

class AppEmptyWidget extends StatelessWidget {
  final String title;
  final AssetGenImage icon;
  const AppEmptyWidget({required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.all(31.w),
            decoration: const BoxDecoration(
                color: ColorStyles.white, shape: BoxShape.circle),
            child: Assets.images.couponDiscount.image()),
        SizedBox(height: 28.h),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: UIFonts.bodyMedium.copyWith(fontWeight: FontWeight.w500),
            )),
        SizedBox(height: 28.h),
        GestureDetector(
          onTap: () {} /* => context.go('/home') */,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('В каталог',
                  textAlign: TextAlign.center,
                  style: UIFonts.blueText.copyWith(fontSize: 20.sp)),
              RotatedBox(
                quarterTurns: 2,
                child: Assets.icons.arrowRight.svg(
                    colorFilter: const ColorFilter.mode(
                        ColorStyles.blueText, BlendMode.srcIn),
                    width: 16.w,
                    height: 16.w),
              )
            ],
          ),
        ),
      ],
    );
  }
}
