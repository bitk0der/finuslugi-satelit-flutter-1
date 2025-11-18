import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/filters_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/investment_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/mortgage_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/credit_card_search/credit_card_search_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/credit_search/credit_search_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/debit_card_search/debit_card_search_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/investment_search/investment_search_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/mortgage_search/mortgage_search_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/bottom_sheet/credit_card_data_bottom_sheet.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_app_bar.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class FsinServiceScreen extends StatefulWidget {
  final int? initPage;
  const FsinServiceScreen({this.initPage, super.key});

  @override
  State<FsinServiceScreen> createState() => _FsinServiceScreenState();
}

class _FsinServiceScreenState extends State<FsinServiceScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  final prefs = GetIt.I<SharedPreferences>();
  final filtersBloc = GetIt.I<FiltersBloc>();
  @override
  void initState() {
    tabController = TabController(
        length: 5, vsync: this, initialIndex: GetIt.I<FiltersBloc>().index);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  goTo() {
    switch (tabController.index) {
      case 0:
        context.router.push(const CreditCardsFiltersRoute());
      case 1:
        context.router.push(const DebitCardsFiltersRoute());
      case 2:
        context.router.push(CreditsFiltersRoute());
      case 3:
        context.router.push(CreditsFiltersRoute(
            cacheString: 'investmentSettings',
            onSave: () => GetIt.I<InvestmentSearchBloc>()
                .add(InvestmentSearchBlocSearchEvent(page: 1))));
      case 4:
        context.router.push(CreditsFiltersRoute(
            cacheString: 'mortgagesSettings',
            onSave: () => GetIt.I<MortgageSearchBloc>()
                .add(MortgageSearchBlocSearchEvent(page: 1))));

      default:
        context.router.push(CreditsFiltersRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: filtersBloc,
        listener: (context, state) {
          if (state is ChangeTabIndexReadyState) {
            tabController.index = state.index;
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar.getGradient(
              context: context,
              title: 'Финуслуги банков',
              tabBarIndex: tabController.index,
              onTap: () => goTo(),
              isBackButton: true,
              actions: [
                IconButton(
                  onPressed: () {
                    CustomDialog.showBottomSheet(
                      context: context,
                      title: 'Информация о кредитных картах',
                      buildChild: (_) {
                        return CreditCardDataBottomSheet(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreditCardSearchScreen()),
                            );
                          },
                        );
                      },
                    );
                  },
                  padding: EdgeInsets.only(right: 5.w),
                  icon: const Icon(
                    CupertinoIcons.slider_horizontal_3,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ],
            ),
            body: Stack(alignment: Alignment.bottomCenter, children: [
              TabBarView(controller: tabController, children: const [
                CreditCardSearchScreen(),
                DebitCardSearchScreen(),
                CreditSearchScreen(),
                InvestmentSearchScreen(),
                MortgageSearchScreen()
              ]),
              Container(
                decoration: BoxDecoration(
                    color: ColorStyles.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r))),
                child: SafeArea(
                    child: TabBar(
                  tabAlignment: TabAlignment.center,
                  controller: tabController,
                  isScrollable: true,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                  indicatorWeight: 0.1,
                  indicatorColor: Colors.transparent,
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.only(right: 8.w),
                  dividerHeight: 0,
                  tabs: [
                    for (var i = 0; i < tabsUpper.length; i++) upperTab(i),
                  ],
                )),
              ),
            ]),
          );
        });
  }

  List<String> tabsUpper = [
    'Кредитные карты',
    "Дебетовые карты",
    'Кредиты',
    "Вклады",
    'Ипотека'
  ];
  Widget upperTab(int index) {
    return Tab(
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
            color: tabController.index == index ? Colors.blue : Colors.white,
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
}
