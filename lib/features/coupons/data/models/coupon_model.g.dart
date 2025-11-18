// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CouponModelAdapter extends TypeAdapter<CouponModel> {
  @override
  final typeId = 0;

  @override
  CouponModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CouponModel(
      total: (fields[0] as num).toInt(),
      coupons: (fields[4] as List).cast<CouponItem>(),
      totalOffersCount: (fields[1] as num).toInt(),
      previewText: fields[2] as String?,
      retailer: fields[3] as RetailerModel,
      type: fields[5] as String?,
      imageUrl: fields[6] as String?,
      url: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CouponModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.totalOffersCount)
      ..writeByte(2)
      ..write(obj.previewText)
      ..writeByte(3)
      ..write(obj.retailer)
      ..writeByte(4)
      ..write(obj.coupons)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(7)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CouponModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
