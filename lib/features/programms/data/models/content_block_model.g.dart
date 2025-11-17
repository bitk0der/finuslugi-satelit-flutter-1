// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_block_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContentBlockAdapter extends TypeAdapter<ContentBlock> {
  @override
  final typeId = 5;

  @override
  ContentBlock read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContentBlock(
      type: fields[0] as String,
      data: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ContentBlock obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContentBlockAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
