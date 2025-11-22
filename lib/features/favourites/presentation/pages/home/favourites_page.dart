import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_fonts.dart';
import 'package:fin_uslugi/core/widgets/empty_widget.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_card_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/debit_card_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:fin_uslugi/features/cards/data/models/investment/investment_response.dart';
import 'package:fin_uslugi/features/cards/data/models/mortgages/mortgage_response.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/credit_card_search/widgets/credit_card_card_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/credit_search/widgets/credit_card_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/debit_card_search/widgets/debit_card_card_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/investment_search/widget/investment_card_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/mortgage_search/widgets/mortgage_card_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_app_bar.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/data/models/coupon_favourite_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/widgets/coupon_details_widget.dart';
import 'package:fin_uslugi/features/loans/data/models/credit/loan_main_model.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/loan_card_widget.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/favourite_mortgage_bloc/local/local_mortgage_bloc.dart';
import 'package:fin_uslugi/features/programms/presentation/widgets/app_error_widget.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage>
    with TickerProviderStateMixin {
  late LocalMortgageBloc _localMortgageBloc;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 7, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    _localMortgageBloc = GetIt.I<LocalMortgageBloc>();
    _localMortgageBloc.add(GetFavouritesMortgages());
    super.initState();
  }

  Widget getWidgetByCategoryType(Product product) {
    switch (product.productType) {
      case BankingCategory.credits:
        return CreditCardWidget(
            credit: (product as CreditResponse),
            onMoreButtonPressed: () =>
                context.router.push(MoreAboutCreditRoute(credit: product)));
      case BankingCategory.creditCards:
        return CreditCardCardWidget(
            creditCard: (product as CreditCardResponse),
            onMoreAboutButtonPressed: () => context.router
                .push(MoreAboutCreditCardRoute(creditCard: product)));
      case BankingCategory.debitCards:
        return DebitCardCardWidget(
            debitCard: (product as DebitCardResponse),
            onMoreAboutButtonPressed: () => context.router.push(
                MoreAboutDebitCardRoute(
                    debitCard: product, income: 0, cashback: 0)));

      case BankingCategory.deposits:
        return InvestmentCardWidget(
            investment: (product as InvestmentResponse),
            onMoreButtonPressed: () => context.router
                .push(MoreAboutinvestmentRoute(investment: product)));

      case BankingCategory.mortgages:
        return MortgageCardWidget(
            mortgage: (product as MortgageResponse),
            onMoreButtonPressed: () =>
                context.router.push(MoreAboutMortgageRoute(mortgage: product)));

      case BankingCategory.loans:
        return LoanCardWidget(
          onMoreAboutButtonPressed: () => context.router.push(
            LoanDetailsRoute(loan: product),
          ),
          loan: (product as LoanMainModel),
        );

      case BankingCategory.promocodes:
        return CouponDetailsWidget(
            couponWithRetailer: (product as CouponFavouriteModel));

      /*   case BankingCategory.banks:
        return BankCardWidget(
            bank: (product as BankInfo),
            onMoreAboutButtonPressed: () =>
                context.router.push(MoreAboutbankRoute(
                  bank: product,
                ))); */
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _localMortgageBloc,
      listener: (context, LocalMortgageState state) async {
        if (state is MortgageSuccessfullyAddedToFavourite) {
          setState(() {});
          _localMortgageBloc.add(GetFavouritesMortgages());
        }
        if (state is MortgageSuccessfullyDeletedFromFavourite) {
          setState(() {});
          _localMortgageBloc.add(GetFavouritesMortgages());
        }
        if (state is AllProductsRemovedFromFavourites) {
          setState(() {});
          _localMortgageBloc.add(GetFavouritesMortgages());
        }
      },
      child: BlocBuilder(
          bloc: _localMortgageBloc,
          builder: (context, state) {
            if (state is LocalError) {
              return AppErrorWidget(
                  onTap: () =>
                      _localMortgageBloc.add(GetFavouritesMortgages()));
            }
            if (state is GetFavouritesLocalMortgagesSuccessfull) {
              List<Product> favouritesProducts = state.favouritesMortgages
                  .where(
                      (element) => element.productType != BankingCategory.banks)
                  .toList();

              return Scaffold(
                appBar: CustomAppBar.getFavourites(
                    context: context,
                    onClearTap: () =>
                        _localMortgageBloc.add(DeleteAllProducts())),
                body: Stack(alignment: Alignment.bottomCenter, children: [
                  TabBarView(controller: tabController, children: [
                    _getBody(favouritesProducts, BankingCategory.loans),
                    _getBody(favouritesProducts, BankingCategory.creditCards),
                    _getBody(favouritesProducts, BankingCategory.debitCards),
                    _getBody(favouritesProducts, BankingCategory.credits),
                    _getBody(favouritesProducts, BankingCategory.deposits),
                    _getBody(favouritesProducts, BankingCategory.mortgages),
                    _getBody(favouritesProducts, BankingCategory.promocodes),
                  ]),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorStyles.lightViolet,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            topRight: Radius.circular(12.r))),
                    child: SafeArea(
                        child: TabBar(
                      tabAlignment: TabAlignment.center,
                      controller: tabController,
                      isScrollable: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 14.h),
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
              /* _getBody(favouritesProducts) */
              /*    TabBar(
                                indicatorSize: TabBarIndicatorSize.tab,
                                controller: tabController,
                                indicatorWeight: 1,
                                splashFactory: NoSplash.splashFactory,
                                indicatorColor: ColorStyles.blueText,
                                indicatorPadding: EdgeInsets.zero,
                                labelPadding:
                                    EdgeInsets.symmetric(horizontal: 8.w),
                                dividerHeight: 1,
                                dividerColor: Colors.black.withValues(alpha: 0.2),
                                tabs: [
                                  for (var i = 0; i < tabsUpper.length; i++)
                                    upperTab(i),
                                ]),
                            Expanded(
                                child: TabBarView(
                                    controller: tabController,
                                    children: [
                                  _getBody(favouritesProducts),
                                  _getBody(favouritesBanks, true)
                                ])), */
            }
            return Center(
              child: SizedBox(
                  width: 32.w,
                  height: 32.w,
                  child: CircularProgressIndicator(
                      color: Theme.of(context).indicatorColor)),
            );
          }),
    );
  }

  Widget upperTab(int index) {
    return Tab(
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
            color:
                tabController.index == index ? ColorStyles.black : Colors.white,
            borderRadius: BorderRadius.circular(12.r)),
        child: Text(
          tabsUpper[index],
          style: TextStyle(
              color: tabController.index != index
                  ? Colors.black
                  : ColorStyles.white),
        ),
      ),
    );
  }

  List<String> tabsUpper = [
    "Займы",
    "Кредитные карты",
    "Дебетовые карты",
    "Кредиты",
    "Вклады",
    "Ипотека",
    "Промокоды"
  ];

  Widget _getBody(
      List<Product> favouritesProductsFromCache, BankingCategory category,
      [bool isABank = false]) {
    var favouritesProducts = favouritesProductsFromCache
        .where((prod) => prod.productType == category)
        .toList();
    return favouritesProducts.isEmpty
        ? EmptyWidget(
            assetGenImage: Assets.images.emptyPageStar,
            title: isABank
                ? 'Вы не добавляли ни один из банков в избранное'
                : 'Вы не добавляли ${tabsUpper[tabController.index].toLowerCase()} в избранное',
            subtitle: isABank
                ? 'Добавьте хотя бы один банк, чтобы следить за его финансовыми услугами с этой страницы'
                : 'Перейдите в каталог и добавьте финуслугу для быстрого перехода к ней',
          )
        : ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            itemCount: favouritesProducts.length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              if (index == 0) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 4.h),
                        child: Text(
                          'Вы добавили ${favouritesProducts.length} ${!isABank ? 'финуслуг' : 'банка'} в избранное',
                          style: TextStyles.h2.copyWith(
                              fontSize: 14,
                              color: Colors.black.withValues(alpha: 0.7)),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      getWidgetByCategoryType(favouritesProducts[index])
                    ]);
              }
              return getWidgetByCategoryType(favouritesProducts[index]);
            }),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 12.h),
          );
  }
}
