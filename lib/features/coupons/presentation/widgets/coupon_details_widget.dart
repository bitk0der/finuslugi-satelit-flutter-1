import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:fin_uslugi/core/theme/app_font.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/data/models/coupon_favourite_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/presentation/bloc/local/local_coupons_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'package:intl/intl.dart';
import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'dart:ui' as ui;

class CouponDetailsWidget extends StatefulWidget {
  final CouponFavouriteModel couponWithRetailer;
  final bool isInFavoutrite;
  const CouponDetailsWidget(
      {required this.couponWithRetailer,
      this.isInFavoutrite = false,
      super.key});
  @override
  State<CouponDetailsWidget> createState() => _CouponDetailsWidgetState();
}

class _CouponDetailsWidgetState extends State<CouponDetailsWidget> {
  bool _isInFavourites = false;
  bool _isActiveNotification = false;
/*   final box = GetStorage(); */
  late LocalCouponsBloc _localFootballBloc;
  bool isExpanded = false;
  @override
  void initState() {
    checkInCache();
    _localFootballBloc = GetIt.I<LocalCouponsBloc>();
    super.initState();
  }

  checkInCache() {
    /* var isInFavouriteIds = box.read('coupons') as List? ?? [];
    _isInFavourites =
        isInFavouriteIds.contains(widget.couponWithRetailer.coupon.uuid); */
  }

  checkInCacheNotification() {
    /*  var isActiveNotification = box.read('notificationsIds') as List? ?? [];
    _isActiveNotification = isActiveNotification
        .contains(widget.couponWithRetailer.coupon.uuid.hashCode); */
  }

