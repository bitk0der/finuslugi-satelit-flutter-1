import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/features/app_banner/presentation/app_web_view.dart';
import 'package:fin_uslugi/features/banks/data/models/bank_model.dart';
import 'package:fin_uslugi/features/banks/presentation/pages/banks_screen.dart';
import 'package:fin_uslugi/features/banks/presentation/pages/more_about_bank_screen.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_card_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/debit_card_response.dart';
import 'package:fin_uslugi/features/cards/data/models/investment/investment_response.dart';
import 'package:fin_uslugi/features/cards/data/models/mortgages/mortgage_response.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/credit_card_search/more_about_credit_card_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/credit_search/more_about_credit_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/debit_card_search/more_about_debit_card_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/investment_search/more_about_investment_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/mortgage_search/more_about_mortgage_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/filters/credit_cards_filters_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/filters/credits_filters_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/filters/debit_cards_filters_screen.dart';
import 'package:fin_uslugi/features/favourites/presentation/pages/home/favourites_page.dart';
import 'package:fin_uslugi/features/fin_service/presentation/pages/fin_service_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:fin_uslugi/core/app_root_screen.dart';
import 'package:fin_uslugi/features/home/presentation/pages/home_screen.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        initial: true,
        path: '/',
        page: AppRootRoute.page,
        children: [
          AutoRoute(
            page: HomeRouter.page,
            path: 'home',
            children: [AutoRoute(page: HomeRoute.page, path: '')],
          ),
        ],
      ),
    ];
  }
}

@RoutePage(name: 'HomeRouter')
class HomeRouterPage extends AutoRouter {
  const HomeRouterPage({super.key});
}

@RoutePage(name: 'FinServiceMainRouter')
class FinServiceMainRouterPage extends AutoRouter {
  const FinServiceMainRouterPage({super.key});
}
