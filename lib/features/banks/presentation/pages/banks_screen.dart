import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:fin_uslugi/features/banks/data/models/bank_model.dart';
import 'package:fin_uslugi/features/banks/presentation/blocs/banks_cubit.dart';
import 'package:fin_uslugi/features/banks/presentation/widgets/bank_card_widget.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart';
import 'package:fin_uslugi/features/cards/presentation/pages/credit_screen/search/credit_card_search/credit_card_search_screen.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/bottom_sheet/credit_card_data_bottom_sheet.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_app_bar.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/custom_dialog.dart';
import 'package:fin_uslugi/features/programms/presentation/widgets/app_error_widget.dart';
import 'package:fin_uslugi/features/programms/presentation/widgets/app_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class BanksScreen extends StatefulWidget {
  const BanksScreen({super.key});

  @override
  State<BanksScreen> createState() => _BanksScreenState();
}

class _BanksScreenState extends State<BanksScreen> {
  late BanksCubit _banksCubit;
  late Response _response;
  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 1);
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    _banksCubit = GetIt.I<BanksCubit>();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  search() {
    _pagingController.itemList?.clear();
    _banksCubit.getBanks(1, textEditingController.text);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    _banksCubit.getBanks(pageKey, textEditingController.text);
  }

  fillData() {
    final isLastPage = _response.page == _response.totalPages;
    final nextPageKey = _response.page + 1;
    if (_response.page == 1) {
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
            child: CircularProgressIndicator(
                color: Theme.of(context).indicatorColor)));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
        top: false,
        child: BlocConsumer(
            bloc: _banksCubit,
            listener: (context, BanksState state) async {
              if (state is BanksGetReadyState) {
                _response = state.banks;
                fillData();
              }
            },
            builder: (context, state) {
              return Scaffold(
                  appBar: CustomAppBar.getGradient(
                    isBackButton: true,
                    context: context,
                    onTap: () => {},
                    title: 'Банки России',
                    actions: [
                      IconButton(
                        onPressed: () {
                          CustomDialog.showBottomSheet(
                            context: context,
                            title: 'Информация о кредитных картах',
                            buildChild: (_) {
                              return CreditCardDataBottomSheet(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreditCardSearchScreen()),
                                  );
                                },
                              );
                            },
                          );
                        },
                        padding: EdgeInsets.only(right: 5.w),
                        icon: const Icon(
                          CupertinoIcons.slider_horizontal_3,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  body: state is BanksLoadingState
                      ? Column(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 12.h),
                            child: textField(theme),
                          ),
                          Expanded(flex: 2, child: progressIndicator())
                        ])
                      : state is BanksErrorState
                          ? AppErrorWidget(
                              onTap: () => _banksCubit.getBanks(1, ''))
                          : PagedListView<int, Product>.separated(
                              pagingController: _pagingController,
                              physics: const AlwaysScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              builderDelegate: PagedChildBuilderDelegate<
                                      Product>(
                                  newPageProgressIndicatorBuilder: (context) =>
                                      progressIndicator(),
                                  noItemsFoundIndicatorBuilder: (context) =>
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  'Программ не найдено, попробуйте изменить параметры поиска',
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge),
                                              textField(theme),
                                            ],
                                          ),
                                        ),
                                      ),
                                  itemBuilder: (context, item, index) {
                                    var bank = (item as BankInfo);
                                    if (index == 0) {
                                      return Column(
                                        children: [
                                          /*  textField(theme), */
                                          BankCardWidget(
                                              bank: bank,
                                              onMoreAboutButtonPressed: () =>
                                                  context.router.push(
                                                      MoreAboutbankRoute(
                                                          bank: bank)))
                                        ],
                                      );
                                    }
                                    return BankCardWidget(
                                        onMoreAboutButtonPressed: () =>
                                            context.router.push(
                                                MoreAboutbankRoute(bank: bank)),
                                        bank: bank);
                                  }),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      SizedBox(height: 12.h),
                            ));
            }));
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
