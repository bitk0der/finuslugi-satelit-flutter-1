// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'features_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeaturesModelAdapter extends TypeAdapter<FeaturesModel> {
  @override
  final typeId = 4;

  @override
  FeaturesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeaturesModel(
      forNewUser: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FeaturesModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.forNewUser);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeaturesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
