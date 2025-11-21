// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debit_card_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DebitCardResponseAdapter extends TypeAdapter<DebitCardResponse> {
  @override
  final typeId = 4;

  @override
  DebitCardResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DebitCardResponse(
      id: fields[1] as String,
      productType: fields[0] as BankingCategory,
      cardName: fields[2] as String,
      status: fields[3] as String,
      type: fields[4] as String,
      link: fields[5] as String,
      offerUrl: fields[6] as String,
      fullImageUrl: fields[7] as String,
      bankLogoUrl: fields[8] as String,
      bankName: fields[9] as String,
      cardClass: fields[10] as String,
      maintenancePriceFirstYear: (fields[12] as num).toInt(),
      maintenancePriceSecondYear: (fields[13] as num).toInt(),
      cashbackValue: (fields[14] as num).toDouble(),
      cashbackValueMax: (fields[15] as num).toDouble(),
      cashbackDescription: fields[16] as String,
      incomeDescription: fields[17] as String,
      paymentSystems: (fields[19] as List).cast<String>(),
      smartphonePayments: (fields[20] as List).cast<String>(),
      operationLimit: fields[21] as String,
      withdrawalComment: fields[22] as String,
      cardFeatures: (fields[23] as List).cast<String>(),
      benefits: (fields[24] as List).cast<String>(),
      withdrawalLocations: (fields[25] as List).cast<String>(),
      balanceincomerate: fields[11] as String,
      ageFrom: fields[18] as String,
      documents: (fields[26] as List).cast<String>(),
      cashbackCategories: (fields[27] as List).cast<String>(),
      parentPostRelation: (fields[28] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, DebitCardResponse obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.productType)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.cardName)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.link)
      ..writeByte(6)
      ..write(obj.offerUrl)
      ..writeByte(7)
      ..write(obj.fullImageUrl)
      ..writeByte(8)
      ..write(obj.bankLogoUrl)
      ..writeByte(9)
      ..write(obj.bankName)
      ..writeByte(10)
      ..write(obj.cardClass)
      ..writeByte(11)
      ..write(obj.balanceincomerate)
      ..writeByte(12)
      ..write(obj.maintenancePriceFirstYear)
      ..writeByte(13)
      ..write(obj.maintenancePriceSecondYear)
      ..writeByte(14)
      ..write(obj.cashbackValue)
      ..writeByte(15)
      ..write(obj.cashbackValueMax)
      ..writeByte(16)
      ..write(obj.cashbackDescription)
      ..writeByte(17)
      ..write(obj.incomeDescription)
      ..writeByte(18)
      ..write(obj.ageFrom)
      ..writeByte(19)
      ..write(obj.paymentSystems)
      ..writeByte(20)
      ..write(obj.smartphonePayments)
      ..writeByte(21)
      ..write(obj.operationLimit)
      ..writeByte(22)
      ..write(obj.withdrawalComment)
      ..writeByte(23)
      ..write(obj.cardFeatures)
      ..writeByte(24)
      ..write(obj.benefits)
      ..writeByte(25)
      ..write(obj.withdrawalLocations)
      ..writeByte(26)
      ..write(obj.documents)
      ..writeByte(27)
      ..write(obj.cashbackCategories)
      ..writeByte(28)
      ..write(obj.parentPostRelation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DebitCardResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
