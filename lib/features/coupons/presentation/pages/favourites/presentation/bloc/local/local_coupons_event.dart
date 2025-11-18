part of 'local_coupons_bloc.dart';

@immutable
abstract class LocalCouponsEvent {}

class AddCouponToFavourite extends LocalCouponsEvent {
  final CouponFavouriteModel coupon;
  AddCouponToFavourite({required this.coupon});
}

class AddRatailerToFavourite extends LocalCouponsEvent {
  final RetailerModel retailer;
  AddRatailerToFavourite({required this.retailer});
}

class DeleteRetailerFromFavourite extends LocalCouponsEvent {
  final RetailerModel retailer;
  DeleteRetailerFromFavourite({required this.retailer});
}

class DeleteCouponFromFavourite extends LocalCouponsEvent {
  final CouponFavouriteModel coupon;
  DeleteCouponFromFavourite({required this.coupon});
}

class DeleteAllFromFavourite extends LocalCouponsEvent {}

class GetFavouritesRetailers extends LocalCouponsEvent {}

class GetFavouritesCoupons extends LocalCouponsEvent {}
