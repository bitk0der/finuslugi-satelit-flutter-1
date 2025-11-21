import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/core/widgets/app_info_row_inside.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_card_response.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/widgets/info_container.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_app_bar.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/favourite_mortgage_bloc/local/local_mortgage_bloc.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../app_banner/app_banner_initial_setup.dart';
import '../../../../../../app_banner/presentation/app_universal_banner_widget.dart';
import '../../../../widgets/custom_button.dart';

@RoutePage()
class MoreAboutCreditCardScreen extends StatefulWidget {
  final CreditCardResponse creditCard;

  const MoreAboutCreditCardScreen({super.key, required this.creditCard});

  @override
  _MoreAboutCreditCardScreenState createState() =>
      _MoreAboutCreditCardScreenState();
}

class _MoreAboutCreditCardScreenState extends State<MoreAboutCreditCardScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      appBar: CustomAppBar.getAbout(
        isBackButton: true,
        context: context,
        title: widget.creditCard.cardName,
        bankName: widget.creditCard.bankName,
        imageUrl: widget.creditCard.additionalImageUrl,
        id: widget.creditCard.id,
        bankId: widget.creditCard.parentPostRelation,
        bankUrlLogo: widget.creditCard.bankLogoUrl,
        onTapFavourite: () {
          GetIt.I<LocalMortgageBloc>()
              .add(AddMortgageToFavourite(productItemModel: widget.creditCard));
        },
        onTapComparison: () {},
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Stack(
      children: [
        Builder(builder: (context) {
          return NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 16.h),
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
                                  color:
                                      ColorStyles.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: ColorStyles.blueText)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppInfoRowInside(
                                    title: "Кредитный лимит:",
                                    value:
                                        "До ${UiUtil.prepareNumber(widget.creditCard.maxCreditSum.toString())} ₽",
                                  ),
                                  SizedBox(height: 12.h),
                                  AppInfoRowInside(
                                    title: "Льготный период:",
                                    value:
                                        '${widget.creditCard.interestFreePeriod} дней'
                                            .toString(),
                                  ),
                                  SizedBox(height: 12.h),
                                  AppInfoRowInside(
                                    title: "Обслуживание:",
                                    value:
                                        "${widget.creditCard.firstYearServiceCost == 0 ? 'Бесплатно' : widget.creditCard.firstYearServiceCost}",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))),
                /*    SliverToBoxAdapter(
                    child: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
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
                                title: "Кредитный лимит:",
                                icon: Assets.icons.buttonsIcon.discountGreen,
                                value:
                                    "До ${UiUtil.prepareNumber(widget.creditCard.maxCreditSum.toString())} ₽",
                              ),
                              SizedBox(height: 12.h),
                              AppInfoRowWithIcon(
                                title: "Льготный период:",
                                icon: Assets.icons.buttonsIcon.rubleGreen,
                                value:
                                    '${widget.creditCard.interestFreePeriod} дней'
                                        .toString(),
                              ),
                              SizedBox(height: 12.h),
                              AppInfoRowWithIcon(
                                title: "Обслуживание:",
                                icon: Assets.icons.buttonsIcon.timeGreen,
                                value:
                                    "${widget.creditCard.firstYearServiceCost == 0 ? 'Бесплатно' : widget.creditCard.firstYearServiceCost}",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )), */
                /*  SizedBox(height: 20.h),
              if (widget.creditCard.offerUrl.isNotEmpty)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: CustomButton(
                      color: ColorStyles.redColor,
                      title: "Оформить карту",
                      borderRadius: 100,
                      onTap: () => launchUrl(
                        Uri.parse(widget.creditCard.offerUrl),
                        mode: LaunchMode.externalApplication,
                      ),
                    ),
                  ),
                ), */
              ];
            },
            body: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorStyles.fillColor2,
                      borderRadius: BorderRadius.circular(14)),
                  margin: EdgeInsets.all(16.w),
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: tabController,
                      indicatorWeight: 0.1,
                      splashFactory: NoSplash.splashFactory,
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.white,
                      labelPadding: EdgeInsets.symmetric(vertical: 5),
                      indicator: BoxDecoration(
                          color: ColorStyles.black,
                          borderRadius: BorderRadius.circular(14)),
                      dividerHeight: 0,
                      tabs: [
                        for (var i = 0; i < tabsUpper.length; i++) upperTab(i),
                      ]),
                ),
                Expanded(
                    child: TabBarView(
                        controller: tabController,
                        children: [tab1(), tab2(), tab3()])),
              ],
            ),
          );
        }),
        if (widget.creditCard.offerUrl.isNotEmpty)
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
                    Uri.parse(widget.creditCard.offerUrl),
                    mode: LaunchMode.externalApplication,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget upperTab(int index) {
    return Tab(text: tabsUpper[index]);
  }

  List<String> tabsUpper = ['Условия', "Требования", 'Бонусы'];

  ListView tab1() {
    return ListView(
      children: [
        AppUniversalBannerWidget(
            category: 'about-credit-card-screen', banners: bannerList),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
              children: [
                InfoContainer(
                  title: "Минимальная сумма кредита",
                  text: "${widget.creditCard.minCreditSum} руб.",
                ),
                InfoContainer(
                  title: "Максимальная сумма кредита",
                  text: "${widget.creditCard.maxCreditSum} руб.",
                ),
                InfoContainer(
                  title: "Беспроцентный период на покупки",
                  text: "${widget.creditCard.interestFreePeriod} дней",
                ),
                const InfoContainer(
                  title: "Беспроцентный период на снятие наличных",
                  text:
                      "—", // Так как в модели поле отсутствует, оставляем фиксированное значение
                ),
                InfoContainer(
                  title: "Минимальный платеж",
                  text: widget.creditCard.minPayment,
                ),
                InfoContainer(
                  title: "Рассрочка",
                  text: "${widget.creditCard.installmentMonths} месяцев",
                ),
                InfoContainer(
                  title: "Платежная система карты",
                  text: widget.creditCard.paymentSystem,
                ),
                InfoContainer(
                  title: "Оплата смартфоном",
                  text: widget.creditCard.smartphonePayments.join(', '),
                ),
                InfoContainer(
                  title: "Стоимость обслуживания в первый год",
                  text: "${widget.creditCard.firstYearServiceCost} руб.",
                ),
                InfoContainer(
                  title: "Стоимость обслуживания со второго года",
                  text: "${widget.creditCard.secondYearServiceCost} руб.",
                ),
                InfoContainer(
                  title: "Класс карты",
                  text: widget.creditCard.cardClass,
                ),
                InfoContainer(
                  title: "Особенности карты",
                  text: widget.creditCard.features.join(', '),
                ),
                InfoContainer(
                  title: "Преимущества",
                  text: widget.creditCard.advantages.join(', '),
                ),
                InfoContainer(
                  title: "Комиссия за снятие наличных",
                  text: "до ${widget.creditCard.cashWithdrawalFee} %",
                ),
                InfoContainer(
                  title: "Места снятия наличных",
                  text: widget.creditCard.withdrawalLocations.join(', '),
                ),
                if (widget.creditCard.partnerBanks.isNotEmpty)
                  InfoContainer(
                    title: "Банки-партнеры",
                    text: widget.creditCard.partnerBanks.join(', '),
                  ),
                SizedBox(height: 17.h),
              ],
            )),
        SizedBox(height: 70.h),
      ],
    );
  }

  ListView tab2() {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Text(
          'Требования для получения кредитной карты',
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
          child: Column(children: [
            InfoContainer(
              title: "Возраст:",
              text: "от ${widget.creditCard.minAge} лет",
            ),
            InfoContainer(
              title: "Стаж на последнем месте работы:",
              text: "${widget.creditCard.workExperience} мес.",
            ),
            if (widget.creditCard.incomeDocuments.join(', ') != 'none')
              InfoContainer(
                title: "Подтверждение дохода:",
                text: widget.creditCard.incomeDocuments.join(', '),
              ),
            if (widget.creditCard.requiredDocuments.isNotEmpty)
              InfoContainer(
                title: "Необходимые документы:",
                text: widget.creditCard.requiredDocuments.join(', '),
              ),
            if (widget.creditCard.clientRequirements.isNotEmpty)
              InfoContainer(
                title: "Требования к клиенту:",
                text: widget.creditCard.clientRequirements.join(', '),
              ),
            SizedBox(height: 17.h),
          ])),
      SizedBox(height: 70.h),
    ]);
  }

  ListView tab3() {
    return ListView(
      children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(
              'Бонусная программа и кэшбэк',
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
            child: Column(children: [
              InfoContainer(
                title: "Тип бонусов:",
                text: widget.creditCard.bonusType,
              ),
              InfoContainer(
                title: "Максимальный кэшбэк:",
                text: widget.creditCard.maxCashback,
              ),
              if (widget.creditCard.cashbackCategories.isNotEmpty)
                InfoContainer(
                  title: "Категории кэшбэка:",
                  text: widget.creditCard.cashbackCategories.join(', '),
                ),
              if (widget.creditCard.cashbackDescription.isNotEmpty)
                InfoContainer(
                  title: "Описание кэшбэка:",
                  text: widget.creditCard.cashbackDescription,
                ),
              SizedBox(height: 17.h),
            ]),
          ),
          SizedBox(height: 70.h),
        ])
      ],
    );
  }
}
