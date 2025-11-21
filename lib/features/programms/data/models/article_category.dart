import 'package:fin_uslugi/features/programms/data/models/article_model.dart';
import 'package:hive_ce_flutter/adapters.dart';
part 'article_category.g.dart';

@HiveType(typeId: 24)
class ArticleCategory {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final List<Article> articles;

  ArticleCategory({
    required this.name,
    required this.title,
    required this.articles,
  });

  factory ArticleCategory.fromJson(Map<String, dynamic> json) {
    return ArticleCategory(
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      articles: json['articles'] == null
          ? []
          : List.generate(json['articles'].length,
              (index) => Article.fromJson(json['articles'][index])),
    );
  }
}
