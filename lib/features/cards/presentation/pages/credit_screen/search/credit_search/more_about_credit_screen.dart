import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/core/widgets/app_info_row_inside.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_response.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/widgets/info_container.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_app_bar.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_button.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/favourite_mortgage_bloc/local/local_mortgage_bloc.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../app_banner/app_banner_initial_setup.dart';
import '../../../../../../app_banner/presentation/app_universal_banner_widget.dart';

@RoutePage()
class MoreAboutCreditScreen extends StatefulWidget {
  final CreditResponse credit;

  const MoreAboutCreditScreen({super.key, required this.credit});

  @override
  _MoreAboutCreditScreenState createState() => _MoreAboutCreditScreenState();
}

class _MoreAboutCreditScreenState extends State<MoreAboutCreditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.backgroundColor,
      appBar: CustomAppBar.getAbout(
        isBackButton: true,
        context: context,
        id: widget.credit.id,
        bankId: widget.credit.parentPostRelation,
        title: widget.credit.cardName,
        bankName: widget.credit.bankName,
        bankUrlLogo: widget.credit.bankLogoUrl,
        onTapFavourite: () {
          GetIt.I<LocalMortgageBloc>()
              .add(AddMortgageToFavourite(productItemModel: widget.credit));
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
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppUniversalBannerWidget(
                    category: 'about-credit-screen', banners: bannerList),
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppInfoRowInside(
                                      title: "Сумма:",
                                      value:
                                          "от ${UiUtil.prepareNumber(widget.credit.sumFrom.toString())} до ${UiUtil.prepareNumber(widget.credit.sumTo.toString())} ₽",
                                    ),
                                    SizedBox(height: 12.h),
                                    AppInfoRowInside(
                                      title: "Ставка:",
                                      value:
                                          "от ${widget.credit.rateFrom}% до ${widget.credit.rateTo}%",
                                    ),
                                    SizedBox(height: 12.h),
                                    AppInfoRowInside(
                                      title: "Срок:",
                                      value:
                                          "до ${widget.credit.termTo} месяцев",
                                    ),
                                  ],
                                ),
                              ]),
                        )
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
                        title: "Минимальная сумма кредита",
                        text: "${widget.credit.sumFrom} руб.",
                      ),
                      InfoContainer(
                        title: "Максимальная сумма кредита",
                        text: "${widget.credit.sumTo} руб.",
                      ),
                      InfoContainer(
                        title: "Время рассмотрения заявки",
                        text:
                            "${widget.credit.applicationTime} ${widget.credit.applicationUnit}",
                      ),
                      InfoContainer(
                        title: "Минимальный возраст заемщика",
                        text: "${widget.credit.minAge} лет",
                      ),
                      InfoContainer(
                        title: "Минимальный доход",
                        text: widget.credit.minIncome.isNotEmpty
                            ? "${widget.credit.minIncome} руб."
                            : "Не указан",
                      ),
                      InfoContainer(
                        title: "Стаж на последнем месте работы",
                        text: "${widget.credit.workExperienceRecent} мес.",
                      ),
                      InfoContainer(
                        title: "Цель кредита",
                        text: widget.credit.creditPurposes.isNotEmpty
                            ? widget.credit.creditPurposes.join(", ")
                            : "Не указаны",
                      ),
                      InfoContainer(
                        title: "Тип заемщика",
                        text: widget.credit.customerType,
                      ),
                      InfoContainer(
                        title: "Способ получения",
                        text: widget.credit.obtainingMethods.join(", "),
                      ),
                      InfoContainer(
                        title: "Требования к заемщику",
                        text: widget.credit.demands.join(", "),
                      ),
                      InfoContainer(
                        title: "Тип платежей",
                        text: widget.credit.paymentTypes.join(", "),
                      ),
                      InfoContainer(
                        title: "Периодичность платежей",
                        text: widget.credit.paymentFrequencies.join(", "),
                      ),
                      InfoContainer(
                        title: "Обеспечение",
                        text: widget.credit.security.join(", "),
                      ),
                      InfoContainer(
                        title: "Поручительство",
                        text: widget.credit.guarantorFilter == "noGuarantor"
                            ? "Без поручителей"
                            : "Требуется поручитель",
                      ),
                      InfoContainer(
                        title: "Обязательные документы",
                        text: widget.credit.requiredDocuments.isNotEmpty
                            ? widget.credit.requiredDocuments.join(", ")
                            : "Не указаны",
                      ),
                      InfoContainer(
                        title: "Необязательные документы",
                        text: widget.credit.optionalDocuments.isNotEmpty
                            ? widget.credit.optionalDocuments.join(", ")
                            : "Не указаны",
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Дополнительные условия',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Colors.black.withValues(alpha: 0.6),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      HtmlWidget(
                        widget.credit.additionalConditions.isNotEmpty
                            ? widget.credit.additionalConditions
                            : "Не указаны",
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Colors.black),
                      ),
                      SizedBox(height: 17.h),
                    ],
                  ),
                ),
                SizedBox(height: 70.h),
              ],
            ),
          ),
        ),
        if (widget.credit.offerUrl.isNotEmpty)
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
                    Uri.parse(widget.credit.offerUrl),
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
