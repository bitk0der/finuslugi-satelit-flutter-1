part of 'remote_coupons_bloc.dart';

@immutable
abstract class RemoteCouponsState {}

class RemoteCouponsBlocStateInitial extends RemoteCouponsState {}

class Loading extends RemoteCouponsState {}

class Failed extends RemoteCouponsState {}

class GetCouponsSuccessfull extends RemoteCouponsState {
  final List<CouponModel> coupons;
  final String? nextPageKey;
  final String searchString;
  GetCouponsSuccessfull({required this.coupons, required this.searchString, this.nextPageKey});
}

class GetConfigSuccessfull extends RemoteCouponsState {
  final List<ConfigModel> configModel;
  GetConfigSuccessfull({required this.configModel});
}

class GetAllMarketCouponsSuccessfull extends RemoteCouponsState {
  final List<CouponItem> couponItems;
  GetAllMarketCouponsSuccessfull({required this.couponItems});
}
