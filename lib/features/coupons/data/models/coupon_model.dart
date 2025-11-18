import 'package:equatable/equatable.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:fin_uslugi/features/coupons/data/models/coupon_item_model.dart';
import 'package:fin_uslugi/features/coupons/data/models/retailer_model.dart';
part 'coupon_model.g.dart'; // This is for the generated file

@HiveType(typeId: 0)
class CouponModel extends Equatable {
  @HiveField(0)
  final int total;
  @HiveField(1)
  final int totalOffersCount;
  @HiveField(2)
  final String? previewText;
  @HiveField(3)
  final RetailerModel retailer;
  @HiveField(4)
  final List<CouponItem> coupons;
  @HiveField(5)
  final String? type;
  @HiveField(6)
  final String? imageUrl;
  @HiveField(7)
  final String? url;

  const CouponModel({
    required this.total,
    required this.coupons,
    required this.totalOffersCount,
    required this.previewText,
    required this.retailer,
    required this.type,
    required this.imageUrl,
    required this.url,
  });

  CouponModel.fromJson(Map<String, dynamic> json)
      : total = json['coupons'] == null ? 0 : json['coupons']['total'],
        retailer = json['retailer'] == null
            ? const RetailerModel(
                uuid: '',
                name: '',
                slug: '',
                nearest: [],
                website: '',
                imageUrl: '')
            : RetailerModel.fromJson(json['retailer']),
        totalOffersCount = json['totalOffersCount'] ?? 0,
        previewText = json['previewText'] ?? '',
        type = json['type'] ?? '',
        imageUrl = json['imageUrl'] ?? '',
        url = json['url'] ?? '',
        coupons = json['coupons'] == null
            ? []
            : (json['coupons']['items'] as List)
                .map((item) => CouponItem.fromJson(item))
                .toList();

  @override
  List<Object?> get props => [total, coupons];
}
