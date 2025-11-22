import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/widgets/app_button.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyWidget extends StatelessWidget {
  final AssetGenImage assetGenImage;
  final String title;
  final String subtitle;

  const EmptyWidget(
      {required this.assetGenImage,
      required this.subtitle,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: assetGenImage.image(height: 170.h)),
            SizedBox(height: 26.h),
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                    height: 1.1,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 16.h),
            Text(subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff5D5D5D), fontSize: 16.sp, height: 1.2)),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: AppButton(
                backgroundColor: ColorStyles.red,
                onTap: () {
                  context.router.navigate(const SelectionRouter());
                },
                title: 'Перейти в каталог',
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
