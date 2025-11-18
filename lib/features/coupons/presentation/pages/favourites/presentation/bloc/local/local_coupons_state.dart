part of 'local_coupons_bloc.dart';

@immutable
abstract class LocalCouponsState {}

class LocalMortgageBlocStateInitial extends LocalCouponsState {}

class RetailerSuccessfullyAddedToFavourite extends LocalCouponsState {}

class SuccessfullyDeletedFromFavourite extends LocalCouponsState {}

class SuccessfullyAddedCouponToFavourite extends LocalCouponsState {
  final CouponFavouriteModel couponFavouriteModel;

  SuccessfullyAddedCouponToFavourite({required this.couponFavouriteModel});
}

class SuccessfullyAddedToFavourite extends LocalCouponsState {}

class SuccessfullyDeletedAllFromFavourite extends LocalCouponsState {}

class LocalLoading extends LocalCouponsState {}

class LocalError extends LocalCouponsState {}

class GetFavouritesRetailersSuccessfull extends LocalCouponsState {
  final List<RetailerModel> retailers;

  GetFavouritesRetailersSuccessfull({required this.retailers});
}

class GetFavouritesCouponsSuccessfull extends LocalCouponsState {
  final List<CouponFavouriteModel> coupons;

  GetFavouritesCouponsSuccessfull({required this.coupons});
}
