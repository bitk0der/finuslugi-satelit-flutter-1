// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final typeId = 26;

  @override
  Article read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Article(
      id: fields[0] as String,
      productType: fields[1] as String,
      productTypeAlias: fields[2] as String,
      organizationId: fields[3] as String,
      productId: fields[4] as String,
      cityId: fields[5] as String,
      name: fields[6] as String,
      title: fields[7] as String,
      description: fields[8] as String,
      slug: fields[9] as String,
      seoTitle: fields[10] as String,
      seoDescription: fields[11] as String,
      contentBlocks: (fields[12] as List).cast<ContentBlock>(),
      url: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Article obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productType)
      ..writeByte(2)
      ..write(obj.productTypeAlias)
      ..writeByte(3)
      ..write(obj.organizationId)
      ..writeByte(4)
      ..write(obj.productId)
      ..writeByte(5)
      ..write(obj.cityId)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.title)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.slug)
      ..writeByte(10)
      ..write(obj.seoTitle)
      ..writeByte(11)
      ..write(obj.seoDescription)
      ..writeByte(12)
      ..write(obj.contentBlocks)
      ..writeByte(13)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
