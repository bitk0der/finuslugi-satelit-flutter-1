// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BankingCategoryAdapter extends TypeAdapter<BankingCategory> {
  @override
  final typeId = 0;

  @override
  BankingCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BankingCategory.credits;
      case 1:
        return BankingCategory.creditCards;
      case 2:
        return BankingCategory.debitCards;
      case 3:
        return BankingCategory.deposits;
      case 4:
        return BankingCategory.mortgages;
      case 5:
        return BankingCategory.banks;
      default:
        return BankingCategory.credits;
    }
  }

  @override
  void write(BinaryWriter writer, BankingCategory obj) {
    switch (obj) {
      case BankingCategory.credits:
        writer.writeByte(0);
      case BankingCategory.creditCards:
        writer.writeByte(1);
      case BankingCategory.debitCards:
        writer.writeByte(2);
      case BankingCategory.deposits:
        writer.writeByte(3);
      case BankingCategory.mortgages:
        writer.writeByte(4);
      case BankingCategory.banks:
        writer.writeByte(5);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankingCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
