import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/core/widgets/app_info_row.dart';
import 'package:fin_uslugi/core/widgets/app_small_button.dart';
import 'package:fin_uslugi/core/widgets/favourite_card.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_response.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/app_image_network.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_button.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/favourite_mortgage_bloc/local/local_mortgage_bloc.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditCardWidget extends StatelessWidget {
  final CreditResponse credit;
  final bool isFavourite;
  final VoidCallback? onMoreButtonPressed;
  const CreditCardWidget(
      {super.key,
      required this.credit,
      this.isFavourite = false,
      this.onMoreButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isFavourite)
            FavouriteCard(
                title: 'Кредиты',
                icon: Assets.icons.navBarIcons.finServices,
                colors: ColorStyles.creditFavouriteCardColors),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (credit.bankLogoUrl.isNotEmpty)
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                  ),
                  child: Center(
                    child:
                        AppImageNetwork(UiUtil.getlogoUrl(credit.bankLogoUrl)),
                  ),
                ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      credit.bankName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      credit.cardName,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14.sp,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppInfoRow(
                  title: "Сумма:",
                  value:
                      "от ${UiUtil.prepareNumber(credit.sumFrom.toString())} до ${UiUtil.prepareNumber(credit.sumTo.toString())} ₽"),
              SizedBox(height: 12.h),
              AppInfoRow(
                  title: "Ставка:",
                  value: "от ${credit.rateFrom}% до ${credit.rateTo}%"),
              SizedBox(height: 12.h),
              AppInfoRow(title: "Срок:", value: "до ${credit.termTo} месяцев"),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Flexible(
                child: CustomButton(
                  color: ColorStyles.blueButton.withOpacity(0.1),
                  title: "Подробнее",
                  titleColor: ColorStyles.blueText,
                  gradient: null,
                  onTap: onMoreButtonPressed,
                ),
              ),
              if (credit.offerUrl.isNotEmpty) SizedBox(width: 10.w),
              if (credit.offerUrl.isNotEmpty)
                Flexible(
                    child: CustomButton(
                  title: "Оформить",
                  titleColor: Colors.white,
                  gradient: ColorStyles.navbarGradient,
                  // onTap: onMoreButtonPressed,
                  onTap: () => launchUrl(
                    Uri.parse(credit.offerUrl),
                    mode: LaunchMode.externalApplication,
                  ),
                )),
              if (isFavourite) SizedBox(width: 14.w),
              if (isFavourite)
                BlocBuilder(
                    bloc: GetIt.I<LocalMortgageBloc>(),
                    builder: (context, state) {
                      return AppSmallButton(
                          color: ColorStyles.blueButton.withOpacity(0.1),
                          size: 46.w,
                          padding: 11,
                          icon: Assets.icons.buttonsIcon.star,
                          iconColor: checkInFavourite(credit.id)
                              ? ColorStyles.blueText
                              : null,
                          onTap: () => GetIt.I<LocalMortgageBloc>().add(
                              AddMortgageToFavourite(
                                  productItemModel: credit)));
                    }),
            ],
          ),
        ],
      ),
    );
  }

  bool checkInFavourite(int id) {
    List productsIds =
        GetIt.I<SharedPreferences>().getStringList('mortgagesIDS') ?? [];
    if (productsIds.contains('$id')) {
      return true;
    } else {
      return false;
    }
  }
}
