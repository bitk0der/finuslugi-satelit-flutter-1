import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/features/loans/data/models/credit/loan_main_model.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/button_rounded.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/custom_button.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_fonts.dart';
import 'package:fin_uslugi/features/app_banner/app_banner_initial_setup.dart';
import 'package:fin_uslugi/features/app_banner/presentation/app_universal_banner_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_app_bar.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class LoanDetailsPage extends StatefulWidget {
  final LoanMainModel loan;
  const LoanDetailsPage({super.key, required this.loan});

  @override
  State<LoanDetailsPage> createState() => _LoanDetailsPageState();
}

class _LoanDetailsPageState extends State<LoanDetailsPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  List<bool> isExpandedList = [];

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    fillExpandedList(0);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: ColorStyles.navbarGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar.getLoanAppBar(loan: widget.loan, context: context),
        body: _getBody(),
      ),
    );
  }

  fillExpandedList(int index) {
    switch (index) {
      case 0:
        isExpandedList = [];
      case 1:
        isExpandedList = List.generate(
            widget.loan.additionalInfo.goriachayaLiniya.length,
            (index) => false);

      case 2:
        isExpandedList = List.generate(
            widget.loan.additionalInfo.lichniyKabinet.length, (index) => false);

      case 3:
        isExpandedList = List.generate(
            widget.loan.additionalInfo.prosrochka.length, (index) => false);

      case 4:
        isExpandedList = List.generate(
            widget.loan.additionalInfo.prodlenie.length, (index) => false);

      default:
        isExpandedList = [];
    }
    setState(() {});
  }

  Widget _getBody() {
    return Stack(
      children: [
        Builder(builder: (context) {
          return Column(children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                          color: ColorStyles.fillColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorStyles.green)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Сумма займа:",
                                  style: TextStyles.h3.copyWith(
                                      color: Colors.white54, fontSize: 17.sp)),
                              Text(
                                  'от ${widget.loan.meta.sumFrom} до ${widget.loan.meta.sumTo} ₽',
                                  style: TextStyles.h3.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.sp)),
                            ],
                          ),
                          /* SizedBox(height: 14.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Срок:",
                                  style: TextStyles.h3.copyWith(
                                      color: Colors.white54, fontSize: 17.sp)),
                              Text(
                                  'от ${widget.loan.meta.termFrom} до ${widget.loan.meta.termTo} дней',
                                  style: TextStyles.h3.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.sp)),
                            ],
                          ), */
                        ],
                      ),
                    ),
                    AppUniversalBannerWidget(
                      category: 'mfo-info',
                      banners: bannerList,
                      padding: EdgeInsets.only(top: 10.h),
                    ),
                  ],
                )),
            TabBar(
                tabAlignment: TabAlignment.center,
                indicatorSize: TabBarIndicatorSize.tab,
                controller: tabController,
                indicatorWeight: 1,
                onTap: (value) {
                  fillExpandedList(value);
                },
                splashFactory: NoSplash.splashFactory,
                indicatorColor: ColorStyles.green,
                indicatorPadding: EdgeInsets.zero,
                isScrollable: true,
                dividerHeight: 0,
                tabs: [
                  for (var i = 0; i < tabsUpper.length; i++) upperTab(i),
                ]),
            Expanded(
                child: TabBarView(
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                  tab1(),
                  tab(widget.loan.additionalInfo.goriachayaLiniya,
                      'Горячая линия До зарплаты'),
                  tab(widget.loan.additionalInfo.lichniyKabinet,
                      'Личный кабинет До зарплаты'),
                  tab(widget.loan.additionalInfo.prosrochka,
                      'Пocлeдcтвия пpocpoчки зaймa в MФO До зарплаты'),
                  tab(widget.loan.additionalInfo.prodlenie,
                      'Пpoдлeниe зaймa в До зарплаты'),
                ])),
          ]);
        }),
        if (widget.loan.meta.offerUrl.isNotEmpty)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: CustomButton(
                color: ColorStyles.green,
                titleColor: Colors.black,
                title: "Получить займ",
                onTap: () => launchUrl(
                  Uri.parse(widget.loan.meta.offerUrl),
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
      child: Text(
        tabsUpper[index],
        style: TextStyles.h4.copyWith(
            color: tabController.index != index
                ? Colors.white60
                : ColorStyles.white),
      ),
    );
  }

  List<String> tabsUpper = [
    'Общая информация',
    "Горячая линия",
    'Личный кабинет',
    'Просрочка займа',
    'Продление займа'
  ];

  tab1() {
    return ListView(
      children: [
        if (widget.loan.description.isNotEmpty) getTitle('О компании'),
        if (widget.loan.description.isNotEmpty)
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: HtmlWidget(
                widget.loan.description,
                textStyle: TextStyles.h3.copyWith(
                    fontSize: 17.sp, color: Colors.white.withOpacity(0.8)),
              )),
        getTitle('Общая информация'),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                color: ColorStyles.fillColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 10)
                ]),
            child: Column(
              children: [
                InfoContainer(
                  title: "Полное наименование:",
                  text: widget.loan.meta.nameFull,
                ),
                InfoContainer(
                    title: "Дaтa peгиcтpaции Бaнкoм Poccии:",
                    text: DateFormat('d MMMM, yyyy')
                        .format(widget.loan.meta.registerDate)),
                SizedBox(height: 17.h),
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            'Реквизиты',
            style: TextStyles.h1
                .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                color: ColorStyles.fillColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 10)
                ]),
            child: Column(
              children: [
                InfoContainer(
                  title: "Регистрационный номер",
                  text: widget.loan.meta.registerDateTs.toString(),
                ),
                InfoContainer(
                  title: "Официальный сайт",
                  text: widget.loan.meta.website,
                ),
                InfoContainer(
                  title: "Телефон",
                  text: widget.loan.meta.phoneMain,
                ),
                InfoContainer(
                  title: "Адрес головного офиса",
                  text: widget.loan.meta.addressMain,
                ),
                InfoContainer(
                  title: "ОГРН",
                  text: widget.loan.meta.ogrn,
                ),
                InfoContainer(
                  title: "ИНН",
                  text: widget.loan.meta.inn,
                ),
                InfoContainer(
                  title: "КПП",
                  text: widget.loan.meta.kpp,
                ),
                InfoContainer(
                  title: "ОКПО",
                  text: widget.loan.meta.okpo,
                ),
                SizedBox(height: 17.h),
              ],
            )),
        SizedBox(height: 100.h),
      ],
    );
  }

  getTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Text(
        title,
        style: TextStyles.h1
            .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

  tab(List<FAQ> faqs, String title) {
    return ListView(children: [
      getTitle(title),
      for (int i = 0; i < faqs.length; i++) expansionTile(faqs, i),
      SizedBox(height: 100.h),
    ]);
  }

  Widget expansionTile(List<FAQ> faqs, int i) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          color: ColorStyles.fillColor,
          border: Border.all(
              color: isExpandedList.isEmpty || isExpandedList.length <= i
                  ? Colors.transparent
                  : isExpandedList[i]
                      ? ColorStyles.green
                      : Colors.transparent),
          borderRadius: BorderRadius.circular(14)),
      child: Theme(
        data: ThemeData(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.only(top: 15.h),
          expansionAnimationStyle: AnimationStyle(),
          onExpansionChanged: (value) {
            setState(() {
              isExpandedList[i] = value;
            });
          },
          trailing: AnimatedRotation(
              turns: isExpandedList.isEmpty || isExpandedList.length <= i
                  ? 0
                  : isExpandedList[i]
                      ? .5
                      : 0,
              duration: const Duration(milliseconds: 200),
              child: ButtonRounded(
                  quarterTurns: 1,
                  color: Colors.white,
                  icon: Assets.icons.arrowRight)),
          backgroundColor: ColorStyles.fillColor,
          title: Text(faqs[i].question,
              style: TextStyles.h2.copyWith(fontSize: 20.sp)),
          children: [
            Text(faqs[i].answer,
                style: TextStyles.h3
                    .copyWith(color: Colors.white.withOpacity(0.8)))
          ],
        ),
      ),
    );
  }
}
