// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AppRootScreen]
class AppRootRoute extends PageRouteInfo<void> {
  const AppRootRoute({List<PageRouteInfo>? children})
      : super(AppRootRoute.name, initialChildren: children);

  static const String name = 'AppRootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppRootScreen();
    },
  );
}

/// generated route for
/// [AppWebView]
class AppWebViewPage extends PageRouteInfo<AppWebViewPageArgs> {
  AppWebViewPage({
    Key? key,
    String url = '',
    String title = '',
    bool isNeedBackButton = true,
    PreferredSizeWidget? appBar,
    List<PageRouteInfo>? children,
  }) : super(
          AppWebViewPage.name,
          args: AppWebViewPageArgs(
            key: key,
            url: url,
            title: title,
            isNeedBackButton: isNeedBackButton,
            appBar: appBar,
          ),
          initialChildren: children,
        );

  static const String name = 'AppWebViewPage';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppWebViewPageArgs>(
        orElse: () => const AppWebViewPageArgs(),
      );
      return AppWebView(
        key: args.key,
        url: args.url,
        title: args.title,
        isNeedBackButton: args.isNeedBackButton,
        appBar: args.appBar,
      );
    },
  );
}

class AppWebViewPageArgs {
  const AppWebViewPageArgs({
    this.key,
    this.url = '',
    this.title = '',
    this.isNeedBackButton = true,
    this.appBar,
  });

  final Key? key;

  final String url;

  final String title;

  final bool isNeedBackButton;

  final PreferredSizeWidget? appBar;

  @override
  String toString() {
    return 'AppWebViewPageArgs{key: $key, url: $url, title: $title, isNeedBackButton: $isNeedBackButton, appBar: $appBar}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AppWebViewPageArgs) return false;
    return key == other.key &&
        url == other.url &&
        title == other.title &&
        isNeedBackButton == other.isNeedBackButton &&
        appBar == other.appBar;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      url.hashCode ^
      title.hashCode ^
      isNeedBackButton.hashCode ^
      appBar.hashCode;
}

/// generated route for
/// [BackgroundNotificationsScreen]
class BackgroundNotificationsRoute extends PageRouteInfo<void> {
  const BackgroundNotificationsRoute({List<PageRouteInfo>? children})
      : super(BackgroundNotificationsRoute.name, initialChildren: children);

  static const String name = 'BackgroundNotificationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BackgroundNotificationsScreen();
    },
  );
}

/// generated route for
/// [BanksScreen]
class BanksRoute extends PageRouteInfo<void> {
  const BanksRoute({List<PageRouteInfo>? children})
      : super(BanksRoute.name, initialChildren: children);

  static const String name = 'BanksRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BanksScreen();
    },
  );
}

/// generated route for
/// [CreditCardsFiltersScreen]
class CreditCardsFiltersRoute extends PageRouteInfo<void> {
  const CreditCardsFiltersRoute({List<PageRouteInfo>? children})
      : super(CreditCardsFiltersRoute.name, initialChildren: children);

  static const String name = 'CreditCardsFiltersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreditCardsFiltersScreen();
    },
  );
}

/// generated route for
/// [CreditsFiltersScreen]
class CreditsFiltersRoute extends PageRouteInfo<CreditsFiltersRouteArgs> {
  CreditsFiltersRoute({
    Key? key,
    String? cacheString,
    VoidCallback? onSave,
    List<PageRouteInfo>? children,
  }) : super(
          CreditsFiltersRoute.name,
          args: CreditsFiltersRouteArgs(
            key: key,
            cacheString: cacheString,
            onSave: onSave,
          ),
          initialChildren: children,
        );

  static const String name = 'CreditsFiltersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreditsFiltersRouteArgs>(
        orElse: () => const CreditsFiltersRouteArgs(),
      );
      return CreditsFiltersScreen(
        key: args.key,
        cacheString: args.cacheString,
        onSave: args.onSave,
      );
    },
  );
}

class CreditsFiltersRouteArgs {
  const CreditsFiltersRouteArgs({this.key, this.cacheString, this.onSave});

  final Key? key;

  final String? cacheString;

  final VoidCallback? onSave;

  @override
  String toString() {
    return 'CreditsFiltersRouteArgs{key: $key, cacheString: $cacheString, onSave: $onSave}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreditsFiltersRouteArgs) return false;
    return key == other.key &&
        cacheString == other.cacheString &&
        onSave == other.onSave;
  }

