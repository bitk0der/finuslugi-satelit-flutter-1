import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_fonts.dart';
import 'package:fin_uslugi/core/utils/storage_util.dart';
import 'package:fin_uslugi/core/utils/ui_util.dart';
import 'package:fin_uslugi/core/widgets/app_small_button.dart';
import 'package:fin_uslugi/features/banks/data/models/bank_model.dart';
import 'package:fin_uslugi/features/banks/presentation/blocs/banks_cubit.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/app_image_network.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/favourite_button.dart';
import 'package:fin_uslugi/features/loans/data/models/credit/loan_main_model.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/button_rounded.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/comparison_mortgage_bloc/local/local_comparison_mortgage_bloc.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/favourite_mortgage_bloc/local/local_mortgage_bloc.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBar {
  static AppBar get({
    required String title,
    List<Widget>? actions,
    bool isBackButton = false,
  }) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorStyles.appBarColor,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: isBackButton ? 18.sp : 22.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
      leading: isBackButton
          ? Builder(
              builder: (context) => InkWell(
                onTap: () => context.maybePop(),
                child: const Icon(
                  CupertinoIcons.left_chevron,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            )
          : null,
    );
  }

  static PreferredSize getLoanAppBar(
      {required BuildContext context, required LoanMainModel loan}) {
    return PreferredSize(
      preferredSize: Size(0, 105.h),
      child: Container(
        decoration: const BoxDecoration(
            color: ColorStyles.violetColor,
            border: Border(
                bottom: BorderSide(
              color: Colors.white10,
            ))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 15.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => context.maybePop(),
                child: ButtonRounded(
                    quarterTurns: 2,
                    color: Colors.white,
                    icon: Assets.icons.arrowRight),
              ),
              SizedBox(width: 15.w),
              ClipRRect(
                  borderRadius: BorderRadius.circular(11.23),
                  child:
                      AppImageNetwork(UiUtil.getlogoUrl(loan.meta.logoSquare))),
              SizedBox(width: 13.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Микрофинансовая организация',
                      style: TextStyles.h3
                          .copyWith(color: Colors.white70, fontSize: 13.sp)),
                  SizedBox(height: 3.64.h),
                  Text(loan.title,
                      style: TextStyles.h1
                          .copyWith(fontFamily: TextStyles.fontFamily)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static PreferredSize getAboutBank({
    List<Widget>? actions,
    required BankInfo bank,
    bool isBackButton = false,
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return PreferredSize(
      preferredSize: Size(0, 255.h),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.homeBackgroundTopWidget.path),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppSmallButton(
                        onTap: () => context.maybePop(),
                        padding: 10,
                        icon: Assets.icons.buttonsIcon.arrowRight),
                    BlocBuilder(
                        bloc: GetIt.I<LocalMortgageBloc>(),
                        builder: (context, state) {
                          return AppSmallButton(
                              onTap: () {
                                GetIt.I<LocalMortgageBloc>().add(
                                    AddMortgageToFavourite(
                                        productItemModel: bank));
                              },
                              iconColor: GetIt.I<StorageUtil>()
                                      .checkInFavourite(bank.id)
                                  ? ColorStyles.greenStar
                                  : null,
                              icon: Assets.icons.buttonsIcon.star);
                        }),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    SizedBox(
                        width: 44.w,
                        height: 44.w,
                        child: AppImageNetwork(bank.logoRound)),
                    SizedBox(width: 16.w),
                    Text(
                      bank.bankName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2), width: 2),
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(14)),
                  child: Row(
                    children: [
                      Text(
                        'Рейтинг банка:',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white.withValues(alpha: 0.7)),
                      ),
                      SizedBox(width: 10.w),
                      const Spacer(),
                      Row(
                        children: [
                          Text(bank.rating,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(width: 8.w),
                          Assets.icons.yellowStar.svg()
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static PreferredSize getAbout({
    required String title,
    List<Widget>? actions,
    required BuildContext context,
    required VoidCallback onTapFavourite,
    required VoidCallback onTapComparison,
    required int id,
    String? imageUrl,
    required String bankName,
    required String bankUrlLogo,
    required int bankId,
    bool isBackButton = false,
    bool isSmall = false,
  }) {
    final banksCubit = GetIt.I<BanksCubit>();
    return PreferredSize(
        preferredSize: Size(0, isSmall ? 205.h : 255.h),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.images.homeBackgroundTopWidget.path),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppSmallButton(
                          onTap: () => context.maybePop(),
                          padding: 10,
                          icon: Assets.icons.buttonsIcon.arrowRight),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (imageUrl != null)
                            SizedBox(
                                width: 128,
                                height: 82,
                                child: AppImageNetwork(imageUrl)),
                          SizedBox(width: 43.w),
                          BlocBuilder(
                              bloc: GetIt.I<LocalMortgageBloc>(),
                              builder: (context, state) {
                                return AppSmallButton(
                                    onTap: onTapFavourite,
                                    iconColor: checkInFavourite(id)
                                        ? ColorStyles.greenStar
                                        : null,
                                    icon: Assets.icons.buttonsIcon.star);
                              }),
                          SizedBox(width: 12.w),
                          BlocBuilder(
                              bloc: GetIt.I<LocalComparisonMortgageBloc>(),
                              builder: (context, state) {
                                return AppSmallButton(
                                    onTap: onTapComparison,
                                    iconColor: checkInComparison(id)
                                        ? ColorStyles.greenStar
                                        : null,
                                    icon: Assets.icons.buttonsIcon.comparison);
                              }),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    title,
                    maxLines: 1,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20.h),
                  BlocConsumer(
                      bloc: banksCubit,
                      listener: (BuildContext ctx, Object? state) {
                        if (state is BankGetReadyState) {
                          context.router
                              .push(MoreAboutbankRoute(bank: state.bank));
                        }
                      },
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () => banksCubit.getBank(bankId),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14.w, vertical: 9.h),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    width: 2),
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(14)),
                            child: state is BankLoadingState
                                ? Center(
                                    child: SizedBox(
                                        width: 26.w,
                                        height: 26.w,
                                        child: const CircularProgressIndicator(
                                            color: Colors.white)),
                                  )
                                : Row(
                                    children: [
                                      SizedBox(
                                          width: 26.w,
                                          height: 26.w,
                                          child: AppImageNetwork(bankUrlLogo)),
                                      SizedBox(width: 10.w),
                                      Text(bankName,
                                          style: TextStyles.h2.copyWith(
                                              fontSize: 17.sp, height: 1.2)),
                                      const Spacer(),
                                      Assets.icons.arrowRight
                                          .svg(), // раскоментировать, когда будет переход на карточку банка
                                    ],
                                  ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ));
  }

  static bool checkInFavourite(int id) {
    List productsIds =
        GetIt.I<SharedPreferences>().getStringList('mortgagesIDS') ?? [];
    if (productsIds.contains('$id')) {
      return true;
    } else {
      return false;
    }
  }

  static bool checkInComparison(int id) {
    List productsIds =
        GetIt.I<SharedPreferences>().getStringList('comparisonIDS') ?? [];
    if (productsIds.contains('$id')) {
      return true;
    } else {
      return false;
    }
  }

  static PreferredSize getFavourites({
    required BuildContext context,
    String? title,
    VoidCallback? onClearTap,
  }) {
    return PreferredSize(
      preferredSize: Size(0, 100.h),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.backgroundForAppbar.path),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppSmallButton(
                          onTap: () => context.maybePop(),
                          padding: 10,
                          icon: Assets.icons.buttonsIcon.arrowRight),
                      SizedBox(width: 13.w),
                      Text(
                        title ?? 'Избранное',
                        style: TextStyle(color: Colors.white, fontSize: 17.sp),
                      ),
                    ],
                  ),
                  if (onClearTap != null)
                    InkWell(
                      onTap: onClearTap,
                      child: Text(
                        'Очистить',
                        style: TextStyle(color: Colors.white, fontSize: 17.sp),
                      ),
                    ),
                ],
              )),
        ),
      ),
    );
  }

  static PreferredSize getGradient({
    required String title,
    List<Widget>? actions,
    int? tabBarIndex,
    required BuildContext context,
    required VoidCallback onTap,
    bool isBackButton = false,
    bool isNeedFilterButtons = true,
  }) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight * 1.5),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.backgroundForAppbar.path),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 24.sp),
                      ),
                    ),
                    if (isNeedFilterButtons)
                      Row(
                        children: [
                          FavouriteButton(),
                          /* if (!title.contains('Банки')) SizedBox(width: 12.w),
                          if (!title.contains('Банки'))
                            FilterButton(onTap: onTap), */
                        ],
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static int? appliedFiltersCount(int? tabBarIndex) {
    final prefs = GetIt.I<SharedPreferences>();
    switch (tabBarIndex) {
      case 0:
        return (prefs.getStringList('creditCardsSettings') ?? [])
            .where((item) => item.isNotEmpty)
            .length;
      case 1:
        return (prefs.getStringList('debitCardsSettings') ?? [])
            .where((item) => item.isNotEmpty)
            .length;
      case 2:
        return (prefs.getStringList('creditsSettings') ?? [])
            .where((item) => item.isNotEmpty)
            .length;
      case 3:
        return (prefs.getStringList('investmentSettings') ?? [])
            .where((item) => item.isNotEmpty)
            .length;
      case 4:
        return (prefs.getStringList('mortgagesSettings') ?? [])
            .where((item) => item.isNotEmpty)
            .length;
      case null:
        return null;
      default:
        return null;
    }
  }

  static AppBar getChat({
    Widget? action,
    required String subtitle,
  }) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorStyles.appBarColor,
      title: Row(
        children: [
          Image.asset('assets/images/assistant_avatar.png', width: 40.w),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ассистент',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
      centerTitle: false,
      actions: [action ?? const SizedBox()],
      leadingWidth: 40.w,
      leading: Builder(
        builder: (context) => InkWell(
          onTap: () => context.maybePop(),
          child: const Icon(
            CupertinoIcons.left_chevron,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }

  static Widget getCreditRating({
    required String title,
    Widget? action,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 40.h, 0, 0),
      color: ColorStyles.appBarColor,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => InkWell(
                        onTap: () => context.maybePop(),
                        child: Icon(
                          CupertinoIcons.left_chevron,
                          color: Colors.black,
                          size: 26.sp,
                        ),
                      ),
                    ),
                    if (action != null) action,
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget getCashMarket() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 40.h, 0, 0),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage('assets/images/app_bar_glare.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Builder(
                  builder: (context) => InkWell(
                    onTap: () => context.maybePop(),
                    child: Icon(
                      CupertinoIcons.left_chevron,
                      color: Colors.white,
                      size: 26.sp,
                    ),
                  ),
                ),
                SizedBox(width: 14.w),
                Text(
                  'Рынок наличной валюты',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  static Widget getBankruptcy({
    required String title,
    Widget? action,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 40.h, 0, 0),
      color: ColorStyles.appBarColor,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => InkWell(
                        onTap: () => context.maybePop(),
                        child: Icon(
                          CupertinoIcons.left_chevron,
                          color: Colors.black,
                          size: 26.sp,
                        ),
                      ),
                    ),
                    if (action != null) action,
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          )
        ],
      ),
    );
  }

  static AppBar getBankruptcyWelcome({
    required String title,
    List<Widget>? actions,
  }) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
      leading: Builder(
        builder: (context) => InkWell(
          onTap: () => context.maybePop(),
          child: const Icon(
            CupertinoIcons.left_chevron,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