  @override
  Widget build(BuildContext context) {
    checkInCacheNotification();
    return BlocBuilder<LocalCouponsBloc, LocalCouponsState>(
        builder: (context, state) {
      checkInCache();
      return Container(
        decoration: BoxDecoration(
            color: ColorStyles.white,
            borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                        widget.couponWithRetailer.coupon.description,
                        style: UIFonts.bodyMedium,
                      )),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () async {
                          if (_isInFavourites) {
                            _localFootballBloc.add(DeleteCouponFromFavourite(
                                coupon: widget.couponWithRetailer));
                          } else {
                            _localFootballBloc.add(AddCouponToFavourite(
                                coupon: widget.couponWithRetailer));
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
                              border:
                                  Border.all(color: ColorStyles.yellowColor),
                              shape: BoxShape.circle),
                          child: _isInFavourites
                              ? Assets.icons.filledFavouriteIcon.svg()
                              : Assets.icons.favouriteIcon.svg(),
                        ),
                      )
                    ],
                  ),
                  widget.couponWithRetailer.coupon.features.forNewUser
                      ? Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: AppCardLayout(
                              color: ColorStyles.green,
                              padding: EdgeInsets.all(8.w),
                              radius: 10.r,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Assets.icons.procentIcon.svg(),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'На первый заказ',
                                    style: UIFonts.cardSmallText
                                        .copyWith(fontSize: 13.sp),
                                  ),
                                ],
                              )),
                        )
                      : SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                        color: ColorStyles.blueButton,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                              widget.couponWithRetailer.coupon.value
                                  .toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: UIFonts.couponText),
                        ),
                        SizedBox(width: 10.w),
                        GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text: widget.couponWithRetailer.coupon.value
                                      .toUpperCase()));
                              var snack = SnackBar(
                                content: Text(
                                    "Промокод ${widget.couponWithRetailer.coupon.value.toUpperCase()} успешно скопирован"),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snack);
                            },
                            child: Text('Копировать', style: UIFonts.blueText))
                      ],
                    ),
                  ),
                  widget.couponWithRetailer.coupon.condition != null
                      ? LayoutBuilder(builder: (context, constraints) {
                          final span = TextSpan(
                              text: widget.couponWithRetailer.coupon.condition,
                              style: UIFonts.bodySmall);
                          final tp = TextPainter(
                              text: span, textDirection: ui.TextDirection.ltr);
                          tp.layout(
                              maxWidth:
                                  MediaQuery.of(context).size.width - 100.w);
                          final numLines = tp.computeLineMetrics().length;
                          if (numLines > 3) {
                            return conditionText(numLines);
                          } else {
                            return conditionText(1);
                          }
                        })
                      : SizedBox(height: 16.h),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                              color: ColorStyles.grayBorder,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.icons.closeIcon.svg(),
                              SizedBox(width: 6.w),
                              Text(
                                'До ${DateFormat('d MMMM', 'ru').format(DateTime.fromMillisecondsSinceEpoch(widget.couponWithRetailer.coupon.dateEnd))}',
                                style: UIFonts.cardSmallText,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Flexible(
                          child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        decoration: BoxDecoration(
                            color: ColorStyles.grayBorder,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.yellowStar.svg(),
                            SizedBox(width: 6.w),
                            Text(
                              '${widget.couponWithRetailer.coupon.meta.activationsCount} активации',
                              style: UIFonts.cardSmallText,
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            !widget.isInFavoutrite
                ? const SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                    child: AppCardLayout(
                        radius: 14.r,
                        color: ColorStyles.grayBorder,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Напомнить об окончании',
                                style: UIFonts.hint
                                    .copyWith(color: ColorStyles.black)),
                            CupertinoSwitch(
                                value: _isActiveNotification,
                                onChanged: (val) async {
                                  /*     List notificationsIds =
                                      box.read('notificationsIds') ?? [];
                                  if (_isActiveNotification) {
                                    await AwesomeNotifications().cancel(widget
                                        .couponWithRetailer
                                        .coupon
                                        .uuid
                                        .hashCode);
                                    notificationsIds.remove(widget
                                        .couponWithRetailer
                                        .coupon
                                        .uuid
                                        .hashCode);
                                  } else {
                                    await NotificationController
                                        .createNotification(
                                            widget.couponWithRetailer.coupon);
                                    notificationsIds.add(widget
                                        .couponWithRetailer
                                        .coupon
                                        .uuid
                                        .hashCode);
                                  }
                                  await box.write(
                                      'notificationsIds', notificationsIds);
                                  setState(() {}); */
                                })
                          ],
                        )),
                  ),
            !widget.isInFavoutrite
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      Container(
                          decoration: DottedDecoration(
                              color: ColorStyles.black.withOpacity(0.1))),
                      Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(11.r),
                              child: SizedBox(
                                  width: 46.w,
                                  height: 46.w,
                                  child: Image.network(widget
                                      .couponWithRetailer.retailer.imageUrl)),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.couponWithRetailer.retailer.name,
                                      style: UIFonts.titleMedium),
                                  SizedBox(height: 4.h),
                                  widget.couponWithRetailer.retailer.website
                                          .isNotEmpty
                                      ? Text(
                                          widget.couponWithRetailer.retailer
                                              .website,
                                          style: UIFonts.bodySmall)
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      );
    });
  }

  Widget conditionText(int maxLines) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text(widget.couponWithRetailer.coupon.condition ?? '',
            style: UIFonts.bodySmall,
            maxLines: maxLines > 3 && isExpanded ? maxLines : 3,
            overflow: TextOverflow.ellipsis),
        SizedBox(height: maxLines <= 3 ? 16.h : 0.h),
        maxLines <= 3
            ? const SizedBox.shrink()
            : Container(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Row(
                          children: [
                            Text(isExpanded ? 'Свернуть' : 'Развернуть',
                                style: isExpanded
                                    ? UIFonts.blueText.copyWith(
                                        color:
                                            ColorStyles.black.withOpacity(0.6))
                                    : UIFonts.blueText),
                          ],
                        )),
                  ],
                ),
              ),
        SizedBox(height: maxLines <= 3 ? 0.h : 10.h),
      ],
    );
  }
}
