import 'package:hive_ce_flutter/adapters.dart';
part 'product_type.g.dart';

@HiveType(typeId: 31)
class ProductType {
  @HiveField(0)
  final String type;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String alias;
  @HiveField(3)
  final String url;

  ProductType({
    required this.type,
    required this.name,
    required this.alias,
    required this.url,
  });

  factory ProductType.fromJson(Map<String, dynamic> json) {
    return ProductType(
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      alias: json['alias'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
