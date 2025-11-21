// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductItemModelAdapter extends TypeAdapter<ProductItemModel> {
  @override
  final typeId = 29;

  @override
  ProductItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductItemModel(
      id: fields[0] as String,
      productType: fields[1] as String,
      organizationId: fields[2] as String,
      alias: fields[3] as String,
      name: fields[4] as String,
      url: fields[5] as String,
      productLogo: fields[6] as String,
      organizationName: fields[7] as String,
      organizationUrl: fields[8] as String,
      organizationLogo: fields[9] as String,
      organizationRoundLogo: fields[10] as String,
      organizationProductTypeUrl: fields[11] as String,
      params: fields[12] as ParamsModel,
    );
  }

  @override
  void write(BinaryWriter writer, ProductItemModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productType)
      ..writeByte(2)
      ..write(obj.organizationId)
      ..writeByte(3)
      ..write(obj.alias)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.productLogo)
      ..writeByte(7)
      ..write(obj.organizationName)
      ..writeByte(8)
      ..write(obj.organizationUrl)
      ..writeByte(9)
      ..write(obj.organizationLogo)
      ..writeByte(10)
      ..write(obj.organizationRoundLogo)
      ..writeByte(11)
      ..write(obj.organizationProductTypeUrl)
      ..writeByte(12)
      ..write(obj.params);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
