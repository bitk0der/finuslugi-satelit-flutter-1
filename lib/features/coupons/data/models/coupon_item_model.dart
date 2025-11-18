import 'package:equatable/equatable.dart';
import 'package:fin_uslugi/features/coupons/data/models/features_model.dart';
import 'package:fin_uslugi/features/coupons/data/models/meta_model.dart';
import 'package:hive_ce_flutter/adapters.dart';
part 'coupon_item_model.g.dart';

@HiveType(typeId: 3)
class CouponItem extends Equatable {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final String slug;

  @HiveField(2)
  final String value;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final int vygodaOrderNum;

  @HiveField(5)
  final MetaModel meta;

  @HiveField(6)
  final FeaturesModel features;

  @HiveField(7)
  final int dateStart;

  @HiveField(8)
  final int dateEnd;

  @HiveField(9)
  final String shortDescription;

  @HiveField(10)
  final String? condition;

  const CouponItem({
    required this.uuid,
    required this.slug,
    required this.value,
    required this.description,
    required this.vygodaOrderNum,
    required this.meta,
    required this.features,
    required this.dateStart,
    required this.dateEnd,
    required this.shortDescription,
    required this.condition,
  });

  CouponItem.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'],
        slug = json['slug'],
        value = json['value'],
        description = json['description'],
        vygodaOrderNum = json['vygodaOrderNum'],
        meta = MetaModel.fromJson(json['meta']),
        features = FeaturesModel.fromJson(json['features']),
        dateStart = json['dateStart'],
        dateEnd = json['dateEnd'],
        condition = json['condition'] ?? '',
        shortDescription = json['shortDescription'] ?? '';

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'slug': slug,
        'value': value,
        'description': description,
        'vygodaOrderNum': vygodaOrderNum,
        'meta': meta,
        'features': features,
        'dateStart': dateStart,
        'dateEnd': dateEnd,
        'shortDescription': shortDescription,
        'condition': condition,
      };

  @override
  List<Object?> get props => [
        uuid,
        slug,
        value,
        description,
        vygodaOrderNum,
        meta,
        features,
        dateStart,
        dateEnd,
        shortDescription,
        condition,
      ];
}
