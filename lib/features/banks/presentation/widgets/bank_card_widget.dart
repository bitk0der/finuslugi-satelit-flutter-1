import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/features/banks/data/models/bank_model.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/app_image_network.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankCardWidget extends StatelessWidget {
  final BankInfo bank;
  final VoidCallback? onMoreAboutButtonPressed;
  final bool isFavourite;
  const BankCardWidget(
      {super.key,
      required this.bank,
      this.isFavourite = false,
      this.onMoreAboutButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: ColorStyles.fillColor2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (bank.logosquare.isNotEmpty)
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AppImageNetwork(
                        width: 48,
                        height: 48,
                        UiUtil.getlogoUrl(bank.logosquare))),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bank.bankName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      bank.fullName,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14.sp,
                        color: Colors.black.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(14.w),
            margin: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
                color: ColorStyles.white,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Телефон:",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: Colors.black.withValues(alpha: 0.5),
                      ),
                    ),
                    Text(
                      bank.phone.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h), */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Лицензия ЦБ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: Colors.black.withValues(alpha: 0.5),
                      ),
                    ),
                    Text(
                      bank.license.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Flexible(
                child: CustomButton(
                  height: 44.h,
                  color: ColorStyles.blueButtonColor,
                  borderRadius: 12,
                  titleColor: ColorStyles.blueText,
                  title: "Узнать подробности",
                  onTap: onMoreAboutButtonPressed,
                ),
              ),
              /*    SizedBox(width: 10.w),
              BlocBuilder(
                  bloc: GetIt.I<LocalMortgageBloc>(),
                  builder: (context, state) {
                    return AppSmallButton(
                        color: ColorStyles.blueButton.withValues(alpha: 0.1),
                        size: 46.w,
                        padding: 11,
                        icon: Assets.icons.buttonsIcon.star,
                        iconColor:
                            GetIt.I<StorageUtil>().checkInFavourite(bank.id)
                                ? ColorStyles.blueText
                                : null,
                        onTap: () => GetIt.I<LocalMortgageBloc>().add(
                            AddMortgageToFavourite(productItemModel: bank)));
                  }) */
            ],
          ),
        ],
      ),
    );
  }
}
