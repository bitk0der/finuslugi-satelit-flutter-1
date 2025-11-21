import 'package:fin_uslugi/features/programms/data/models/product_item_model.dart';
import 'package:hive_ce_flutter/adapters.dart';
part 'product_model.g.dart';

@HiveType(typeId: 30)
class ProductModel {
  @HiveField(0)
  final List<ProductItemModel> items;
  @HiveField(1)
  final int limit;
  @HiveField(2)
  final int page;
  @HiveField(3)
  final int pageCount;
  @HiveField(4)
  final int totalCount;
  ProductModel({
    required this.items,
    required this.limit,
    required this.page,
    required this.pageCount,
    required this.totalCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      items: (json['items'] as List<dynamic>?)
              ?.map((item) => ProductItemModel.fromJson(item))
              .toList() ??
          [],
      limit: json['limit'] ?? 0,
      page: json['page'] ?? 0,
      pageCount: json['pageCount'] ?? 0,
      totalCount: json['totalCount'] ?? 0,
    );
  }
}
