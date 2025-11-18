import 'package:fin_uslugi/features/loans/data/models/credit/loan_main_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_fonts.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/app_image_network.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoanCardWidget extends StatelessWidget {
  final LoanMainModel loan;
  final VoidCallback? onMoreAboutButtonPressed;
  final bool isFavourite;
  const LoanCardWidget(
      {super.key,
      required this.loan,
      this.isFavourite = false,
      this.onMoreAboutButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: ColorStyles.navbarGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (loan.meta.logoSquare.isNotEmpty) ...[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: AppImageNetwork(
                            UiUtil.getlogoUrl(loan.meta.logoSquare))),
                    SizedBox(width: 10.w)
                  ],
                  Text(loan.title,
                      style:
                          TextStyles.h2.copyWith(fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(width: 50.w),
              Flexible(
                child: Text('Лицензия №${loan.meta.license}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.h3
                        .copyWith(color: Colors.white54, fontSize: 13.sp)),
              ),
            ],
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(10.w),
            margin: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Сумма займа:",
                        style: TextStyles.h3.copyWith(color: Colors.white54)),
                    Text('от ${loan.meta.sumFrom} до ${loan.meta.sumTo} ₽',
                        style: TextStyles.h3
                            .copyWith(fontWeight: FontWeight.w500)),
                  ],
                ),
                /* SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Срок:",
                        style: TextStyles.h3.copyWith(color: Colors.white54)),
                    Text('от ${loan.meta.termFrom} до ${loan.meta.termTo} дней',
                        style: TextStyles.h3
                            .copyWith(fontWeight: FontWeight.w500)),
                  ],
                ), */
              ],
            ),
          ),
          SizedBox(height: 4.h),
          CustomButton(
            height: 44.h,
            color: ColorStyles.green,
            borderRadius: 10,
            titleColor: Colors.black,
            title: "Подробнее",
            onTap: onMoreAboutButtonPressed,
          ),
        ],
      ),
    );
  }

  static bool checkInFavourite(int id) {
    List productsIds =
        GetIt.I<SharedPreferences>().getStringList('mortgagesIDS') ?? [];
    if (productsIds.contains('$id')) {
      return true;
    } else {
      return false;
    }
  }
}
