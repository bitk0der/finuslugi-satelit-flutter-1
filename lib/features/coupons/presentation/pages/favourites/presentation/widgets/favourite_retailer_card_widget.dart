import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/theme/app_font.dart';
import 'package:fin_uslugi/core/widgets/app_card_layout.dart';
import 'package:fin_uslugi/features/cards/presentation/widgets/app_image_network.dart';
import 'package:fin_uslugi/features/coupons/data/models/retailer_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/presentation/bloc/local/local_coupons_bloc.dart';
import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteRetailerCardWidget extends StatelessWidget {
  final RetailerModel retailerModel;
  const FavouriteRetailerCardWidget({required this.retailerModel, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:
            () {} /*  =>
            context.push('/home/main/coupon_details', extra: retailerModel) */
        ,
        child: AppCardLayout(
          color: ColorStyles.white,
          radius: 16.r,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              Flexible(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: SizedBox(
                          width: 46.w,
                          height: 46.w,
                          child: AppImageNetwork(retailerModel.imageUrl)),
                    ),
                    SizedBox(width: 12.w),
                    Flexible(
                        child: Text(retailerModel.name,
                            style: UIFonts.titleMedium)),
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  BlocProvider.of<LocalCouponsBloc>(context).add(
                      DeleteRetailerFromFavourite(retailer: retailerModel));
                },
                child: Container(
                  width: 42.w,
                  height: 42.w,
                  padding: EdgeInsets.all(9.w),
                  decoration: const BoxDecoration(
                      color: ColorStyles.yellowColor, shape: BoxShape.circle),
                  child: Assets.icons.filledFavouriteIcon.svg(),
                ),
              ),
              SizedBox(width: 12.w),
              RotatedBox(quarterTurns: 2, child: Assets.icons.arrowRight.svg()),
            ],
          ),
        ));
  }
}
