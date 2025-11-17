import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/translator.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/core/widgets/app_info_row_with_icon.dart';
import 'package:fin_uslugi/features/cards/data/models/mortgages/mortgage_response.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/widgets/info_container.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_button.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
/*       appBar: CustomAppBar.getAbout(
        isBackButton: true,
        context: context,
        id: widget.mortgage.id,
        bankId: int.tryParse(widget.mortgage.parentPostRelation) ?? 0,
        title: widget.mortgage.cardName,
        bankName: widget.mortgage.bankName,
        bankUrlLogo: widget.mortgage.bankLogo,
        isSmall: true,
        onTapFavourite: () {
          GetIt.I<LocalMortgageBloc>()
              .add(AddMortgageToFavourite(productItemModel: widget.mortgage));
        },
        onTapComparison: () {
          GetIt.I<LocalComparisonMortgageBloc>()
              .add(AddMortgageToComparison(productItemModel: widget.mortgage));
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
                  category: 'about-ipoteka-screen', banners: bannerList),
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
                              "от ${UiUtil.prepareNumber(widget.mortgage.sumFrom.toString())} до ${UiUtil.prepareNumber(widget.mortgage.sumTo.toString())} ₽",
                        ),
                        SizedBox(height: 12.h),
                        AppInfoRowWithIcon(
                          title: "Ставка:",
                          icon: Assets.icons.buttonsIcon.discountGreen,
                          value:
                              "от ${widget.mortgage.ratePskFrom}% до ${widget.mortgage.ratePskTo}%",
                        ),
                        SizedBox(height: 12.h),
                        AppInfoRowWithIcon(
                          title: "Срок:",
                          icon: Assets.icons.buttonsIcon.timeGreen,
                          value:
                              "до ${widget.mortgage.termTo} ${Translator.translateCommaSeparatedString(widget.mortgage.unitTo)}",
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
              SizedBox(height: 100.h),
            ],
          ),
        ),
        if (widget.mortgage.offerUrl.isNotEmpty)
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
                  Uri.parse(widget.mortgage.offerUrl),
                  mode: LaunchMode.externalApplication,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
