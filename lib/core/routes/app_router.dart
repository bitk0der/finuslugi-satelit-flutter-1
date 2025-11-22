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
import 'package:fin_uslugi/features/coupons/data/models/retailer_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/coupon_details_page.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/data/models/coupon_favourite_model.dart';
import 'package:fin_uslugi/features/favourites/presentation/pages/home/favourites_page.dart';
import 'package:fin_uslugi/features/fin_service/presentation/pages/fin_service_screen.dart';
import 'package:fin_uslugi/features/loans/data/models/credit/loan_main_model.dart';
import 'package:fin_uslugi/features/loans/presentation/pages/loan_details_page.dart';
import 'package:fin_uslugi/features/loans/presentation/pages/loans_filters_page.dart';
import 'package:fin_uslugi/features/loans/presentation/pages/loans_main_screen.dart';
import 'package:fin_uslugi/features/local_notifications/data/models/response_message_model.dart';
import 'package:fin_uslugi/features/local_notifications/presentation/pages/background_notifications_screen.dart';
import 'package:fin_uslugi/features/local_notifications/presentation/pages/notification_details_page.dart';
import 'package:fin_uslugi/features/service/presentation/pages/main_service_page.dart';
import 'package:flutter/widgets.dart';
import 'package:fin_uslugi/core/app_root_screen.dart';
import 'package:fin_uslugi/features/home/presentation/pages/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter(GlobalKey<NavigatorState>? navigatorKey)
      : super(navigatorKey: navigatorKey);
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
            children: [
              AutoRoute(page: HomeRoute.page, path: ''),
              AutoRoute(page: BanksRoute.page, path: 'banks'),
              AutoRoute(page: MoreAboutbankRoute.page, path: 'banks_details'),
              AutoRoute(page: FavouritesRoute.page, path: 'favourites_route'),
              AutoRoute(
                page: MoreAboutCreditCardRoute.page,
                path: 'more_about_credit_card_route',
              ),
              AutoRoute(
                page: MoreAboutCreditRoute.page,
                path: 'more_about_credits_route',
              ),
              AutoRoute(
                page: MoreAboutDebitCardRoute.page,
                path: 'more_about_debit_card_route',
              ),
              AutoRoute(
                page: MoreAboutMortgageRoute.page,
                path: 'more_about_mortgage',
              ),
              AutoRoute(
                page: MoreAboutinvestmentRoute.page,
                path: 'more_about_investment',
              ),
            ],
          ),
          AutoRoute(
            page: SelectionRouter.page,
            path: 'selection',
            children: [
              AutoRoute(page: FsinServiceRoute.page, path: ''),
              AutoRoute(page: FavouritesRoute.page, path: 'favourites_route'),
              AutoRoute(page: LoanDetailsRoute.page, path: 'loan_details'),
              AutoRoute(page: LoansFiltersRoute.page, path: 'loans_filters'),
              AutoRoute(page: CouponDetailsRoute.page, path: 'coupons_details'),
              AutoRoute(
                page: MoreAboutCreditCardRoute.page,
                path: 'more_about_credit_card_route',
              ),
              AutoRoute(
                page: MoreAboutCreditRoute.page,
                path: 'more_about_credits_route',
              ),
              AutoRoute(
                page: MoreAboutDebitCardRoute.page,
                path: 'more_about_debit_card_route',
              ),
              AutoRoute(
                page: MoreAboutMortgageRoute.page,
                path: 'more_about_mortgage',
              ),
              AutoRoute(
                page: MoreAboutinvestmentRoute.page,
                path: 'more_about_investment',
              ),
            ],
          ),
          AutoRoute(
            page: ServiceRouter.page,
            path: 'service',
            children: [
              AutoRoute(page: MainServiceRoute.page, path: ''),
              AutoRoute(page: FavouritesRoute.page, path: 'favourites_page'),
              AutoRoute(
                  page: BackgroundNotificationsRoute.page,
                  path: 'background_notifications_screen'),
              AutoRoute(
                  page: NotificationDetailsRoute.page,
                  path: 'notifications_details_screen')
            ],
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

@RoutePage(name: 'SelectionRouter')
class SelectionRouterPage extends AutoRouter {
  const SelectionRouterPage({super.key});
}

@RoutePage(name: 'ServiceRouter')
class ServiceRouterPage extends AutoRouter {
  const ServiceRouterPage({super.key});
}
