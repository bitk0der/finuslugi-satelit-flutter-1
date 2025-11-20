import 'package:auto_route/auto_route.dart';
import 'package:fin_uslugi/core/constants/constants.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_font.dart';
import 'package:fin_uslugi/core/utils/handlers/text_change_handler.dart';
import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/presentation/bloc/local/local_coupons_bloc.dart';
import 'package:fin_uslugi/features/coupons/presentation/widgets/app_sliver_appbar.dart';
import 'package:fin_uslugi/features/programms/presentation/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:fin_uslugi/features/coupons/data/models/coupon_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/bloc/coupons_bloc/remote/remote_coupons_bloc.dart';
import 'package:fin_uslugi/features/coupons/presentation/widgets/alert_widget.dart';
import 'package:fin_uslugi/features/coupons/presentation/widgets/expansion_list_tile.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  final String? category;
  final String? categoryTitle;
  const MainPage({super.key, this.category, this.categoryTitle});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late RemoteCouponsBloc _remoteCouponsBloc;
  final PagingController<int, CouponModel> _pagingController =
      PagingController(firstPageKey: 1);
  String? nextPageKey;
  String searchString = '';
  @override
  void initState() {
    _remoteCouponsBloc = GetIt.I<RemoteCouponsBloc>();
    _pagingController.addPageRequestListener((pageKey) {
      if (nextPageKey != null) {
        _remoteCouponsBloc.add(SearchCoupons(
            searchText: searchString,
            nextPage: nextPageKey,
            category: widget.category));
      }
    });
    super.initState();
  }

  int pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<LocalCouponsBloc, LocalCouponsState>(
            bloc: GetIt.I<LocalCouponsBloc>(),
            listener: (context, LocalCouponsState state) async {
              if (state is SuccessfullyAddedCouponToFavourite) {
                await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        titlePadding: EdgeInsets.zero,
                        backgroundColor: ColorStyles.green,
                        title: AlertWidget(
                          coupon: state.couponFavouriteModel.coupon,
                        )));
              }
            },
            child: BlocListener(
                bloc: _remoteCouponsBloc,
                listener: (context, RemoteCouponsState state) async {
                  if (state is GetCouponsSuccessfull) {
                    pageIndex++;
                    if (state.nextPageKey == null) {
                      pageIndex = 1;
                      _pagingController.appendLastPage(state.coupons);
                    } else {
                      _pagingController.appendPage(state.coupons, pageIndex);
                    }
                    nextPageKey = state.nextPageKey;
                  }
                },
                child: BlocBuilder<RemoteCouponsBloc, RemoteCouponsState>(
                    builder: (context, state) {
                  return Scaffold(
                    backgroundColor: ColorStyles.white,
                    body: CustomScrollView(shrinkWrap: true, slivers: [
                      widget.category != null
                          ? SliverAppBar(
                              titleSpacing: 0,
                              toolbarHeight: 100.h,
                              leadingWidth: 0,
                              title: Container(
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: ColorStyles.navbarGradient,
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter)),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 14.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () => context.pop(),
                                          child: AppCardLayout(
                                              padding: EdgeInsets.all(9.w),
                                              color: ColorStyles.white,
                                              radius: 12.r,
                                              child: Assets.icons.arrowRight
                                                  .svg()),
                                        ),
                                        SizedBox(width: 10.w),
                                        Flexible(
                                          child: AppCardLayout(
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 11.h),
                                              color: ColorStyles.white,
                                              radius: 12.r,
                                              child: Text(
                                                widget.categoryTitle ??
                                                    categoryCodeToRussian[
                                                        widget.category!] ??
                                                    '',
                                                textAlign: TextAlign.center,
                                                style: UIFonts.hint.copyWith(
                                                    color: ColorStyles.black),
                                              )),
                                        ),
                                        SizedBox(width: 50.w),
                                      ],
                                    ),
                                  )),
                              pinned: true,
                            )
                          : DefaultSliverAppBar(
                              onTextChanged: (text) {
                                searchString = text;
                                _pagingController.itemList = null;
                              },
                            ),
                      widget.category == null
                          ? const SliverToBoxAdapter(child: SizedBox.shrink())
                          : SliverAppBar(
                              pinned: true,
                              leading: const SizedBox.shrink(),
                              bottom: PreferredSize(
                                  preferredSize: Size(0, 5.h),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: AppTextField(
                                      filled: true,
                                      textStyle: UIFonts.bodySmall,
                                      hintText: 'Введите категорию или товар',
                                      onChange: (text) {
                                        if (searchString != text) {
                                          TextChangeHandler.textChangeHandler(
                                              searchText: text,
                                              context: context,
                                              category: widget.category,
                                              onTextChanged: (text) => {
                                                    _pagingController.itemList =
                                                        null
                                                  });

                                          searchString = text;
                                        }
                                      },
                                    ),
                                  )),
                            ),
                      if (state is Failed)
                        SliverFillRemaining(
                            child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              'На сервере произошла ошибка или нет соединения с интернетом',
                              textAlign: TextAlign.center,
                              style: UIFonts.couponText,
                            ),
                          ),
                        ))
                      else if (_pagingController.itemList == null)
                        SliverFillRemaining(
                            child: Center(
                          child: SizedBox(
                              width: 32.w,
                              height: 32.w,
                              child: const CircularProgressIndicator(
                                  color: ColorStyles.black)),
                        ))
                      else
                        _pagingController.itemList!
                                .where((element) => element.coupons.isNotEmpty)
                                .isEmpty
                            ? SliverFillRemaining(
                                child: Center(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Text(
                                    'По вашему запросу купоны не найдены, попробуйте поменять запрос',
                                    textAlign: TextAlign.center,
                                    style: UIFonts.couponText,
                                  ),
                                ),
                              ))
                            : SliverPadding(
                                padding: EdgeInsets.only(top: 11.h),
                                sliver: PagedSliverList<int, CouponModel>(
                                    pagingController: _pagingController,
                                    builderDelegate:
                                        PagedChildBuilderDelegate<CouponModel>(
                                            itemBuilder:
                                                (context, item, index) {
                                      if (item.coupons.isEmpty) {
                                        if (item.type != null &&
                                            item.type! == 'image' &&
                                            item.imageUrl != null) {
                                          return GestureDetector(
                                              onTap: () async {
                                                if (!await launchUrl(
                                                    Uri.parse(item.url!),
                                                    mode: LaunchMode
                                                        .externalApplication)) {
                                                  //print('Could not launch url');
                                                }
                                              },
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.w,
                                                      vertical: 5.w),
                                                  child: Image.network(
                                                      item.imageUrl!)));
                                        }
                                        return const SizedBox.shrink();
                                      }

                                      return AppExpansionListTile(coupon: item);
                                    })))
                    ]),
                  );
                }))));
  }
}
