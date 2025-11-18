// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BankInfoAdapter extends TypeAdapter<BankInfo> {
  @override
  final typeId = 5;

  @override
  BankInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BankInfo(
      productType: fields[0] as BankingCategory,
      id: (fields[1] as num).toInt(),
      bankName: fields[3] as String,
      fullName: fields[2] as String,
      registrationDate: fields[4] as String,
      license: fields[5] as String,
      website: fields[6] as String,
      phone: fields[7] as String,
      address: fields[8] as String,
      ogrn: fields[9] as String,
      inn: fields[10] as String,
      kpp: fields[11] as String,
      okpo: fields[12] as String,
      bik: fields[13] as String,
      swift: fields[14] as String,
      aboutBank: fields[15] as String,
      logoRound: fields[16] as String,
      logosquare: fields[17] as String,
      productsInfo: fields[19] as ProductsInfo,
      rating: fields[18] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BankInfo obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.productType)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.bankName)
      ..writeByte(4)
      ..write(obj.registrationDate)
      ..writeByte(5)
      ..write(obj.license)
      ..writeByte(6)
      ..write(obj.website)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.ogrn)
      ..writeByte(10)
      ..write(obj.inn)
      ..writeByte(11)
      ..write(obj.kpp)
      ..writeByte(12)
      ..write(obj.okpo)
      ..writeByte(13)
      ..write(obj.bik)
      ..writeByte(14)
      ..write(obj.swift)
      ..writeByte(15)
      ..write(obj.aboutBank)
      ..writeByte(16)
      ..write(obj.logoRound)
      ..writeByte(17)
      ..write(obj.logosquare)
      ..writeByte(18)
      ..write(obj.rating)
      ..writeByte(19)
      ..write(obj.productsInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
