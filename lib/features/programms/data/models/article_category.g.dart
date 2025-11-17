// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleCategoryAdapter extends TypeAdapter<ArticleCategory> {
  @override
  final typeId = 3;

  @override
  ArticleCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleCategory(
      name: fields[0] as String,
      title: fields[1] as String,
      articles: (fields[2] as List).cast<Article>(),
    );
  }

  @override
  void write(BinaryWriter writer, ArticleCategory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.articles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
