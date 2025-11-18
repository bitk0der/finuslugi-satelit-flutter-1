// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsInfoAdapter extends TypeAdapter<ProductsInfo> {
  @override
  final int typeId = 6;

  @override
  ProductsInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductsInfo(
      kredityCount: fields[0] as int,
      kreditnieKartyCount: fields[1] as int,
      debetovieKartyCount: fields[2] as int,
      vkladyCountCount: fields[3] as int,
      ipotekaCount: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductsInfo obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.kredityCount)
      ..writeByte(1)
      ..write(obj.kreditnieKartyCount)
      ..writeByte(2)
      ..write(obj.debetovieKartyCount)
      ..writeByte(3)
      ..write(obj.vkladyCountCount)
      ..writeByte(4)
      ..write(obj.ipotekaCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
