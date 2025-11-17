import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/routes/app_router.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: assetGenImage.image(height: 345.h)),
            SizedBox(height: 26.h),
            Text(title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.sp,
                    height: 1.1,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 20.h),
            Text(subtitle,
                style: TextStyle(
                    color: Colors.black, fontSize: 18.sp, height: 1.2)),
            SizedBox(height: 20.h),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: AppButton(
          onTap: () {
            context.navigateTo(const FinServiceMainRouter());
          },
          title:
              'На страницу ${title.contains('банк') ? 'банков' : 'финуслуг'}',
        ),
      ),
    ));
  }
}