  @override
  int get hashCode => key.hashCode ^ cacheString.hashCode ^ onSave.hashCode;
}

/// generated route for
/// [DebitCardsFiltersScreen]
class DebitCardsFiltersRoute extends PageRouteInfo<void> {
  const DebitCardsFiltersRoute({List<PageRouteInfo>? children})
      : super(DebitCardsFiltersRoute.name, initialChildren: children);

  static const String name = 'DebitCardsFiltersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DebitCardsFiltersScreen();
    },
  );
}

/// generated route for
/// [FavouritesPage]
class FavouritesRoute extends PageRouteInfo<void> {
  const FavouritesRoute({List<PageRouteInfo>? children})
      : super(FavouritesRoute.name, initialChildren: children);

  static const String name = 'FavouritesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavouritesPage();
    },
  );
}

/// generated route for
/// [FsinServiceScreen]
class FsinServiceRoute extends PageRouteInfo<FsinServiceRouteArgs> {
  FsinServiceRoute({int? initPage, Key? key, List<PageRouteInfo>? children})
      : super(
          FsinServiceRoute.name,
          args: FsinServiceRouteArgs(initPage: initPage, key: key),
          initialChildren: children,
        );

  static const String name = 'FsinServiceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FsinServiceRouteArgs>(
        orElse: () => const FsinServiceRouteArgs(),
      );
      return FsinServiceScreen(initPage: args.initPage, key: args.key);
    },
  );
}

class FsinServiceRouteArgs {
  const FsinServiceRouteArgs({this.initPage, this.key});

  final int? initPage;

  final Key? key;

  @override
  String toString() {
    return 'FsinServiceRouteArgs{initPage: $initPage, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FsinServiceRouteArgs) return false;
    return initPage == other.initPage && key == other.key;
  }

  @override
  int get hashCode => initPage.hashCode ^ key.hashCode;
}

/// generated route for
/// [HomeRouterPage]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter({List<PageRouteInfo>? children})
      : super(HomeRouter.name, initialChildren: children);

  static const String name = 'HomeRouter';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeRouterPage();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LoanDetailsPage]
class LoanDetailsRoute extends PageRouteInfo<LoanDetailsRouteArgs> {
  LoanDetailsRoute({
    Key? key,
    required LoanMainModel loan,
    List<PageRouteInfo>? children,
  }) : super(
          LoanDetailsRoute.name,
          args: LoanDetailsRouteArgs(key: key, loan: loan),
          initialChildren: children,
        );

  static const String name = 'LoanDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoanDetailsRouteArgs>();
      return LoanDetailsPage(key: args.key, loan: args.loan);
    },
  );
}

class LoanDetailsRouteArgs {
  const LoanDetailsRouteArgs({this.key, required this.loan});

  final Key? key;

  final LoanMainModel loan;

  @override
  String toString() {
    return 'LoanDetailsRouteArgs{key: $key, loan: $loan}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoanDetailsRouteArgs) return false;
    return key == other.key && loan == other.loan;
  }

  @override
  int get hashCode => key.hashCode ^ loan.hashCode;
}

/// generated route for
/// [LoansFiltersPage]
class LoansFiltersRoute extends PageRouteInfo<void> {
  const LoansFiltersRoute({List<PageRouteInfo>? children})
      : super(LoansFiltersRoute.name, initialChildren: children);

  static const String name = 'LoansFiltersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoansFiltersPage();
    },
  );
}

/// generated route for
/// [LoansScreen]
class LoansRoute extends PageRouteInfo<void> {
  const LoansRoute({List<PageRouteInfo>? children})
      : super(LoansRoute.name, initialChildren: children);

  static const String name = 'LoansRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoansScreen();
    },
  );
}

/// generated route for
/// [MoreAboutCreditCardScreen]
class MoreAboutCreditCardRoute
    extends PageRouteInfo<MoreAboutCreditCardRouteArgs> {
  MoreAboutCreditCardRoute({
    Key? key,
    required CreditCardResponse creditCard,
    List<PageRouteInfo>? children,
  }) : super(
          MoreAboutCreditCardRoute.name,
          args: MoreAboutCreditCardRouteArgs(key: key, creditCard: creditCard),
          initialChildren: children,
        );

  static const String name = 'MoreAboutCreditCardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MoreAboutCreditCardRouteArgs>();
      return MoreAboutCreditCardScreen(
        key: args.key,
        creditCard: args.creditCard,
      );
    },
  );
}

