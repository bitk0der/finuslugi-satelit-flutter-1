// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retailer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RetailerModelAdapter extends TypeAdapter<RetailerModel> {
  @override
  final typeId = 21;

  @override
  RetailerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RetailerModel(
      uuid: fields[0] as String,
      slug: fields[1] as String,
      name: fields[2] as String,
      nearest: (fields[3] as List).cast<dynamic>(),
      website: fields[4] as String,
      imageUrl: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RetailerModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.nearest)
      ..writeByte(4)
      ..write(obj.website)
      ..writeByte(5)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RetailerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
