import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/features/app_banner/app_banner_initial_setup.dart';
import 'package:fin_uslugi/features/app_banner/presentation/app_universal_banner_widget.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart';
import 'package:fin_uslugi/features/cards/presentation/blocs/credit_search_bloc.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/credit_search/more_about_credit_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/credit_search/widgets/credit_card_widget.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/widgets/crdit_error_body.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/widgets/credit_loading_body.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/widgets/empty_list_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loadmore/loadmore.dart';

class CreditSearchScreen extends StatefulWidget {
  const CreditSearchScreen({super.key});

  @override
  _CreditSearchScreenState createState() => _CreditSearchScreenState();
}

class _CreditSearchScreenState extends State<CreditSearchScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // Гарантирует сохранение состояния
  final _bloc = GetIt.I<CreditSearchBloc>();

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
          if (state is CreditSearchBlocReadyState) {
            _response = state.response;
            fillData();
          }
        },
        child: BlocBuilder(
          bloc: _bloc,
          buildWhen: (_, state) => state is! CreditSearchBlocPageLoadingState,
          builder: (context, state) {
            if (state is CreditSearchBlocReadyState) {
              if (state.response.products.isEmpty) {
                return const EmptyListPlaceholder();
              } else {
                return body();
              }
            } else if (state is CreditSearchForBankBlocReadyState) {
              return body();
            } else if (state is CreditSearchBlocLoadingState) {
              return const CreditLoadingBody();
            } else if (state is CreditSearchBlocErrorState) {
              return const CreditErrorBody();
            } else {
              return const SizedBox();
            }
          },
        ));
  }

  body() {
    return Column(
      children: [
        AppUniversalBannerWidget(
          category: 'search-credit-screen',
          banners: bannerList,
          padding: EdgeInsets.all(0),
        ),
        Expanded(
            child: SafeArea(
          child: PagedListView<int, Product>.separated(
              pagingController: _pagingController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.only(bottom: 120.h, top: 12.h),
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
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                            ],
                          ),
                        ),
                      ),
                  itemBuilder: (context, item, index) {
                    CreditResponse? creditResponse;
                    if (item is CreditResponse) creditResponse = item;
                    return CreditCardWidget(
                      credit: creditResponse!,
                      onMoreButtonPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              MoreAboutCreditScreen(credit: creditResponse!),
                        ),
                      ),
                    );
                  }),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 12.h)),
        )),
      ],
    );
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
    _bloc.add(CreditSearchBlocSearchEvent(page: 1));
  }

  Future<void> _fetchPage(int pageKey) async {
    _bloc.add(CreditSearchBlocSearchEvent(page: pageKey));
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

class _Body extends StatefulWidget {
  final Response response;
  final CreditSearchBloc bloc;

  const _Body({
    required this.response,
    required this.bloc,
  });

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: LoadMore(
        isFinish: !(widget.response.products.length < widget.response.total),
        onLoadMore: () async {
          if (widget.response.products.length < widget.response.total) {
            widget.bloc.add(CreditSearchBlocNextPageEvent());
            await Future.delayed(const Duration(seconds: 2));
            return true;
          } else {
            return false;
          }
        },
        textBuilder: (LoadMoreStatus status) => "",
        delegate: const CustomLoadMoreDelegate(),
        child: ListView.separated(
          padding: EdgeInsets.only(bottom: 30.h),
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: widget.response.products.length + 1,
          separatorBuilder: (context, index) => SizedBox(height: 20.h),
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                child: AppUniversalBannerWidget(
                    category: 'credits-screen', banners: bannerList),
              );
            } else {
              final product = widget.response.products[index - 1];
              CreditResponse? creditResponse;
              if (product is CreditResponse) creditResponse = product;
              return CreditCardWidget(
                  credit: creditResponse!,
                  onMoreButtonPressed: () => context.router
                      .push(MoreAboutCreditRoute(credit: creditResponse!)));
            }
          },
        ),
      ),
    );
  }
}

class CustomLoadMoreDelegate extends LoadMoreDelegate {
  const CustomLoadMoreDelegate();

  @override
  Widget buildChild(LoadMoreStatus status,
      {LoadMoreTextBuilder builder = DefaultLoadMoreTextBuilder.chinese}) {
    if (status == LoadMoreStatus.loading)
      return const CircularProgressIndicator();
    return const SizedBox();
  }
}
