import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_font.dart';
import 'package:fin_uslugi/features/coupons/data/models/retailer_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/data/models/coupon_favourite_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/presentation/bloc/local/local_coupons_bloc.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/presentation/widgets/favourite_retailer_card_widget.dart';
import 'package:fin_uslugi/features/coupons/presentation/widgets/app_empty_widget.dart';
import 'package:fin_uslugi/features/coupons/presentation/widgets/coupon_details_widget.dart';
import 'package:fin_uslugi/features/programms/presentation/widgets/app_textfield.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class FavouriteHomePage extends StatefulWidget {
  const FavouriteHomePage({super.key});

  @override
  State<FavouriteHomePage> createState() => _FavouriteHomePageState();
}

class _FavouriteHomePageState extends State<FavouriteHomePage>
    with TickerProviderStateMixin {
  late TabController tabController;
  late LocalCouponsBloc _localFootballBloc;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    _localFootballBloc = GetIt.I<LocalCouponsBloc>();
    _localFootballBloc.add(GetFavouritesCoupons());
    super.initState();
  }

  List<RetailerModel>? retailers;
  List<CouponFavouriteModel>? coupons;
  String searchString = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorStyles.grayBorder,
          appBar: AppBar(
            titleSpacing: 0,
            toolbarHeight: kToolbarHeight,
            leadingWidth: 0,
            title: Container(
                height: kToolbarHeight,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: ColorStyles.navbarGradient,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                        child: Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Text('Избранное',
                          style: UIFonts.couponText.copyWith(
                              color: ColorStyles.black,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600)),
                    )),
                  ],
                )),
          ),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                  color: ColorStyles.white,
                  borderRadius: BorderRadius.circular(100.r)),
              child: TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: ColorStyles.white,
                labelStyle: UIFonts.titleMedium,
                unselectedLabelColor: ColorStyles.black.withOpacity(0.5),
                splashBorderRadius: BorderRadius.circular(100.r),
                indicatorWeight: 0,
                dividerHeight: 0,
                indicator: ShapeDecoration(
                    color: ColorStyles.blueButtonColor,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: ColorStyles.blueButtonColor),
                        borderRadius: BorderRadius.circular(100.r))),
                tabs: const [Tab(text: 'Купоны'), Tab(text: 'Магазины')],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AppTextField(
                filled: true,
                textStyle: UIFonts.bodySmall,
                hintText: 'Искать в избранном...',
                onChange: (text) => setState(() {
                  searchString = text;
                }),
              ),
            ),
            BlocListener<LocalCouponsBloc, LocalCouponsState>(
                listener: (context, LocalCouponsState state) async {
              if (state is GetFavouritesCouponsSuccessfull) {
                coupons = state.coupons;
                _localFootballBloc.add(GetFavouritesRetailers());
              }
              if (state is GetFavouritesRetailersSuccessfull) {
                retailers = state.retailers;
              }
              if (state is SuccessfullyAddedCouponToFavourite) {
                _localFootballBloc.add(GetFavouritesCoupons());
              }
              if (state is SuccessfullyAddedToFavourite) {
                _localFootballBloc.add(GetFavouritesRetailers());
              }
              if (state is SuccessfullyDeletedFromFavourite) {
                _localFootballBloc.add(GetFavouritesCoupons());
              }
              if (state is LocalError) {
                coupons = [];
                retailers = [];
              }
            }, child: BlocBuilder<LocalCouponsBloc, LocalCouponsState>(
                    builder: (context, state) {
              if (coupons == null || retailers == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return Expanded(
                  child: SafeArea(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    listViewCoupons(searchCouponFavourite(searchString)),
                    listViewRetailers(searchRetailers(searchString))
                  ],
                ),
              ));
            }))
          ])),
    );
  }

  Widget listViewCoupons(List<CouponFavouriteModel> favourites) {
    return favourites.isEmpty
        ? AppEmptyWidget(
            icon: Assets.images.couponDiscount,
            title:
                'Здесь будут отображаться ваши избранные промокоды и напоминания',
          )
        : ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
            itemCount: favourites.length,
            itemBuilder: (ctx, index) => CouponDetailsWidget(
              couponWithRetailer: favourites[index],
              isInFavoutrite: true,
            ),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 8.h),
          );
  }

  Widget listViewRetailers(List<RetailerModel> favouritesRetailers) {
    return favouritesRetailers.isEmpty
        ? AppEmptyWidget(
            icon: Assets.images.bagImage,
            title: 'Здесь будут отображаться ваши избранные магазины',
          )
        : ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
            itemCount: favouritesRetailers.length,
            itemBuilder: (ctx, index) => FavouriteRetailerCardWidget(
                retailerModel: favouritesRetailers[index]),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 8.h),
          );
  }

  List<CouponFavouriteModel> searchCouponFavourite(String query) {
    return coupons!.where((coupon) {
      final nameLower = coupon.coupon.description.toLowerCase();
      final slugLower = coupon.retailer.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) || slugLower.contains(searchLower);
    }).toList();
  }

  List<RetailerModel> searchRetailers(String query) {
    return retailers!.where((retailer) {
      final nameLower = retailer.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();
  }
}
