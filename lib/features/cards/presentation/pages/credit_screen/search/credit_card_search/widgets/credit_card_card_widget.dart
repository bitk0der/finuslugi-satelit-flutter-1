import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/core/widgets/app_info_row.dart';
import 'package:fin_uslugi/core/widgets/app_small_button.dart';
import 'package:fin_uslugi/core/widgets/favourite_card.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_card_response.dart';
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

class CreditCardCardWidget extends StatelessWidget {
  final CreditCardResponse creditCard;
  final VoidCallback? onMoreAboutButtonPressed;
  final bool isFavourite;

  const CreditCardCardWidget(
      {super.key,
      this.isFavourite = false,
      required this.creditCard,
      this.onMoreAboutButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.15), blurRadius: 20),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isFavourite)
            FavouriteCard(
                title: 'Кредитные карты',
                icon: Assets.icons.bankCategoriesIcons.creditCard,
                colors: ColorStyles.creditCardFavouriteCardColors),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (creditCard.additionalImageUrl.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 62.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: Colors.black.withValues(alpha: 0.2)),
                    ),
                    child: Center(
                      child: AppImageNetwork(
                          UiUtil.getlogoUrl(creditCard.additionalImageUrl)),
                    ),
                  ),
                ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      creditCard.bankName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      creditCard.cardName,
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
          SizedBox(height: 10.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppInfoRow(
                  title: "Льготный период:",
                  value: creditCard.interestFreePeriod.toString()),
              SizedBox(height: 12.h),
              AppInfoRow(
                  title: "Кредитный лимит:",
                  value:
                      "До ${UiUtil.prepareNumber(creditCard.maxCreditSum.toString())} ₽"),
              SizedBox(height: 12.h),
              AppInfoRow(
                  title: "Процент после льготного периода:",
                  value: "${creditCard.cashWithdrawalFee}%"),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Flexible(
                child: CustomButton(
                  color: ColorStyles.blueButton.withValues(alpha: 0.1),
                  title: "Подробнее",
                  titleColor: ColorStyles.blueText,
                  gradient: null,
                  onTap: onMoreAboutButtonPressed,
                ),
              ),
              if (creditCard.offerUrl.isNotEmpty) SizedBox(width: 10.w),
              if (creditCard.offerUrl.isNotEmpty)
                Flexible(
                    child: CustomButton(
                  title: "Оформить",
                  titleColor: Colors.white,
                  gradient: ColorStyles.navbarGradient,
                  onTap: () => launchUrl(
                    Uri.parse(creditCard.offerUrl),
                    mode: LaunchMode.externalApplication,
                  ),
                )),
              if (isFavourite) SizedBox(width: 14.w),
              if (isFavourite)
                BlocBuilder(
                    bloc: GetIt.I<LocalMortgageBloc>(),
                    builder: (context, state) {
                      return AppSmallButton(
                          color: ColorStyles.blueButton.withValues(alpha: 0.1),
                          size: 46.w,
                          padding: 11,
                          icon: Assets.icons.buttonsIcon.star,
                          iconColor: checkInFavourite(creditCard.id)
                              ? ColorStyles.blueText
                              : null,
                          onTap: () => GetIt.I<LocalMortgageBloc>().add(
                              AddMortgageToFavourite(
                                  productItemModel: creditCard)));
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
