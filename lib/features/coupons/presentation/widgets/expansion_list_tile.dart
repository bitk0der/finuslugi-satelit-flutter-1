import 'package:auto_route/auto_route.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/app_font.dart';
import 'package:fin_uslugi/features/coupons/data/models/coupon_item_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/data/models/coupon_favourite_model.dart';
import 'package:fin_uslugi/features/programms/presentation/bloc/favourite_mortgage_bloc/local/local_mortgage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/features/coupons/data/models/coupon_model.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppExpansionListTile extends StatefulWidget {
  final CouponModel coupon;
  const AppExpansionListTile({required this.coupon, super.key});

  @override
  State<AppExpansionListTile> createState() => _AppExpansionListTileState();
}

class _AppExpansionListTileState extends State<AppExpansionListTile> {
  bool _isExpanded = false;

  late LocalMortgageBloc _localMortgageBloc;
  @override
  void initState() {
    _localMortgageBloc = GetIt.I<LocalMortgageBloc>();
    super.initState();
  }

  bool checkInCache(CouponItem couponItem) {
    var isInFavouriteIds =
        GetIt.I<SharedPreferences>().getStringList('mortgagesIDS') ?? [];
    return isInFavouriteIds.contains(couponItem.uuid);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.w),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
        child: Theme(
            data: ThemeData().copyWith(
              splashColor: Colors.transparent,
            ),
            child: ExpansionTile(
              dense: true,
              expandedCrossAxisAlignment: CrossAxisAlignment.center,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r)),
              trailing: AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Assets.icons.arrowRight.svg()),
              onExpansionChanged: (value) {
                setState(() {
                  _isExpanded = value;
                });
              },
              title: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(11.r),
                  child: SizedBox(
                      width: 46.w,
                      height: 46.w,
                      child: Image.network(widget.coupon.retailer.imageUrl)),
                ),
                SizedBox(width: 12.w),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.coupon.retailer.name,
                          style: UIFonts.titleMedium),
                      Row(
                        children: [
                          SizedBox(
                              width: 22.w,
                              height: 22.w,
                              child: Assets.images.couponDiscount.image()),
                          SizedBox(width: 6.w),
                          Text('${widget.coupon.total} промокода',
                              style: UIFonts.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ),
                /*  GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          _localMortgageBloc.add(AddMortgageToFavourite(
                              productItemModel: CouponFavouriteModel(
                                  coupon: widget.coupon.coupons[0],
                                  retailer: coupon.retailer)));
                        },
                        child: Container(
                          width: 42.w,
                          height: 42.w,
                          padding: EdgeInsets.all(9.w),
                          decoration: BoxDecoration(
                              color: _isInFavourites
                                  ? ColorStyles.yellowColor
                                  : ColorStyles.grayBorder,
                              border:
                                  Border.all(color: ColorStyles.yellowColor),
                              shape: BoxShape.circle),
                          child: _isInFavourites
                              ? Assets.icons.filledFavouriteIcon.svg()
                              : Assets.icons.favouriteIcon.svg(),
                        ),
                      ) */
              ]),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: Column(
                    children: [
                      Container(
                        decoration: widget.coupon.total <= 3
                            ? null
                            : DottedDecoration(
                                linePosition: LinePosition.bottom,
                                color:
                                    ColorStyles.black.withValues(alpha: 0.1)),
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 14.h,
                                bottom: widget.coupon.total <= 3 ? 0 : 8.h),
                            decoration: DottedDecoration(
                                linePosition: LinePosition.top,
                                color:
                                    ColorStyles.black.withValues(alpha: 0.1)),
                            child: _buildExpandableContent(widget.coupon)),
                      ),
                      widget.coupon.total <= 3
                          ? const SizedBox.shrink()
                          : GestureDetector(
                              onTap: () => context.router.navigate(
                                  CouponDetailsRoute(
                                      retailerModel: widget.coupon.retailer)),
                              child: Container(
                                color: Colors.white,
                                padding:
                                    EdgeInsets.only(top: 16.h, bottom: 2.h),
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                child: Text(
                                  'Посмотреть все промокоды',
                                  style: UIFonts.bodyMedium.copyWith(
                                      fontSize: 16.sp, color: ColorStyles.blue),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ],
            )));
  }

  Column _buildExpandableContent(CouponModel coupon) {
    List<Widget> columnContent = [];

    for (var couponItem in coupon.coupons) {
      columnContent.add(
        BlocBuilder(
            bloc: _localMortgageBloc,
            builder: (context, state) {
              return GestureDetector(
                  onTap: () => context.router.push(CouponDetailsRoute(
                      retailerModel: coupon.retailer,
                      couponFavouriteModel: CouponFavouriteModel(
                          coupon: couponItem, retailer: coupon.retailer))),
                  child: BlocBuilder(
                      bloc: _localMortgageBloc,
                      builder: (context, state) {
                        bool isInFavourites = checkInCache(couponItem);
                        return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 13.h),
                            margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 6.h),
                            decoration: BoxDecoration(
                                color: ColorStyles.white,
                                borderRadius: BorderRadius.circular(14.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () {
                                          _localMortgageBloc.add(
                                              AddMortgageToFavourite(
                                                  productItemModel:
                                                      CouponFavouriteModel(
                                                          coupon: couponItem,
                                                          retailer: coupon
                                                              .retailer)));
                                        },
                                        child: Container(
                                          width: 42.w,
                                          height: 42.w,
                                          padding: EdgeInsets.all(9.w),
                                          decoration: BoxDecoration(
                                              color: isInFavourites
                                                  ? ColorStyles.yellowColor
                                                  : ColorStyles.white,
                                              border: Border.all(
                                                  color:
                                                      ColorStyles.yellowColor),
                                              shape: BoxShape.circle),
                                          child: isInFavourites
                                              ? Assets.icons.filledFavouriteIcon
                                                  .svg()
                                              : Assets.icons.favouriteIcon
                                                  .svg(),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Flexible(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            couponItem.shortDescription,
                                            style: UIFonts.titleMedium,
                                          ),
                                          SizedBox(height: 2.h),
                                          Text(
                                            couponItem.description,
                                            style: UIFonts.bodySmall,
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                RotatedBox(
                                    quarterTurns: 3,
                                    child: Assets.icons.arrowRight.svg())
                              ],
                            ));
                      }));
            }),
      );
    }

    return Column(
      children: columnContent,
    );
  }
}
