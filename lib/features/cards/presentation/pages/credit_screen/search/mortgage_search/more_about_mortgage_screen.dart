import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/translator.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/core/widgets/app_info_row_inside.dart';
import 'package:fin_uslugi/features/cards/data/models/mortgages/mortgage_response.dart';
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
class MoreAboutMortgageScreen extends StatefulWidget {
  final MortgageResponse mortgage;

  const MoreAboutMortgageScreen({super.key, required this.mortgage});

  @override
  _MoreAboutmortgageScreenState createState() =>
      _MoreAboutmortgageScreenState();
}

class _MoreAboutmortgageScreenState extends State<MoreAboutMortgageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.backgroundColor,
      appBar: CustomAppBar.getAbout(
        isBackButton: true,
        context: context,
        id: widget.mortgage.id,
        bankId: int.tryParse(widget.mortgage.parentPostRelation) ?? 0,
        title: widget.mortgage.cardName,
        bankName: widget.mortgage.bankName,
        bankUrlLogo: widget.mortgage.bankLogo,
        imageUrl: widget.mortgage.bankLogo,
        onTapFavourite: () {
          GetIt.I<LocalMortgageBloc>()
              .add(AddMortgageToFavourite(productItemModel: widget.mortgage));
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
                  category: 'about-ipoteka-screen', banners: bannerList),
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
                                  "от ${UiUtil.prepareNumber(widget.mortgage.sumFrom.toString())} до ${UiUtil.prepareNumber(widget.mortgage.sumTo.toString())} ₽",
                            ),
                            SizedBox(height: 12.h),
                            AppInfoRowInside(
                              title: "Ставка:",
                              value:
                                  "от ${widget.mortgage.ratePskFrom}% до ${widget.mortgage.ratePskTo}%",
                            ),
                            SizedBox(height: 12.h),
                            AppInfoRowInside(
                              title: "Срок:",
                              value:
                                  "до ${widget.mortgage.termTo} ${Translator.translateCommaSeparatedString(widget.mortgage.unitTo)}",
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
                  'Условия ипотечного кредитования',
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
                      title: "Минимальная сумма кредита",
                      text: '${widget.mortgage.sumFrom} руб.',
                    ),
                    InfoContainer(
                      title: "Максимальная сумма кредита",
                      text: '${widget.mortgage.sumTo} руб.',
                    ),
                    InfoContainer(
                      title: "Процентная ставка",
                      text:
                          "${widget.mortgage.ratePskFrom} - ${widget.mortgage.ratePskTo}%",
                    ),
                    InfoContainer(
                      title: "Первоначальный взнос",
                      text: "от ${widget.mortgage.initialAmountMin}%",
                    ),
                    InfoContainer(
                      title: "Минимальный возраст заемщика",
                      text:
                          "от ${widget.mortgage.loanAge} года", // Может быть фиксированным текстом, если нет в модели
                    ),
                    InfoContainer(
                      title: "Стаж на последнем месте работы",
                      text:
                          "от ${widget.mortgage.experienceRecent} мес.", // Может быть фиксированным текстом, если нет в модели
                    ),
                    InfoContainer(
                      title: "Цель кредита",
                      text: widget.mortgage.creditPurposes.join(", "),
                    ),
                    InfoContainer(
                      title: "Доступные программы",
                      text: widget.mortgage.programs.join(", "),
                    ),
                    InfoContainer(
                      title: "Тип заемщика",
                      text: widget.mortgage
                          .customerType, // Может быть фиксированным текстом, если нет в модели
                    ),
                    InfoContainer(
                      title: "Требования к заемщику",
                      text: widget.mortgage.demands
                          .join(', '), // Может быть фиксированным текстом
                    ),
                    InfoContainer(
                        title: "Обеспечение",
                        text: widget.mortgage.security.join(', ')),
                    InfoContainer(
                      title: "Обязательные документы для подачи заявки",
                      text: widget.mortgage.documentsRequired
                          .join(', '), // Фиксированный текст
                    ),
                    /*   InfoContainer(
                      title: "Подтверждение дохода",
                      text:
                          "Справка 2-НДФЛ; Справка по форме банка; Портал 'Госуслуги'; Выписка по счету", // Фиксированный текст
                    ), */
                    if (widget.mortgage.insurance.isNotEmpty)
                      InfoContainer(
                          title: "Условия страхования",
                          text: widget.mortgage.insurance
                              .join(', ') // Фиксированный текст
                          ),
                    InfoContainer(
                      title: "Дополнительные условия",
                      text: widget.mortgage.additionalConditions,
                    ),
                    SizedBox(height: 17.h),
                  ],
                ),
              ),
              SizedBox(height: kToolbarHeight * 4),
            ],
          ),
        ),
        if (widget.mortgage.offerUrl.isNotEmpty)
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
                    Uri.parse(widget.mortgage.offerUrl),
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
