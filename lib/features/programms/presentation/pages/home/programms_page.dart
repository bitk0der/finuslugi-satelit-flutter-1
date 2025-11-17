import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:fin_uslugi/features/programms/presentation/widgets/app_error_widget.dart';
import 'package:fin_uslugi/features/programms/presentation/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:fin_uslugi/features/programms/data/models/product_item_model.dart';
import 'package:fin_uslugi/features/programms/data/models/product_model.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/comparison_mortgage_bloc/local/local_comparison_mortgage_bloc.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/favourite_mortgage_bloc/local/local_mortgage_bloc.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/mortgage_bloc/remote/remote_mortgage_bloc.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class ProgrammsPage extends StatefulWidget {
  final String? searchString;
  const ProgrammsPage({this.searchString, super.key});

  @override
  State<ProgrammsPage> createState() => _ProgrammsPageState();
}

class _ProgrammsPageState extends State<ProgrammsPage> {
  late RemoteMortgageBloc _remoteMortgageBloc;
  late LocalComparisonMortgageBloc _localComparisonMortgageBloc;
  late LocalMortgageBloc _localMortgageBloc;
  late ProductModel _productModel;
  final PagingController<int, ProductItemModel> _pagingController =
      PagingController(firstPageKey: 1);
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    _remoteMortgageBloc = GetIt.I<RemoteMortgageBloc>();
    _localComparisonMortgageBloc = GetIt.I<LocalComparisonMortgageBloc>();
    _localMortgageBloc = GetIt.I<LocalMortgageBloc>();
    /*  _remoteMortgageBloc.add(GetInitialMortgages(page: 1)); */
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  search() {
    _pagingController.itemList?.clear();
    _remoteMortgageBloc
        .add(SearchMortgages(searchText: textEditingController.text, page: 1));
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    _remoteMortgageBloc.add(
        SearchMortgages(page: pageKey, searchText: textEditingController.text));
  }

  fillData() {
    final isLastPage = _productModel.page == _productModel.pageCount;
    final nextPageKey = _productModel.page + 1;
    if (_productModel.page == 1) {
      _pagingController.itemList?.clear();
      _pagingController.appendPage(_productModel.items, nextPageKey);
      return;
    }
    if (isLastPage) {
      _pagingController.appendLastPage(_productModel.items);
    } else {
      _pagingController.appendPage(_productModel.items, nextPageKey);
    }
  }

  Widget progressIndicator() {
    return Center(
        child: SizedBox(
            width: 32.w,
            height: 32.w,
            child: CircularProgressIndicator(
                color: Theme.of(context).indicatorColor)));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
        top: false,
        child: BlocListener(
            bloc: _localComparisonMortgageBloc,
            listener: (context, LocalMortgageComparisonState state) async {
              if (state is MortgageSuccessfullyAddedToComparison) {
                setState(() {});
              }
              if (state is MortgageSuccessfullyDeletedFromComparison) {
                setState(() {});
              }
            },
            child: BlocListener(
              bloc: _localMortgageBloc,
              listener: (context, LocalMortgageState state) async {
                if (state is MortgageSuccessfullyAddedToFavourite) {
                  setState(() {});
                }
                if (state is MortgageSuccessfullyDeletedFromFavourite) {
                  setState(() {});
                }
              },
              child: BlocListener(
                  bloc: _remoteMortgageBloc,
                  listener: (context, RemoteMortgageState state) async {
                    if (state is GetInitialCouponsSuccessfull) {
                      _productModel = state.productModel;
                      fillData();
                    }
                    if (state is GetSearchedMortgagesSuccessfull) {
                      _productModel = state.productModel;
                      textEditingController.text = state.searchString;
                      fillData();
                    }
                  },
                  child: BlocBuilder(
                      bloc: _remoteMortgageBloc,
                      builder: (context, state) {
                        return Scaffold(
                            body: state is Loading
                                ? Column(children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 12.h),
                                      child: textField(theme),
                                    ),
                                    Expanded(
                                        flex: 2, child: progressIndicator())
                                  ])
                                : state is Failed
                                    ? AppErrorWidget(
                                        onTap: () => _remoteMortgageBloc
                                            .add(GetInitialMortgages(page: 1)))
                                    : PagedListView<int,
                                        ProductItemModel>.separated(
                                        pagingController: _pagingController,
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.h, horizontal: 20.w),
                                        builderDelegate:
                                            PagedChildBuilderDelegate<
                                                    ProductItemModel>(
                                                newPageProgressIndicatorBuilder:
                                                    (context) =>
                                                        progressIndicator(),
                                                noItemsFoundIndicatorBuilder:
                                                    (context) => Center(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        20.w),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                    'Программ не найдено, попробуйте изменить параметры поиска',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .titleLarge),
                                                                textField(
                                                                    theme),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                itemBuilder:
                                                    (context, item, index) {
                                                  if (item.banner != null) {
                                                    return GestureDetector(
                                                        onTap: () async {
                                                          if (!await launchUrl(
                                                              Uri.parse(item
                                                                  .banner!.url),
                                                              mode: LaunchMode
                                                                  .externalApplication)) {
                                                            throw Exception(
                                                                'Could not launch url');
                                                          }
                                                        },
                                                        child: Image.network(
                                                            item.banner!
                                                                .imageUrl));
                                                  }
                                                  return SizedBox();
                                                  /*  if (index == 0) {
                                                return Column(
                                                  children: [
                                                    textField(theme),
                                                    ProgrammCard(productItem: item)
                                                  ],
                                                );
                                              }
                                              return ProgrammCard(productItem: item); */
                                                }),
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                SizedBox(height: 12.h),
                                      ));
                      })),
            )));
  }

  Widget textField(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: AppCardLayout(
        padding: EdgeInsets.zero,
        radius: 20.r,
        child: AppTextField(
          controller: textEditingController,
          hintStyle: theme.primaryTextTheme.bodySmall,
          textStyle: theme.primaryTextTheme.bodyMedium,
          textInputAction: TextInputAction.search,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          hintText: 'Наименование ипотечной программы',
          onSubmit: (p0) => search(),
          suffixIcon: GestureDetector(
            onTap: () => search(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Assets.icons.safeIcon.svg(
                  colorFilter:
                      ColorFilter.mode(theme.primaryColor, BlendMode.srcIn)),
            ),
          ),
        ),
      ),
    );
  }
}
