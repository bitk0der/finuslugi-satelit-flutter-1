import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/features/banks/data/models/bank_model.dart';
import 'package:fin_uslugi/features/banks/presentation/pages/products_bank_screen.dart';
import 'package:fin_uslugi/features/banks/presentation/widgets/credit_mini_card.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/credit_card_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/credit_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/debit_card_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/investment_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/mortgage_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/widgets/info_container.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_app_bar.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';

import '../../../app_banner/app_banner_initial_setup.dart';
import '../../../app_banner/presentation/app_universal_banner_widget.dart';

@RoutePage()
class MoreAboutbankScreen extends StatefulWidget {
  final BankInfo bank;

  const MoreAboutbankScreen({super.key, required this.bank});

  @override
  MoreAboutbankScreenState createState() => MoreAboutbankScreenState();
}

class MoreAboutbankScreenState extends State<MoreAboutbankScreen> {
  final _creditCardSearchBloc = GetIt.I<CreditCardSearchBloc>();
  final _creditSearchBloc = GetIt.I<CreditSearchBloc>();
  final _debitCardSearchBloc = GetIt.I<DebitCardSearchBloc>();
  final _mortgageSearchBloc = GetIt.I<MortgageSearchBloc>();
  final _investmentSearchBloc = GetIt.I<InvestmentSearchBloc>();
  List<String> cardTitles = [];

  List<SvgGenImage> icons = [];

  @override
  void initState() {
    if (widget.bank.productsInfo.kredityCount > 0) {
      cardTitles.add('Кредиты на любые цели');
      icons.add(Assets.icons.buttonsIcon.walletBlack);
    }
    if (widget.bank.productsInfo.kreditnieKartyCount > 0) {
      cardTitles.add('Кредитные карты');
      icons.add(Assets.icons.buttonsIcon.creditCardBlack);
    }
    if (widget.bank.productsInfo.debetovieKartyCount > 0) {
      cardTitles.add('Дебетовые карты');
      icons.add(Assets.icons.buttonsIcon.debitCardBlack);
    }
    if (widget.bank.productsInfo.vkladyCountCount > 0) {
      cardTitles.add('Вклады');
      icons.add(Assets.icons.buttonsIcon.safeBlack);
    }
/*     if (widget.bank.productsInfo.debetovieKartyCount > 0) {
      cardTitles.add('Ипотеки');
      icons.add(Assets.icons.buttonsIcon.homeGreen);
    } */

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.backgroundColor,
      appBar: CustomAppBar.getAbout(
        isNeedFavouriteButton: false,
        context: context,
        title: widget.bank.bankName,
        bankName: widget.bank.bankName,
        imageUrl: widget.bank.logoRound,
        id: widget.bank.id,
        bankId: int.tryParse(widget.bank.id) ?? 0,
        bankUrlLogo: widget.bank.logosquare,
        onTapFavourite: () {},
        onTapComparison: () {},
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    String query = '&parent=${widget.bank.id}';
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          child: SafeArea(
            child: Column(
              children: [
                AppUniversalBannerWidget(
                  category: 'about-banki-screen',
                  banners: bannerList,
                  padding: EdgeInsets.all(0),
                ),
                SizedBox(height: 16.h),
                AlignedGridView.count(
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  mainAxisSpacing: 10.w,
                  crossAxisSpacing: 10.w,
                  itemCount: cardTitles.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) =>
                      CreditMiniCard(
                    icon: icons[index],
                    text: cardTitles[index],
                    onTap: () {
                      switch (cardTitles[index]) {
                        case 'Кредиты на любые цели':
                          _creditSearchBloc.add(CreditSearchBlocSearchEvent(
                              page: 1, query: query, isForBank: true));
                        case 'Кредитные карты':
                          _creditCardSearchBloc.add(
                              CreditCardSearchBlocSearchEvent(
                                  page: 1, query: query, isForBank: true));
                        case 'Дебетовые карты':
                          _debitCardSearchBloc.add(
                              DebitCardSearchBlocSearchEvent(
                                  page: 1, query: query, isForBank: true));
                        case 'Вклады':
                          _investmentSearchBloc.add(
                              InvestmentSearchBlocSearchEvent(
                                  page: 1, query: query, isForBank: true));
                        case 'Ипотеки':
                          _mortgageSearchBloc.add(MortgageSearchBlocSearchEvent(
                              page: 1, query: query, isForBank: true));
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ProductsBankScreen()));
                    },
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 20.h),
                        decoration: BoxDecoration(
                          color: ColorStyles.fillColor2,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Полное наименование:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: Colors.black.withValues(alpha: 0.5),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  widget.bank.fullName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 14.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Дата регистрации Банком России:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: Colors.black.withValues(alpha: 0.5),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  widget.bank.bik,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: ColorStyles.fillColor2,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 4.h),
                      InfoContainer(
                          title: "Регистрационный номер",
                          text: widget.bank.license),
                      InfoContainer(
                          title: "Официальный сайт", text: widget.bank.website),
                      InfoContainer(title: "Телефон", text: widget.bank.phone),
                      InfoContainer(
                          title: "Адрес головного офиса",
                          text: widget.bank.address),
                      InfoContainer(title: "ОГРН", text: widget.bank.ogrn),
                      InfoContainer(title: "ИНН", text: widget.bank.inn),
                      InfoContainer(title: "КПП", text: widget.bank.kpp),
                      InfoContainer(title: "ОКПО", text: widget.bank.okpo),
                      InfoContainer(title: "БИК", text: widget.bank.bik),
                      InfoContainer(title: "SWIFT", text: widget.bank.swift),
                      SizedBox(height: 17.h),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
