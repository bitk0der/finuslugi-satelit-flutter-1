import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/features/loans/data/models/credit/loan_main_model.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/app_small_button.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/button_rounded.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_fonts.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/app_image_network.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';

class CustomAppBar {
  static AppBar get({
    required String title,
    List<Widget>? actions,
    bool isBackButton = false,
  }) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorStyles.black,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: isBackButton ? 18.sp : 22.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
      leading: isBackButton
          ? Builder(
              builder: (context) => InkWell(
                onTap: () => context.maybePop(),
                child: const Icon(
                  CupertinoIcons.left_chevron,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            )
          : null,
    );
  }

  static PreferredSize getMain() {
    return PreferredSize(
      preferredSize: Size(0, 120.h),
      child: Container(
        height: 120.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.homeBackgroundTopWidget.path))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(
                text: 'Турбо '.toUpperCase(),
                style: TextStyles.h2.copyWith(
                    color: ColorStyles.green, fontWeight: FontWeight.w900),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Деньги'.toUpperCase(),
                      style:
                          TextStyles.h2.copyWith(fontWeight: FontWeight.w900)),
                ],
              ),
            ),
            SizedBox(height: 3.h),
            Text('Сервис по умному подбору займов',
                style: TextStyles.h2
                    .copyWith(color: Colors.white.withValues(alpha: 0.7))),
          ],
        ),
      ),
    );
  }

  static PreferredSize getLoanAppBar(
      {required BuildContext context, required LoanMainModel loan}) {
    return PreferredSize(
      preferredSize: Size(0, 105.h),
      child: Container(
        decoration: const BoxDecoration(
            color: ColorStyles.redButtonColor,
            border: Border(
                bottom: BorderSide(
              color: Colors.white10,
            ))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 15.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => context.maybePop(),
                child: ButtonRounded(
                    quarterTurns: 2,
                    color: Colors.white,
                    icon: Assets.icons.arrowRight),
              ),
              SizedBox(width: 15.w),
              ClipRRect(
                  borderRadius: BorderRadius.circular(11.23),
                  child:
                      AppImageNetwork(UiUtil.getlogoUrl(loan.meta.logoSquare))),
              SizedBox(width: 13.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Микрофинансовая организация',
                      style: TextStyles.h3
                          .copyWith(color: Colors.white70, fontSize: 13.sp)),
                  SizedBox(height: 3.64.h),
                  Text(loan.title,
                      style: TextStyles.h1
                          .copyWith(fontFamily: TextStyles.fontFamily)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static PreferredSize getAbout({
    required String title,
    List<Widget>? actions,
    required BuildContext context,
    required VoidCallback onTapFavourite,
    required VoidCallback onTapComparison,
    required int id,
    String? imageUrl,
    required String bankName,
    required String bankUrlLogo,
    required int bankId,
    bool isBackButton = false,
    bool isSmall = false,
  }) {
    return PreferredSize(
      preferredSize: Size(0, isSmall ? 205.h : 255.h),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppSmallButton(
                      onTap: () => context.maybePop(),
                      padding: 10,
                      icon: Assets.icons.buttonsIcon.arrowRight),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (imageUrl != null)
                        SizedBox(
                            width: 128,
                            height: 82,
                            child: AppImageNetwork(imageUrl)),
                      SizedBox(width: 43.w),
                      SizedBox(width: 12.w),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                title,
                maxLines: 1,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
