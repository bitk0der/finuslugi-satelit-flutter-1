part of 'remote_coupons_bloc.dart';

@immutable
abstract class RemoteCouponsEvent {}

class GetInitialCoupons extends RemoteCouponsEvent {}

class SearchCoupons extends RemoteCouponsEvent {
  final String searchText;
  final String? nextPage;
  final String? category;
  SearchCoupons({required this.searchText, this.nextPage, this.category});
}

class GetConfig extends RemoteCouponsEvent {}

class GetAllMarketCoupons extends RemoteCouponsEvent {
  final String website;
  GetAllMarketCoupons({required this.website});
}
