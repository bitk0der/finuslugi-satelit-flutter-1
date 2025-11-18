import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:fin_uslugi/core/theme/app_font.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/data/models/coupon_favourite_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/presentation/bloc/local/local_coupons_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/features/coupons/data/models/coupon_model.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';

class AppExpansionListTile extends StatefulWidget {
  final CouponModel coupon;
  const AppExpansionListTile({required this.coupon, super.key});

  @override
  State<AppExpansionListTile> createState() => _AppExpansionListTileState();
}

class _AppExpansionListTileState extends State<AppExpansionListTile> {
  bool _isExpanded = false;
  bool _isInFavourites = false;
/*   final box = GetStorage(); */
  late LocalCouponsBloc _localFootballBloc;
  @override
  void initState() {
    checkInCache();
    _localFootballBloc = BlocProvider.of<LocalCouponsBloc>(context);
    super.initState();
  }

  checkInCache() {
    /*  var isInFavouriteIds = box.read('retailers') as List? ?? [];
    _isInFavourites = isInFavouriteIds.contains(widget.coupon.retailer.uuid); */
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCouponsBloc, LocalCouponsState>(
        builder: (context, state) {
      checkInCache();
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
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (_isInFavourites) {
                        _localFootballBloc.add(DeleteRetailerFromFavourite(
                            retailer: widget.coupon.retailer));
                      } else {
                        _localFootballBloc.add(AddRatailerToFavourite(
                            retailer: widget.coupon.retailer));
                      }
                    },
                    child: Container(
                      width: 42.w,
                      height: 42.w,
                      padding: EdgeInsets.all(9.w),
                      decoration: BoxDecoration(
                          color: _isInFavourites
                              ? ColorStyles.yellowColor
                              : ColorStyles.grayBorder,
                          border: Border.all(color: ColorStyles.yellowColor),
                          shape: BoxShape.circle),
                      child: _isInFavourites
                          ? Assets.icons.filledFavouriteIcon.svg()
                          : Assets.icons.favouriteIcon.svg(),
                    ),
                  )
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
                                  color: ColorStyles.black.withOpacity(0.1)),
                          child: Container(
                              padding: EdgeInsets.only(
                                  top: 14.h,
                                  bottom: widget.coupon.total <= 3 ? 0 : 8.h),
                              decoration: DottedDecoration(
                                  linePosition: LinePosition.top,
                                  color: ColorStyles.black.withOpacity(0.1)),
                              child: _buildExpandableContent(widget.coupon)),
                        ),
                        widget.coupon.total <= 3
                            ? const SizedBox.shrink()
                            : GestureDetector(
                                onTap:
                                    () {} /*  => context.push(
                                    '/home/main/coupon_details',
                                    extra: widget.coupon.retailer) */
                                ,
                                child: Container(
                                  color: Colors.white,
                                  padding:
                                      EdgeInsets.only(top: 16.h, bottom: 2.h),
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Посмотреть все промокоды',
                                    style: UIFonts.bodyMedium.copyWith(
                                        fontSize: 16.sp,
                                        color: ColorStyles.blue),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              )));
    });
  }

  _buildExpandableContent(CouponModel coupon) {
    List<Widget> columnContent = [];

    for (var couponItem in coupon.coupons) {
      /*  var isInFavouriteIds = box.read('coupons') as List? ?? []; */
      bool isInFavourites =
          false /* isInFavouriteIds.contains(couponItem.uuid) */;
      columnContent.add(
        GestureDetector(
            onTap:
                () /* => context.push('/home/main/coupon_details_single_coupon',
                extra: CouponFavouriteModel(
                    coupon: couponItem, retailer: coupon.retailer)) */
                {},
            child: BlocBuilder<LocalCouponsBloc, LocalCouponsState>(
                builder: (context, state) {
              return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
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
                                var couponWithRetailer = CouponFavouriteModel(
                                    coupon: couponItem,
                                    retailer: widget.coupon.retailer);
                                if (isInFavourites) {
                                  _localFootballBloc.add(
                                      DeleteCouponFromFavourite(
                                          coupon: couponWithRetailer));
                                } else {
                                  _localFootballBloc.add(AddCouponToFavourite(
                                      coupon: couponWithRetailer));
                                }
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
                                        color: ColorStyles.yellowColor),
                                    shape: BoxShape.circle),
                                child: isInFavourites
                                    ? Assets.icons.filledFavouriteIcon.svg()
                                    : Assets.icons.favouriteIcon.svg(),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Flexible(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                          quarterTurns: 3, child: Assets.icons.arrowRight.svg())
                    ],
                  ));
            })),
      );
    }

    return Column(
      children: columnContent,
    );
  }
}
