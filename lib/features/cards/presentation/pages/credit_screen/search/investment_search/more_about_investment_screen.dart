import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/core/widgets/app_info_row_with_icon.dart';
import 'package:fin_uslugi/features/cards/data/models/investment/investment_response.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/widgets/info_container.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_button.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../app_banner/app_banner_initial_setup.dart';
import '../../../../../../app_banner/presentation/app_universal_banner_widget.dart';

@RoutePage()
class MoreAboutinvestmentScreen extends StatefulWidget {
  final InvestmentResponse investment;

  const MoreAboutinvestmentScreen({super.key, required this.investment});

  @override
  _MoreAboutinvestmentScreenState createState() =>
      _MoreAboutinvestmentScreenState();
}

class _MoreAboutinvestmentScreenState extends State<MoreAboutinvestmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.backgroundColor,
      /* appBar: CustomAppBar.getAbout(
        isBackButton: true,
        context: context,
        bankId: int.tryParse(widget.investment.parentPostRelation) ?? 0,
        id: widget.investment.id,
        title: widget.investment.cardName,
        bankName: widget.investment.bankName,
        bankUrlLogo: widget.investment.bankLogo,
        isSmall: true,
        onTapFavourite: () {
          GetIt.I<LocalMortgageBloc>()
              .add(AddMortgageToFavourite(productItemModel: widget.investment));
        },
        onTapComparison: () {
          GetIt.I<LocalComparisonMortgageBloc>().add(
              AddMortgageToComparison(productItemModel: widget.investment));
        },
      ), */
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppUniversalBannerWidget(
                  category: 'about-vklady-screen', banners: bannerList),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Общая информация',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppInfoRowWithIcon(
                            title: "Сумма:",
                            icon: Assets.icons.buttonsIcon.rubleGreen,
                            value:
                                "от ${UiUtil.prepareNumber(widget.investment.sumFrom.toString())} ${widget.investment.sumTo.isNotEmpty ? 'до ${UiUtil.prepareNumber(widget.investment.sumTo.toString())} ₽' : '₽'}"),
                        SizedBox(height: 12.h),
                        AppInfoRowWithIcon(
                          title: "Ставка:",
                          icon: Assets.icons.buttonsIcon.discountGreen,
                          value:
                              "от ${widget.investment.ratePskFrom}% до ${widget.investment.ratePskTo}%",
                        ),
                        SizedBox(height: 12.h),
                        AppInfoRowWithIcon(
                          title: "Срок:",
                          icon: Assets.icons.buttonsIcon.timeGreen,
                          value: "до ${widget.investment.termTo} дней",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'Условия кредитования',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                      color: Colors.black),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 10)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.h),
                    InfoContainer(
                      title: "Тип вклада",
                      text: widget.investment.depositType,
                    ),
                    InfoContainer(
                      title: "Назначение вклада",
                      text: widget.investment.feature,
                    ),
                    if (widget.investment.replenishmentText.isNotEmpty)
                      InfoContainer(
                        title: "Пополняемый вклад",
                        text: widget.investment.replenishmentText,
                      ),
                    InfoContainer(
                      title: "Капитализация",
                      text: widget.investment.capitalizationText,
                    ),
                    InfoContainer(
                      title: "Досрочное закрытие",
                      text: widget.investment.earlyTerminationText,
                    ),
                    if (widget.investment.partialWithdrawalText.isNotEmpty)
                      InfoContainer(
                        title: "Частичное снятие",
                        text: widget.investment.partialWithdrawalText,
                      ),
                    SizedBox(height: 17.h),
                  ],
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
        if (widget.investment.offerUrl.isNotEmpty)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: CustomButton(
                color: ColorStyles.yellowColor,
                titleColor: Colors.black,
                title: "Оформить заявку",
                borderRadius: 100,
                onTap: () => launchUrl(
                  Uri.parse(widget.investment.offerUrl),
                  mode: LaunchMode.externalApplication,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
