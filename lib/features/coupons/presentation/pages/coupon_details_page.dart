import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:fin_uslugi/core/widgets/app_button.dart';
import 'package:fin_uslugi/features/coupons/data/models/coupon_item_model.dart';
import 'package:fin_uslugi/features/coupons/data/models/retailer_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/bloc/coupons_bloc/remote/remote_coupons_bloc.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/data/models/coupon_favourite_model.dart';
import 'package:fin_uslugi/features/coupons/presentation/pages/favourites/presentation/bloc/local/local_coupons_bloc.dart';
import 'package:fin_uslugi/features/coupons/presentation/widgets/app_appbar.dart';
import 'package:fin_uslugi/features/coupons/presentation/widgets/coupon_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class CouponDetailsPage extends StatefulWidget {
  final RetailerModel retailerModel;
  final CouponFavouriteModel? couponFavouriteModel;
  const CouponDetailsPage(
      {required this.retailerModel, this.couponFavouriteModel, super.key});

  @override
  State<CouponDetailsPage> createState() => _CouponDetailsPageState();
}

class _CouponDetailsPageState extends State<CouponDetailsPage> {
  bool _isInFavourites = false;
/*   final box = GetStorage(); */

  void checkInCache() {
    /*  var isInFavouriteIds = box.read('retailers') as List? ?? [];
    _isInFavourites = isInFavouriteIds.contains(widget.retailerModel.uuid); */
  }

  late LocalCouponsBloc _localFootballBloc;
  late RemoteCouponsBloc _remoteCouponsBloc;
  @override
  void initState() {
    checkInCache();
    _localFootballBloc = GetIt.I<LocalCouponsBloc>();
    _remoteCouponsBloc = GetIt.I<RemoteCouponsBloc>();
    widget.couponFavouriteModel != null
        ? null
        : _remoteCouponsBloc
            .add(GetAllMarketCoupons(website: widget.retailerModel.website));
    super.initState();
  }

  List<CouponItem> couponItems = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _localFootballBloc,
        builder: (context, state) {
          checkInCache();
          return BlocConsumer(
              bloc: _remoteCouponsBloc,
              listener: (context, RemoteCouponsState state) async {
                if (state is GetAllMarketCouponsSuccessfull) {
                  couponItems = state.couponItems;
                }
              },
              builder: (context, state) {
                return SafeArea(
                    child: Scaffold(
                  backgroundColor: ColorStyles.white,
                  appBar: DefaultAppBar(retailer: widget.retailerModel),
                  body: state is Loading
                      ? const Center(
                          child: CircularProgressIndicator(
                              color: ColorStyles.black))
                      : widget.couponFavouriteModel != null
                          ? Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 82.h),
                              child: CouponDetailsWidget(
                                  couponWithRetailer:
                                      widget.couponFavouriteModel!),
                            )
                          : ListView.separated(
                              itemCount: couponItems.length,
                              padding:
                                  EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 82.h),
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  CouponDetailsWidget(
                                      couponWithRetailer: CouponFavouriteModel(
                                          coupon: couponItems[index],
                                          retailer: widget.retailerModel)),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      SizedBox(height: 12.h),
                            ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
                    child: AppButton(
                      backgroundColor: _isInFavourites
                          ? ColorStyles.yellowLight
                          : ColorStyles.yellowColor,
                      onTap: () {
                        if (_isInFavourites) {
                          _localFootballBloc.add(DeleteRetailerFromFavourite(
                              retailer: widget.retailerModel));
                        } else {
                          _localFootballBloc.add(AddRatailerToFavourite(
                              retailer: widget.retailerModel));
                        }
                      },
                      title: _isInFavourites
                          ? 'Убрать из избранного'
                          : 'Добавить магазин в избранное',
                    ),
                  ),
                ));
              });
        });
  }
}
