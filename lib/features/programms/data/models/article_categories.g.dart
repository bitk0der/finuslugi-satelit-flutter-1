// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_categories.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleCategoriesAdapter extends TypeAdapter<ArticleCategories> {
  @override
  final typeId = 23;

  @override
  ArticleCategories read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleCategories(
      items: (fields[0] as List).cast<ArticleCategory>(),
      limit: (fields[1] as num).toInt(),
      page: (fields[2] as num).toInt(),
      pageCount: (fields[3] as num).toInt(),
      totalCount: (fields[4] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ArticleCategories obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.items)
      ..writeByte(1)
      ..write(obj.limit)
      ..writeByte(2)
      ..write(obj.page)
      ..writeByte(3)
      ..write(obj.pageCount)
      ..writeByte(4)
      ..write(obj.totalCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleCategoriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
