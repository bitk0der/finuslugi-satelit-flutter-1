import 'package:fin_uslugi/features/programms/data/models/content_block_model.dart';
import 'package:hive_ce_flutter/adapters.dart';
part 'article_model.g.dart';

@HiveType(typeId: 26)
class Article {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String productType;
  @HiveField(2)
  final String productTypeAlias;
  @HiveField(3)
  final String organizationId;
  @HiveField(4)
  final String productId;
  @HiveField(5)
  final String cityId;
  @HiveField(6)
  final String name;
  @HiveField(7)
  final String title;
  @HiveField(8)
  final String description;
  @HiveField(9)
  final String slug;
  @HiveField(10)
  final String seoTitle;
  @HiveField(11)
  final String seoDescription;
  @HiveField(12)
  final List<ContentBlock> contentBlocks;
  @HiveField(13)
  final String url;

  Article({
    required this.id,
    required this.productType,
    required this.productTypeAlias,
    required this.organizationId,
    required this.productId,
    required this.cityId,
    required this.name,
    required this.title,
    required this.description,
    required this.slug,
    required this.seoTitle,
    required this.seoDescription,
    required this.contentBlocks,
    required this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] ?? '',
      productType: json['productType'] ?? '',
      productTypeAlias: json['productTypeAlias'] ?? '',
      organizationId: json['organizationId'] ?? '',
      productId: json['productId'] ?? '',
      cityId: json['cityId'] ?? '',
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      slug: json['slug'] ?? '',
      seoTitle: json['seoTitle'] ?? '',
      seoDescription: json['seoDescription'] ?? '',
      contentBlocks: (json['contentBlocks'] as List<dynamic>?)
              ?.map((block) => ContentBlock.fromJson(block))
              .toList() ??
          [],
      url: json['url'] ?? '',
    );
  }
}
