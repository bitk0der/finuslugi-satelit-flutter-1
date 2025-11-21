import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/core/widgets/app_info_row_inside.dart';
import 'package:fin_uslugi/features/cards/data/models/investment/investment_response.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/widgets/info_container.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_app_bar.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_button.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/favourite_mortgage_bloc/local/local_mortgage_bloc.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
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
      appBar: CustomAppBar.getAbout(
        isBackButton: true,
        context: context,
        bankId: int.tryParse(widget.investment.parentPostRelation) ?? 0,
        id: widget.investment.id,
        title: widget.investment.cardName,
        bankName: widget.investment.bankName,
        bankUrlLogo: widget.investment.bankLogo,
        onTapFavourite: () {
          GetIt.I<LocalMortgageBloc>()
              .add(AddMortgageToFavourite(productItemModel: widget.investment));
        },
        onTapComparison: () {},
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppUniversalBannerWidget(
                  category: 'about-vklady-screen', banners: bannerList),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              Assets.images.homeBackgroundTopWidget.path),
                          fit: BoxFit.cover)),
                  child: Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                            color: ColorStyles.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorStyles.blueText)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppInfoRowInside(
                                title: "Сумма:",
                                value:
                                    "от ${UiUtil.prepareNumber(widget.investment.sumFrom.toString())} ${widget.investment.sumTo.isNotEmpty ? 'до ${UiUtil.prepareNumber(widget.investment.sumTo.toString())} ₽' : '₽'}"),
                            SizedBox(height: 12.h),
                            AppInfoRowInside(
                              title: "Ставка:",
                              value:
                                  "от ${widget.investment.ratePskFrom}% до ${widget.investment.ratePskTo}%",
                            ),
                            SizedBox(height: 12.h),
                            AppInfoRowInside(
                              title: "Срок:",
                              value: "до ${widget.investment.termTo} дней",
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
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
                    if (widget.investment.capitalizationText.isNotEmpty)
                      InfoContainer(
                        title: "Капитализация",
                        text: widget.investment.capitalizationText,
                      ),
                    if (widget.investment.earlyTerminationText.isNotEmpty)
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
              SizedBox(height: kToolbarHeight * 4),
            ],
          ),
        ),
        if (widget.investment.offerUrl.isNotEmpty)
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(
                  color: ColorStyles.black,
                  titleColor: Colors.white,
                  title: "Оформить заявку",
                  borderRadius: 100,
                  onTap: () => launchUrl(
                    Uri.parse(widget.investment.offerUrl),
                    mode: LaunchMode.externalApplication,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
