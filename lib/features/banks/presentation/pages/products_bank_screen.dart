import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/widgets/empty_widget.dart';
import 'package:fin_uslugi/features/banks/data/models/bank_model.dart';
import 'package:fin_uslugi/features/banks/presentation/widgets/bank_card_widget.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_card_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/debit_card_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:fin_uslugi/features/cards/data/models/investment/investment_response.dart';
import 'package:fin_uslugi/features/cards/data/models/mortgages/mortgage_response.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/credit_card_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/credit_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/debit_card_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/investment_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/mortgage_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/credit_card_search/widgets/credit_card_card_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/credit_search/widgets/credit_card_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/debit_card_search/widgets/debit_card_card_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/investment_search/widget/investment_card_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/mortgage_search/widgets/mortgage_card_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_app_bar.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/favourite_mortgage_bloc/local/local_mortgage_bloc.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class ProductsBankScreen extends StatefulWidget {
  const ProductsBankScreen({super.key});

  @override
  State<ProductsBankScreen> createState() => _ProductsBankScreenState();
}

class _ProductsBankScreenState extends State<ProductsBankScreen>
    with TickerProviderStateMixin {
  late LocalMortgageBloc _localMortgageBloc;
  late TabController tabController;
  List<Product> bankingProducts = [];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
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
            isFavourite: true,
            onMoreButtonPressed: () =>
                context.router.push(MoreAboutCreditRoute(credit: product)));
      case BankingCategory.creditCards:
        return CreditCardCardWidget(
            creditCard: (product as CreditCardResponse),
            isFavourite: true,
            onMoreAboutButtonPressed: () => context.router
                .push(MoreAboutCreditCardRoute(creditCard: product)));
      case BankingCategory.debitCards:
        return DebitCardCardWidget(
            debitCard: (product as DebitCardResponse),
            isFavourite: true,
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

      case BankingCategory.banks:
        return BankCardWidget(
            bank: (product as BankInfo),
            onMoreAboutButtonPressed: () =>
                context.router.push(MoreAboutbankRoute(
                  bank: product,
                )));
    }
  }

  final creditCardSearchBloc = GetIt.I<CreditCardSearchBloc>();
  final debitCardSearchBloc = GetIt.I<DebitCardSearchBloc>();
  final creditSearchBloc = GetIt.I<CreditSearchBloc>();
  final mortgageSearchBloc = GetIt.I<MortgageSearchBloc>();
  final investmentSearchBloc = GetIt.I<InvestmentSearchBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: investmentSearchBloc,
        listener: (context, state) {
          if (state is InvestmentSearchForBankBlocReadyState) {
            bankingProducts = state.response.products;
          }
        },
        builder: (context, state) {
          return BlocConsumer(
              bloc: mortgageSearchBloc,
              listener: (context, state) {
                if (state is MortgageSearchForBankBlocReadyState) {
                  bankingProducts = state.response.products;
                }
              },
              builder: (context, state) {
                return BlocConsumer(
                    bloc: creditCardSearchBloc,
                    listener: (context, state) {
                      if (state is CreditCardForBankSearchBlocReadyState) {
                        bankingProducts = state.response.products;
                      }
                    },
                    builder: (context, state) {
                      return BlocConsumer(
                          bloc: debitCardSearchBloc,
                          listener: (context, state) {
                            if (state is DebitCardForBankSearchBlocReadyState) {
                              bankingProducts = state.response.products;
                            }
                          },
                          builder: (context, state) {
                            return BlocConsumer(
                                bloc: creditSearchBloc,
                                listener: (context, state) {
                                  if (state
                                      is CreditSearchForBankBlocReadyState) {
                                    bankingProducts = state.response.products;
                                  }
                                },
                                builder: (context, state) {
                                  return SafeArea(
                                      top: false,
                                      child: Scaffold(
                                          appBar: CustomAppBar.getFavourites(
                                              context: context,
                                              title: bankingProducts.isEmpty
                                                  ? ''
                                                  : getTitle(bankingProducts
                                                      .first.productType)),
                                          body: bankingProducts.isEmpty
                                              ? Center(
                                                  child: SizedBox(
                                                      width: 32.w,
                                                      height: 32.w,
                                                      child: CircularProgressIndicator(
                                                          color: Theme.of(
                                                                  context)
                                                              .indicatorColor)),
                                                )
                                              : _getBody(bankingProducts)));
                                });
                          });
                    });
              });
        });
  }

  String getTitle(BankingCategory category) {
    switch (category) {
      case BankingCategory.creditCards:
        return 'Кредитные карты';
      case BankingCategory.debitCards:
        return 'Дебетовые карты';
      case BankingCategory.credits:
        return 'Кредиты';
      case BankingCategory.deposits:
        return 'Вклады';
      case BankingCategory.mortgages:
        return 'Ипотеки';
      default:
        return '';
    }
  }

  Widget _getBody(List<Product> favouritesProducts) {
    return favouritesProducts.isEmpty
        ? EmptyWidget(
            assetGenImage: Assets.images.emptyPageStar,
            title: 'Вы не добавляли финуслуги в избранное',
            subtitle:
                'Не потеряйте финуслугу банка и быстро перейдите в ее подробности для оформления',
          )
        : ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            itemCount: favouritesProducts.length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return getWidgetByCategoryType(favouritesProducts[index]);
            }),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 12.h),
          );
  }
}
