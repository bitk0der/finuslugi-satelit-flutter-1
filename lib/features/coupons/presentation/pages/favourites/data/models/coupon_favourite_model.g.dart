// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_favourite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CouponFavouriteModelAdapter extends TypeAdapter<CouponFavouriteModel> {
  @override
  final typeId = 5;

  @override
  CouponFavouriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CouponFavouriteModel(
      coupon: fields[0] as CouponItem,
      retailer: fields[1] as RetailerModel,
    );
  }

  @override
  void write(BinaryWriter writer, CouponFavouriteModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.coupon)
      ..writeByte(1)
      ..write(obj.retailer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CouponFavouriteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
