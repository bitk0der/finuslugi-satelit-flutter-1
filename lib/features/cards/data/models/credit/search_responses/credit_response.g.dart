// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditResponseAdapter extends TypeAdapter<CreditResponse> {
  @override
  final typeId = 2;

  @override
  CreditResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditResponse(
      productType: fields[0] as BankingCategory,
      id: fields[1] as String,
      cardName: fields[2] as String,
      offerUrl: fields[7] as String,
      link: fields[3] as String,
      bankName: fields[4] as String,
      bankLogoUrl: fields[5] as String,
      fullImageUrl: fields[6] as String,
      sumFrom: (fields[8] as num).toInt(),
      sumTo: (fields[9] as num).toInt(),
      rateFrom: (fields[10] as num).toDouble(),
      rateTo: (fields[11] as num).toDouble(),
      termFrom: (fields[12] as num).toInt(),
      termTo: (fields[13] as num).toInt(),
      termUnit: fields[14] as String,
      applicationTime: fields[15] as String,
      applicationUnit: fields[16] as String,
      minAge: (fields[17] as num).toInt(),
      minIncome: fields[18] as String,
      workExperienceRecent: (fields[19] as num).toInt(),
      workExperienceTotal: (fields[20] as num).toInt(),
      creditPurposes: (fields[21] as List).cast<String>(),
      customerType: fields[22] as String,
      obtainingMethods: (fields[23] as List).cast<String>(),
      demands: (fields[24] as List).cast<String>(),
      paymentTypes: (fields[25] as List).cast<String>(),
      paymentFrequencies: (fields[26] as List).cast<String>(),
      security: (fields[27] as List).cast<String>(),
      guarantorFilter: fields[28] as String,
      requiredDocuments: (fields[29] as List).cast<String>(),
      optionalDocuments: (fields[30] as List).cast<String>(),
      additionalConditions: fields[31] as String,
      parentPostRelation: (fields[32] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, CreditResponse obj) {
    writer
      ..writeByte(33)
      ..writeByte(0)
      ..write(obj.productType)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.cardName)
      ..writeByte(3)
      ..write(obj.link)
      ..writeByte(4)
      ..write(obj.bankName)
      ..writeByte(5)
      ..write(obj.bankLogoUrl)
      ..writeByte(6)
      ..write(obj.fullImageUrl)
      ..writeByte(7)
      ..write(obj.offerUrl)
      ..writeByte(8)
      ..write(obj.sumFrom)
      ..writeByte(9)
      ..write(obj.sumTo)
      ..writeByte(10)
      ..write(obj.rateFrom)
      ..writeByte(11)
      ..write(obj.rateTo)
      ..writeByte(12)
      ..write(obj.termFrom)
      ..writeByte(13)
      ..write(obj.termTo)
      ..writeByte(14)
      ..write(obj.termUnit)
      ..writeByte(15)
      ..write(obj.applicationTime)
      ..writeByte(16)
      ..write(obj.applicationUnit)
      ..writeByte(17)
      ..write(obj.minAge)
      ..writeByte(18)
      ..write(obj.minIncome)
      ..writeByte(19)
      ..write(obj.workExperienceRecent)
      ..writeByte(20)
      ..write(obj.workExperienceTotal)
      ..writeByte(21)
      ..write(obj.creditPurposes)
      ..writeByte(22)
      ..write(obj.customerType)
      ..writeByte(23)
      ..write(obj.obtainingMethods)
      ..writeByte(24)
      ..write(obj.demands)
      ..writeByte(25)
      ..write(obj.paymentTypes)
      ..writeByte(26)
      ..write(obj.paymentFrequencies)
      ..writeByte(27)
      ..write(obj.security)
      ..writeByte(28)
      ..write(obj.guarantorFilter)
      ..writeByte(29)
      ..write(obj.requiredDocuments)
      ..writeByte(30)
      ..write(obj.optionalDocuments)
      ..writeByte(31)
      ..write(obj.additionalConditions)
      ..writeByte(32)
      ..write(obj.parentPostRelation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
