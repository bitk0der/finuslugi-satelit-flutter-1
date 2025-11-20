import 'package:fin_uslugi/features/app_banner/app_banner_initial_setup.dart';
import 'package:fin_uslugi/features/app_banner/presentation/app_universal_banner_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/favourite_button.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/filter_button.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.images.homeBackgroundTopWidget.path),
              fit: BoxFit.cover)),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* Text('Cpaвнивaйтe финуслуги банков России', style: TextStyles.h1),
              SizedBox(height: 7.h),
              Text('И нaчинaйтe экoнoмить ужe ceгoдня',
                  style: TextStyles.h2.copyWith(
                      color: Colors.white.withValues(alpha:0.8), fontSize: 15)),
              SizedBox(height: 18.h), */
              AppUniversalBannerWidget(
                  banners: bannerList, category: 'main-top'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Assets.icons.banks.svg(),
                  Row(
                    children: [
                      FavouriteButton(),
                      SizedBox(width: 12.w),
                      FilterButton(onTap: () {}),
                    ],
                  ),
                ],
              ),
              /*  Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2),
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Assets.icons.verifyIcon.svg(),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Выгодные займы под 0%',
                            style: TextStyles.h1
                                .copyWith(fontSize: 17.sp, height: 1.2)),
                        SizedBox(height: 5.h),
                        Text('100% одобрения по паспорту',
                            style: TextStyles.h5.copyWith(
                                color: Colors.white.withValues(alpha:0.8),
                                fontSize: 13,
                                height: 1.2)),
                      ],
                    ),
                    const Spacer(),
                    Assets.icons.arrowRight.svg(),
                  ],
                ),
              ) */
            ],
          ),
        ),
      ),
    );
  }
}