class MoreAboutCreditCardRouteArgs {
  const MoreAboutCreditCardRouteArgs({this.key, required this.creditCard});

  final Key? key;

  final CreditCardResponse creditCard;

  @override
  String toString() {
    return 'MoreAboutCreditCardRouteArgs{key: $key, creditCard: $creditCard}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MoreAboutCreditCardRouteArgs) return false;
    return key == other.key && creditCard == other.creditCard;
  }

  @override
  int get hashCode => key.hashCode ^ creditCard.hashCode;
}

/// generated route for
/// [MoreAboutCreditScreen]
class MoreAboutCreditRoute extends PageRouteInfo<MoreAboutCreditRouteArgs> {
  MoreAboutCreditRoute({
    Key? key,
    required CreditResponse credit,
    List<PageRouteInfo>? children,
  }) : super(
          MoreAboutCreditRoute.name,
          args: MoreAboutCreditRouteArgs(key: key, credit: credit),
          initialChildren: children,
        );

  static const String name = 'MoreAboutCreditRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MoreAboutCreditRouteArgs>();
      return MoreAboutCreditScreen(key: args.key, credit: args.credit);
    },
  );
}

class MoreAboutCreditRouteArgs {
  const MoreAboutCreditRouteArgs({this.key, required this.credit});

  final Key? key;

  final CreditResponse credit;

  @override
  String toString() {
    return 'MoreAboutCreditRouteArgs{key: $key, credit: $credit}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MoreAboutCreditRouteArgs) return false;
    return key == other.key && credit == other.credit;
  }

  @override
  int get hashCode => key.hashCode ^ credit.hashCode;
}

/// generated route for
/// [MoreAboutDebitCardScreen]
class MoreAboutDebitCardRoute
    extends PageRouteInfo<MoreAboutDebitCardRouteArgs> {
  MoreAboutDebitCardRoute({
    Key? key,
    required DebitCardResponse debitCard,
    required double income,
    required double cashback,
    List<PageRouteInfo>? children,
  }) : super(
          MoreAboutDebitCardRoute.name,
          args: MoreAboutDebitCardRouteArgs(
            key: key,
            debitCard: debitCard,
            income: income,
            cashback: cashback,
          ),
          initialChildren: children,
        );

  static const String name = 'MoreAboutDebitCardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MoreAboutDebitCardRouteArgs>();
      return MoreAboutDebitCardScreen(
        key: args.key,
        debitCard: args.debitCard,
        income: args.income,
        cashback: args.cashback,
      );
    },
  );
}

class MoreAboutDebitCardRouteArgs {
  const MoreAboutDebitCardRouteArgs({
    this.key,
    required this.debitCard,
    required this.income,
    required this.cashback,
  });

  final Key? key;

  final DebitCardResponse debitCard;

  final double income;

  final double cashback;

  @override
  String toString() {
    return 'MoreAboutDebitCardRouteArgs{key: $key, debitCard: $debitCard, income: $income, cashback: $cashback}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MoreAboutDebitCardRouteArgs) return false;
    return key == other.key &&
        debitCard == other.debitCard &&
        income == other.income &&
        cashback == other.cashback;
  }

  @override
  int get hashCode =>
      key.hashCode ^ debitCard.hashCode ^ income.hashCode ^ cashback.hashCode;
}

/// generated route for
/// [MoreAboutMortgageScreen]
class MoreAboutMortgageRoute extends PageRouteInfo<MoreAboutMortgageRouteArgs> {
  MoreAboutMortgageRoute({
    Key? key,
    required MortgageResponse mortgage,
    List<PageRouteInfo>? children,
  }) : super(
          MoreAboutMortgageRoute.name,
          args: MoreAboutMortgageRouteArgs(key: key, mortgage: mortgage),
          initialChildren: children,
        );

  static const String name = 'MoreAboutMortgageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MoreAboutMortgageRouteArgs>();
      return MoreAboutMortgageScreen(key: args.key, mortgage: args.mortgage);
    },
  );
}

class MoreAboutMortgageRouteArgs {
  const MoreAboutMortgageRouteArgs({this.key, required this.mortgage});

  final Key? key;

  final MortgageResponse mortgage;

