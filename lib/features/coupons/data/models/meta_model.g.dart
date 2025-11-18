// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MetaModelAdapter extends TypeAdapter<MetaModel> {
  @override
  final typeId = 2;

  @override
  MetaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MetaModel(
      activationsCount: (fields[0] as num).toInt(),
      goodsCompilation: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MetaModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.activationsCount)
      ..writeByte(1)
      ..write(obj.goodsCompilation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
