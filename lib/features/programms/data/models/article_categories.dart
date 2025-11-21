import 'package:fin_uslugi/features/programms/data/models/article_category.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'article_categories.g.dart';

@HiveType(typeId: 23)
class ArticleCategories {
  @HiveField(0)
  final List<ArticleCategory> items;
  @HiveField(1)
  final int limit;
  @HiveField(2)
  final int page;
  @HiveField(3)
  final int pageCount;
  @HiveField(4)
  final int totalCount;

  ArticleCategories({
    required this.items,
    required this.limit,
    required this.page,
    required this.pageCount,
    required this.totalCount,
  });

  factory ArticleCategories.fromJson(Map<String, dynamic> json) {
    return ArticleCategories(
      items: (json['items'] as List<dynamic>?)
              ?.map((item) => ArticleCategory.fromJson(item))
              .toList() ??
          [],
      limit: json['limit'] ?? 0,
      page: json['page'] ?? 0,
      pageCount: json['pageCount'] ?? 0,
      totalCount: json['totalCount'] ?? 0,
    );
  }
}
