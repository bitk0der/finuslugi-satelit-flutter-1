import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/core/widgets/app_info_row_with_icon.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/debit_card_response.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/widgets/info_container.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../app_banner/app_banner_initial_setup.dart';
import '../../../../../../app_banner/presentation/app_universal_banner_widget.dart';
import '../../../../widgets/custom_button.dart';

@RoutePage()
class MoreAboutDebitCardScreen extends StatefulWidget {
  final DebitCardResponse debitCard;
  final double income;
  final double cashback;

  const MoreAboutDebitCardScreen({
    super.key,
    required this.debitCard,
    required this.income,
    required this.cashback,
  });

  @override
  _MoreAboutDebitCardScreenState createState() =>
      _MoreAboutDebitCardScreenState();
}

class _MoreAboutDebitCardScreenState extends State<MoreAboutDebitCardScreen>
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
      backgroundColor: ColorStyles.backgroundColor,
/*       appBar: CustomAppBar.getAbout(
        isBackButton: true,
        context: context,
        title: widget.debitCard.cardName,
        id: widget.debitCard.id,
        bankId: widget.debitCard.parentPostRelation,
        bankName: widget.debitCard.bankName,
        imageUrl: widget.debitCard.fullImageUrl,
        bankUrlLogo: widget.debitCard.bankLogoUrl,
        onTapFavourite: () {
          GetIt.I<LocalMortgageBloc>()
              .add(AddMortgageToFavourite(productItemModel: widget.debitCard));
        },
        onTapComparison: () {
          GetIt.I<LocalComparisonMortgageBloc>()
              .add(AddMortgageToComparison(productItemModel: widget.debitCard));
        },
      ), */
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
                                title: "Кэшбэк:",
                                icon: Assets.icons.buttonsIcon.discountGreen,
                                value:
                                    '${widget.debitCard.cashbackValue.toInt().toString()}%',
                              ),
                              SizedBox(height: 12.h),
                              AppInfoRowWithIcon(
                                title: "% на остаток:",
                                icon: Assets.icons.buttonsIcon.rubleGreen,
                                value: UiUtil.prepareNumber(widget
                                    .debitCard.balanceincomerate
                                    .toString()),
                              ),
                              SizedBox(height: 12.h),
                              AppInfoRowWithIcon(
                                title: "Обслуживание:",
                                icon: Assets.icons.buttonsIcon.timeGreen,
                                value: widget.debitCard
                                            .maintenancePriceFirstYear ==
                                        0
                                    ? 'Бесплатно'
                                    : '${widget.debitCard.maintenancePriceFirstYear} в год',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                /*  SizedBox(height: 20.h),
          if (widget.debitCard.offerUrl.isNotEmpty)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: CustomButton(
                  color: ColorStyles.redColor,
                  title: "Оформить карту",
                  borderRadius: 100,
                  onTap: () => launchUrl(
                    Uri.parse(widget.debitCard.offerUrl),
                    mode: LaunchMode.externalApplication,
                  ),
                ),
              ),
            ), */
              ];
            },
            body: Column(
              children: [
                TabBar(
                    tabAlignment: TabAlignment.center,
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: tabController,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                    indicatorWeight: 0.1,
                    splashFactory: NoSplash.splashFactory,
                    indicatorColor: Colors.transparent,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
                    dividerHeight: 0,
                    tabs: [
                      for (var i = 0; i < tabsUpper.length; i++) upperTab(i),
                    ]),
                Expanded(
                    child: TabBarView(
                        controller: tabController,
                        children: [tab1(), tab2(), tab3()])),
              ],
            ),
          );
        }),
        if (widget.debitCard.offerUrl.isNotEmpty)
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
                  Uri.parse(widget.debitCard.offerUrl),
                  mode: LaunchMode.externalApplication,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget upperTab(int index) {
    return Tab(
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
            color: tabController.index == index
                ? ColorStyles.blueButton
                : Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r)),
        child: Text(
          tabsUpper[index],
          style: TextStyle(
              color: tabController.index != index
                  ? Colors.black.withOpacity(0.4)
                  : ColorStyles.blue),
        ),
      ),
    );
  }

  List<String> tabsUpper = [
    'Условия',
    "Требования",
    'Кэшбэк и бонусы' /*,"Вклады", 'Ипотека' */
  ];

  tab1() {
    return ListView(
      children: [
        AppUniversalBannerWidget(
            category: 'about-debit-card-screen', banners: bannerList),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoContainer(
                  title: "Лимит операции",
                  text: widget.debitCard.operationLimit.split('.')[0],
                ),
                InfoContainer(
                  title: "Платежная система карты",
                  text: widget.debitCard.paymentSystems.join(", "),
                ),
                InfoContainer(
                  title: "Оплата смартфоном",
                  text: widget.debitCard.smartphonePayments.join(", "),
                ),
                InfoContainer(
                  title: "Стоимость обслуживания в первый год",
                  text: "${widget.debitCard.maintenancePriceFirstYear} ₽",
                ),
                InfoContainer(
                  title: "Стоимость обслуживания со второго года",
                  text: "${widget.debitCard.maintenancePriceSecondYear} ₽",
                ),
                InfoContainer(
                  title: "Класс карты",
                  text: widget.debitCard.cardClass,
                ),
                InfoContainer(
                  title: "Особенности карты",
                  text: widget.debitCard.cardFeatures.join(", "),
                ),
                if (widget.debitCard.benefits.isNotEmpty)
                  InfoContainer(
                    title: "Преимущества",
                    text: widget.debitCard.benefits.join(", "),
                  ),
                if (widget.debitCard.withdrawalComment.isNotEmpty) ...[
                  Text(
                    'Комиссия за снятие наличных',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  HtmlWidget(
                    widget.debitCard.withdrawalComment,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.black),
                  ),
                ],
                SizedBox(height: 20.h),
                InfoContainer(
                  title: "Места снятия наличных",
                  text: widget.debitCard.withdrawalLocations.join(", "),
                ),
                SizedBox(height: 12.h),
                if (widget.debitCard.cashbackDescription.isNotEmpty) ...[
                  Text(
                    'Дополнительные условия',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  HtmlWidget(
                    widget.debitCard.cashbackDescription,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.black),
                  ),
                ],
                SizedBox(height: 20.h),
              ],
            )),
        SizedBox(height: 20.h),
      ],
    );
  }

  tab2() {
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
              text: "от ${widget.debitCard.ageFrom} лет",
            ),
            if (widget.debitCard.documents.isNotEmpty)
              InfoContainer(
                title: "Необходимые документы:",
                text: widget.debitCard.documents.join(','),
              ),
            /* InfoContainer(
              title: "Требования к клиенту:",
              text: "от ${widget.debitCard.smartphonePayments} лет",
            ), */
            SizedBox(height: 17.h)
          ]))
    ]);
  }

  tab3() {
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
                title: "Бонусная категория:",
                text: widget.debitCard.cashbackCategories.join(','),
              ),
              /* InfoContainer(
                title: "На что можно потратить баллы:",
                text: widget.debitCard.status,
              ), */
              SizedBox(height: 17.h)
            ]),
          )
        ]),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Описание бонусной программы',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: Colors.black),
              ),
              SizedBox(height: 14.h),
              HtmlWidget(widget.debitCard.cashbackDescription),
            ],
          ),
        )
      ],
    );
  }
}
