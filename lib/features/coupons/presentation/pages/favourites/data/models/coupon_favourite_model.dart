import 'package:equatable/equatable.dart';
import 'package:fin_uslugi/features/coupons/data/models/coupon_item_model.dart';
import 'package:fin_uslugi/features/coupons/data/models/retailer_model.dart';
import 'package:hive_ce_flutter/adapters.dart';
part 'coupon_favourite_model.g.dart'; // This is for the generated file

@HiveType(typeId: 5)
class CouponFavouriteModel extends Equatable {
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
}
