// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleDataAdapter extends TypeAdapter<ArticleData> {
  @override
  final typeId = 1;

  @override
  ArticleData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleData(
      article: fields[0] as Article,
      articleCategories: fields[1] as ArticleCategories,
      productTypes: (fields[2] as List).cast<ProductType>(),
      productModels: fields[3] as ProductModel,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.article)
      ..writeByte(1)
      ..write(obj.articleCategories)
      ..writeByte(2)
      ..write(obj.productTypes)
      ..writeByte(3)
      ..write(obj.productModels);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
