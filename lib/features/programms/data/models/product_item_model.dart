import 'package:fin_uslugi/features/programms/data/models/banner_model.dart';
import 'package:fin_uslugi/features/programms/data/models/params_model.dart';
import 'package:hive_ce_flutter/adapters.dart';
part 'product_item_model.g.dart';

@HiveType(typeId: 29)
class ProductItemModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String productType;
  @HiveField(2)
  String organizationId;
  @HiveField(3)
  String alias;
  @HiveField(4)
  String name;
  @HiveField(5)
  String url;
  @HiveField(6)
  String productLogo;
  @HiveField(7)
  String organizationName;
  @HiveField(8)
  String organizationUrl;
  @HiveField(9)
  String organizationLogo;
  @HiveField(10)
  String organizationRoundLogo;
  @HiveField(11)
  String organizationProductTypeUrl;
  @HiveField(12)
  ParamsModel params;
  BannerModel? banner;
  ProductItemModel(
      {required this.id,
      required this.productType,
      required this.organizationId,
      required this.alias,
      required this.name,
      required this.url,
      required this.productLogo,
      required this.organizationName,
      required this.organizationUrl,
      required this.organizationLogo,
      required this.organizationRoundLogo,
      required this.organizationProductTypeUrl,
      required this.params,
      this.banner});

  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      id: json['id'] ?? '',
      productType: json['productType'] ?? '',
      organizationId: json['organizationId'] ?? '',
      alias: json['alias'] ?? '',
      name: json['name'] ?? '',
      url: json['url'] ?? '',
      productLogo: json['productLogo'] ?? '',
      organizationName: json['organizationName'] ?? '',
      organizationUrl: json['organizationUrl'] ?? '',
      organizationLogo: json['organizationLogo'] ?? '',
      organizationRoundLogo: json['organizationRoundLogo'] ?? '',
      organizationProductTypeUrl: json['organizationProductTypeUrl'] ?? '',
      banner: json['imageUrl'] != null ? BannerModel.fromJson(json) : null,
      params: ParamsModel.fromJson(json['params'] ?? {}),
    );
  }
}
