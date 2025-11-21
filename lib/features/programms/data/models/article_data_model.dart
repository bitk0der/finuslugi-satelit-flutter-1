import 'package:hive_ce_flutter/adapters.dart';
import 'package:fin_uslugi/features/programms/data/models/article_categories.dart';
import 'package:fin_uslugi/features/programms/data/models/article_model.dart';
import 'package:fin_uslugi/features/programms/data/models/product_model.dart';
import 'package:fin_uslugi/features/programms/data/models/product_type.dart';
part 'article_data_model.g.dart';

@HiveType(typeId: 25)
class ArticleData {
  @HiveField(0)
  final Article article;
  @HiveField(1)
  final ArticleCategories articleCategories;
  @HiveField(2)
  final List<ProductType> productTypes;
  @HiveField(3)
  final ProductModel productModels;

  ArticleData({
    required this.article,
    required this.articleCategories,
    required this.productTypes,
    required this.productModels,
  });

  factory ArticleData.fromJson(Map<String, dynamic> json) {
    return ArticleData(
      article: Article.fromJson(json['article']),
      articleCategories: ArticleCategories.fromJson(json['articleCategories']),
      productModels: ProductModel.fromJson(json['products']),
      productTypes: (json['productTypes'] as List<dynamic>?)
              ?.map((type) => ProductType.fromJson(type))
              .toList() ??
          [],
    );
  }
}
