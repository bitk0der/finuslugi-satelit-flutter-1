// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditCardResponseAdapter extends TypeAdapter<CreditCardResponse> {
  @override
  final typeId = 1;

  @override
  CreditCardResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditCardResponse(
      id: fields[0] as String,
      productType: fields[1] as BankingCategory,
      minCreditSum: (fields[2] as num).toInt(),
      maxCreditSum: (fields[3] as num).toInt(),
      interestFreePeriod: (fields[4] as num).toInt(),
      minPayment: fields[5] as String,
      installmentMonths: (fields[6] as num).toInt(),
      paymentSystem: fields[7] as String,
      smartphonePayments: (fields[8] as List).cast<String>(),
      firstYearServiceCost: (fields[9] as num).toInt(),
      secondYearServiceCost: (fields[10] as num).toInt(),
      cardClass: fields[11] as String,
      features: (fields[12] as List).cast<String>(),
      advantages: (fields[13] as List).cast<String>(),
      cashWithdrawalFee: (fields[14] as num).toDouble(),
      withdrawalLocations: (fields[15] as List).cast<String>(),
      partnerBanks: (fields[16] as List).cast<String>(),
      minAge: (fields[17] as num).toInt(),
      workExperience: (fields[18] as num).toInt(),
      incomeDocuments: (fields[19] as List).cast<String>(),
      requiredDocuments: (fields[20] as List).cast<String>(),
      clientRequirements: (fields[21] as List).cast<String>(),
      bonusType: fields[22] as String,
      maxCashback: fields[23] as String,
      cashbackCategories: (fields[24] as List).cast<String>(),
      cashbackDescription: fields[25] as String,
      bankName: fields[26] as String,
      cardName: fields[27] as String,
      bankLogoUrl: fields[28] as String,
      additionalImageUrl: fields[29] as String,
      parentPostTitle: fields[30] as String,
      yoastTitle: fields[31] as String,
      offerUrl: fields[33] as String,
      parentPostRelation: (fields[32] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, CreditCardResponse obj) {
    writer
      ..writeByte(34)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productType)
      ..writeByte(2)
      ..write(obj.minCreditSum)
      ..writeByte(3)
      ..write(obj.maxCreditSum)
      ..writeByte(4)
      ..write(obj.interestFreePeriod)
      ..writeByte(5)
      ..write(obj.minPayment)
      ..writeByte(6)
      ..write(obj.installmentMonths)
      ..writeByte(7)
      ..write(obj.paymentSystem)
      ..writeByte(8)
      ..write(obj.smartphonePayments)
      ..writeByte(9)
      ..write(obj.firstYearServiceCost)
      ..writeByte(10)
      ..write(obj.secondYearServiceCost)
      ..writeByte(11)
      ..write(obj.cardClass)
      ..writeByte(12)
      ..write(obj.features)
      ..writeByte(13)
      ..write(obj.advantages)
      ..writeByte(14)
      ..write(obj.cashWithdrawalFee)
      ..writeByte(15)
      ..write(obj.withdrawalLocations)
      ..writeByte(16)
      ..write(obj.partnerBanks)
      ..writeByte(17)
      ..write(obj.minAge)
      ..writeByte(18)
      ..write(obj.workExperience)
      ..writeByte(19)
      ..write(obj.incomeDocuments)
      ..writeByte(20)
      ..write(obj.requiredDocuments)
      ..writeByte(21)
      ..write(obj.clientRequirements)
      ..writeByte(22)
      ..write(obj.bonusType)
      ..writeByte(23)
      ..write(obj.maxCashback)
      ..writeByte(24)
      ..write(obj.cashbackCategories)
      ..writeByte(25)
      ..write(obj.cashbackDescription)
      ..writeByte(26)
      ..write(obj.bankName)
      ..writeByte(27)
      ..write(obj.cardName)
      ..writeByte(28)
      ..write(obj.bankLogoUrl)
      ..writeByte(29)
      ..write(obj.additionalImageUrl)
      ..writeByte(30)
      ..write(obj.parentPostTitle)
      ..writeByte(31)
      ..write(obj.yoastTitle)
      ..writeByte(32)
      ..write(obj.parentPostRelation)
      ..writeByte(33)
      ..write(obj.offerUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditCardResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
