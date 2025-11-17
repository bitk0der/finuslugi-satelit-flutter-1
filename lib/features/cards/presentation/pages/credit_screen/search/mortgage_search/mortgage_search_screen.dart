import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart';
import 'package:fin_uslugi/features/cards/data/models/mortgages/mortgage_response.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/mortgage_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/mortgage_search/more_about_mortgage_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/mortgage_search/widgets/mortgage_card_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/widgets/crdit_error_body.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/widgets/credit_loading_body.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/widgets/empty_list_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MortgageSearchScreen extends StatefulWidget {
  const MortgageSearchScreen({super.key});

  @override
  _MortgageSearchScreenState createState() => _MortgageSearchScreenState();
}

class _MortgageSearchScreenState extends State<MortgageSearchScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // Гарантирует сохранение состояния
  final _bloc = GetIt.I<MortgageSearchBloc>();

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: ColorStyles.backgroundColor,
      body: _getBodyBuilder(),
    );
  }

  Widget _getBodyBuilder() {
    return BlocListener(
        bloc: _bloc,
        listener: (context, state) {
          if (state is MortgageSearchBlocReadyState) {
            _response = state.response;
            fillData();
          }
        },
        child: BlocBuilder(
          bloc: _bloc,
          buildWhen: (_, state) => state is! MortgageSearchBlocPageLoadingState,
          builder: (context, state) {
            if (state is MortgageSearchBlocReadyState) {
              if (state.response.products.isEmpty) {
                return const EmptyListPlaceholder();
              } else {
                return body();
              }
            } else if (state is MortgageSearchForBankBlocReadyState) {
              return body();
            } else if (state is MortgageSearchBlocLoadingState) {
              return const CreditLoadingBody();
            } else if (state is MortgageSearchBlocErrorState) {
              return const CreditErrorBody();
            } else {
              return const SizedBox();
            }
          },
        ));
  }

  body() {
    return PagedListView<int, Product>.separated(
        pagingController: _pagingController,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(bottom: 120.h, top: 12.h),
        builderDelegate: PagedChildBuilderDelegate<Product>(
            newPageProgressIndicatorBuilder: (context) => progressIndicator(),
            noItemsFoundIndicatorBuilder: (context) => Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Программ не найдено, попробуйте изменить параметры поиска',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                  ),
                ),
            itemBuilder: (context, item, index) {
              MortgageResponse? mortgageResponse;
              if (item is MortgageResponse) mortgageResponse = item;
              return MortgageCardWidget(
                mortgage: mortgageResponse!,
                onMoreButtonPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MoreAboutMortgageScreen(mortgage: mortgageResponse!),
                  ),
                ),
              );
            }),
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 12.h));
  }

  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 1);

  late Response _response;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Widget progressIndicator() {
    return Center(
        child: SizedBox(
            width: 32.w,
            height: 32.w,
            child: CircularProgressIndicator(
                color: Theme.of(context).indicatorColor)));
  }

  search() {
    _pagingController.itemList?.clear();
    _bloc.add(MortgageSearchBlocSearchEvent(page: 1));
  }

  Future<void> _fetchPage(int pageKey) async {
    _bloc.add(MortgageSearchBlocSearchEvent(page: pageKey));
  }

  fillData() {
    if (_response.page == 1) _pagingController.itemList?.clear();
    final isLastPage = _response.page >= _response.totalPages;
    final nextPageKey = _response.page + 1;
    if (isLastPage) {
      _pagingController.appendLastPage(_response.products);
      return;
    } else {
      _pagingController.appendPage(_response.products, nextPageKey);
    }
  }
}
