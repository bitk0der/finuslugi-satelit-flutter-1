import 'package:equatable/equatable.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:fin_uslugi/features/coupons/data/models/coupon_item_model.dart';
import 'package:fin_uslugi/features/coupons/data/models/retailer_model.dart';
import 'package:hive_ce_flutter/adapters.dart';
part 'coupon_favourite_model.g.dart'; // This is for the generated file

@HiveType(typeId: 22)
class CouponFavouriteModel extends Equatable implements Product {
  @HiveField(0)
  final CouponItem coupon;
  @HiveField(1)
  final RetailerModel retailer;

  const CouponFavouriteModel({required this.coupon, required this.retailer});
  CouponFavouriteModel.fromJson(Map<String, dynamic> json)
      : coupon = CouponItem.fromJson(json['coupon']),
        retailer = RetailerModel.fromJson(json['retailer']);

  Map<String, dynamic> toJson() => {'coupon': coupon, 'retailer': retailer};

  @override
  List<Object?> get props => [retailer];

  @override
  String get bankName => retailer.name;

  @override
  String get cardName => coupon.value;

  @override
  String get id => coupon.uuid;

  @override
  BankingCategory get productType => BankingCategory.promocodes;
}
