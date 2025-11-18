import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:fin_uslugi/features/loans/data/models/credit/loan_main_model.dart';
import 'package:fin_uslugi/features/loans/data/models/credit/search_responses/product.dart';
import 'package:fin_uslugi/features/loans/data/models/credit/search_responses/response.dart';
import 'package:fin_uslugi/features/loans/presentation/blocs/credit_search_bloc.dart';
import 'package:fin_uslugi/features/loans/presentation/theme/calculator_colors.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/app_error_widget.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/calculator_app_bar.dart';
import 'package:fin_uslugi/features/loans/presentation/widgets/loan_card_widget.dart';
import 'package:fin_uslugi/features/programms/presentation/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_fonts.dart';
import 'package:fin_uslugi/features/app_banner/app_banner_initial_setup.dart';
import 'package:fin_uslugi/features/app_banner/presentation/app_universal_banner_widget.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';

@RoutePage()
class LoansScreen extends StatefulWidget {
  const LoansScreen({super.key});

  @override
  State<LoansScreen> createState() => _LoansScreenState();
}

class _LoansScreenState extends State<LoansScreen> {
  late CreditSearchBloc _creditSearchBloc;
  late Response _response;
  final PagingController<int, Product> _pagingController = PagingController(
    firstPageKey: 1,
  );
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    _creditSearchBloc = GetIt.I<CreditSearchBloc>();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  search() {
    _pagingController.itemList?.clear();
    _creditSearchBloc.add(
      CreditSearchBlocSearchEvent(page: 1, query: textEditingController.text),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    _creditSearchBloc.add(
      CreditSearchBlocSearchEvent(
        page: pageKey,
        query: textEditingController.text,
      ),
    );
  }

  fillData() {
    final isLastPage = _response.page >= _response.totalPages;
    final nextPageKey = _response.page + 1;
    if (_response.page == 1 && !isLastPage) {
      _pagingController.itemList?.clear();
      _pagingController.appendPage(_response.products, nextPageKey);
      return;
    }
    if (isLastPage) {
      _pagingController.appendLastPage(_response.products);
    } else {
      _pagingController.appendPage(_response.products, nextPageKey);
    }
  }

  Widget progressIndicator() {
    return Center(
      child: SizedBox(
        width: 32.w,
        height: 32.w,
        child: const CircularProgressIndicator(color: ColorStyles.green),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      top: false,
      child: BlocConsumer(
        bloc: _creditSearchBloc,
        listener: (context, CreditSearchBlocState state) async {
          if (state is CreditSearchBlocReadyState) {
            _response = state.response;
            fillData();
          }
        },
        builder: (context, state) {
          if (state is CreditSearchBlocErrorConnectionState) {
            return AppErrorWidget(onTap: () => search());
          }
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: CalculatorColors.gradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: CalculatorAppBar(
                consultantName: 'Каталог',
                isNeedBackButton: false,
                style: TextStyles.h1.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              body: state is CreditSearchBlocLoadingState
                  ? Column(
                      children: [
                        upperWidget(theme),
                        Expanded(flex: 2, child: progressIndicator()),
                      ],
                    )
                  : state is CreditSearchBlocErrorState
                      ? AppErrorWidget(
                          onTap: () => _creditSearchBloc.add(
                            CreditSearchBlocSearchEvent(page: 1, query: ''),
                          ),
                        )
                      : PagedListView<int, Product>.separated(
                          pagingController: _pagingController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          builderDelegate: PagedChildBuilderDelegate<Product>(
                            newPageProgressIndicatorBuilder: (context) =>
                                progressIndicator(),
                            noItemsFoundIndicatorBuilder: (context) => Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Программ не найдено, попробуйте изменить параметры поиска',
                                      textAlign: TextAlign.center,
                                      style: TextStyles.h2,
                                    ),
                                    upperWidget(theme),
                                  ],
                                ),
                              ),
                            ),
                            itemBuilder: (context, item, index) {
                              var loan = (item as LoanMainModel);
                              if (index == 0) {
                                return Column(
                                  children: [
                                    upperWidget(theme, 0),
                                    AppUniversalBannerWidget(
                                      category: 'mfo-list',
                                      banners: bannerList,
                                      padding: EdgeInsets.fromLTRB(
                                        20.w,
                                        0,
                                        20.w,
                                        10.h,
                                      ),
                                    ),
                                    LoanCardWidget(
                                      loan: loan,
                                      onMoreAboutButtonPressed: () => context
                                          .router
                                          .push(LoanDetailsRoute(loan: loan)),
                                    ),
                                  ],
                                );
                              }
                              return LoanCardWidget(
                                onMoreAboutButtonPressed: () =>
                                    context.router.push(
                                  LoanDetailsRoute(loan: loan),
                                ),
                                loan: loan,
                              );
                            },
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(height: 12.h),
                        ),
            ),
          );
        },
      ),
    );
  }

  upperWidget(ThemeData theme, [double? vertical]) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical ?? 12.h,
        horizontal: 20.w,
      ),
      child: Row(
        children: [
          Flexible(child: textField(theme)),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () => context.router.push(const LoansFiltersRoute()),
            child: Container(
              width: 44.w,
              height: 44.w,
              padding: EdgeInsets.all(11.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorStyles.fillColor,
                border: Border.all(color: Colors.white38),
              ),
              child: Assets.icons.safeIcon.svg(),
            ),
          ),
        ],
      ),
    );
  }

  Widget textField(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: AppCardLayout(
        padding: EdgeInsets.zero,
        radius: 100.r,
        color: ColorStyles.fillColor,
        child: AppTextField(
          controller: textEditingController,
          textInputAction: TextInputAction.search,
          hintStyle: TextStyles.h3.copyWith(color: Colors.white54),
          prefixIcon: GestureDetector(
            onTap: () => search(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Assets.icons.safeIcon.svg(),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 15.h,
          ),
          hintText: 'Название организации...',
          onSubmit: (p0) => search(),
        ),
      ),
    );
  }
}