  @override
  String toString() {
    return 'MoreAboutMortgageRouteArgs{key: $key, mortgage: $mortgage}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MoreAboutMortgageRouteArgs) return false;
    return key == other.key && mortgage == other.mortgage;
  }

  @override
  int get hashCode => key.hashCode ^ mortgage.hashCode;
}

/// generated route for
/// [MoreAboutbankScreen]
class MoreAboutbankRoute extends PageRouteInfo<MoreAboutbankRouteArgs> {
  MoreAboutbankRoute({
    Key? key,
    required BankInfo bank,
    List<PageRouteInfo>? children,
  }) : super(
          MoreAboutbankRoute.name,
          args: MoreAboutbankRouteArgs(key: key, bank: bank),
          initialChildren: children,
        );

  static const String name = 'MoreAboutbankRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MoreAboutbankRouteArgs>();
      return MoreAboutbankScreen(key: args.key, bank: args.bank);
    },
  );
}

class MoreAboutbankRouteArgs {
  const MoreAboutbankRouteArgs({this.key, required this.bank});

  final Key? key;

  final BankInfo bank;

  @override
  String toString() {
    return 'MoreAboutbankRouteArgs{key: $key, bank: $bank}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MoreAboutbankRouteArgs) return false;
    return key == other.key && bank == other.bank;
  }

  @override
  int get hashCode => key.hashCode ^ bank.hashCode;
}

/// generated route for
/// [MoreAboutinvestmentScreen]
class MoreAboutinvestmentRoute
    extends PageRouteInfo<MoreAboutinvestmentRouteArgs> {
  MoreAboutinvestmentRoute({
    Key? key,
    required InvestmentResponse investment,
    List<PageRouteInfo>? children,
  }) : super(
          MoreAboutinvestmentRoute.name,
          args: MoreAboutinvestmentRouteArgs(key: key, investment: investment),
          initialChildren: children,
        );

  static const String name = 'MoreAboutinvestmentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MoreAboutinvestmentRouteArgs>();
      return MoreAboutinvestmentScreen(
        key: args.key,
        investment: args.investment,
      );
    },
  );
}

class MoreAboutinvestmentRouteArgs {
  const MoreAboutinvestmentRouteArgs({this.key, required this.investment});

  final Key? key;

  final InvestmentResponse investment;

  @override
  String toString() {
    return 'MoreAboutinvestmentRouteArgs{key: $key, investment: $investment}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MoreAboutinvestmentRouteArgs) return false;
    return key == other.key && investment == other.investment;
  }

  @override
  int get hashCode => key.hashCode ^ investment.hashCode;
}

/// generated route for
/// [NotificationDetailsPage]
class NotificationDetailsRoute
    extends PageRouteInfo<NotificationDetailsRouteArgs> {
  NotificationDetailsRoute({
    Key? key,
    required MessagesResponse messageResponse,
    List<PageRouteInfo>? children,
  }) : super(
          NotificationDetailsRoute.name,
          args: NotificationDetailsRouteArgs(
            key: key,
            messageResponse: messageResponse,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationDetailsRouteArgs>();
      return NotificationDetailsPage(
        key: args.key,
        messageResponse: args.messageResponse,
      );
    },
  );
}

class NotificationDetailsRouteArgs {
  const NotificationDetailsRouteArgs({this.key, required this.messageResponse});

  final Key? key;

  final MessagesResponse messageResponse;

  @override
  String toString() {
    return 'NotificationDetailsRouteArgs{key: $key, messageResponse: $messageResponse}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NotificationDetailsRouteArgs) return false;
    return key == other.key && messageResponse == other.messageResponse;
  }

  @override
  int get hashCode => key.hashCode ^ messageResponse.hashCode;
}

/// generated route for
/// [SelectionRouterPage]
class SelectionRouter extends PageRouteInfo<void> {
  const SelectionRouter({List<PageRouteInfo>? children})
      : super(SelectionRouter.name, initialChildren: children);

  static const String name = 'SelectionRouter';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SelectionRouterPage();
    },
  );
}

/// generated route for
/// [ServiceRouterPage]
class ServiceRouter extends PageRouteInfo<void> {
  const ServiceRouter({List<PageRouteInfo>? children})
      : super(ServiceRouter.name, initialChildren: children);

  static const String name = 'ServiceRouter';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ServiceRouterPage();
    },
  );
}
