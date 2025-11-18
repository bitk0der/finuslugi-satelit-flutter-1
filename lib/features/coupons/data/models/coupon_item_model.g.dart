// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CouponItemAdapter extends TypeAdapter<CouponItem> {
  @override
  final typeId = 3;

  @override
  CouponItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CouponItem(
      uuid: fields[0] as String,
      slug: fields[1] as String,
      value: fields[2] as String,
      description: fields[3] as String,
      vygodaOrderNum: (fields[4] as num).toInt(),
      meta: fields[5] as MetaModel,
      features: fields[6] as FeaturesModel,
      dateStart: (fields[7] as num).toInt(),
      dateEnd: (fields[8] as num).toInt(),
      shortDescription: fields[9] as String,
      condition: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CouponItem obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.value)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.vygodaOrderNum)
      ..writeByte(5)
      ..write(obj.meta)
      ..writeByte(6)
      ..write(obj.features)
      ..writeByte(7)
      ..write(obj.dateStart)
      ..writeByte(8)
      ..write(obj.dateEnd)
      ..writeByte(9)
      ..write(obj.shortDescription)
      ..writeByte(10)
      ..write(obj.condition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CouponItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
