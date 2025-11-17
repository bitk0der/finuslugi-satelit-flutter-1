// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mortgage_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MortgageResponseAdapter extends TypeAdapter<MortgageResponse> {
  @override
  final typeId = 8;

  @override
  MortgageResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MortgageResponse(
      id: (fields[0] as num).toInt(),
      date: fields[1] as DateTime,
      dateGmt: fields[2] as DateTime,
      modified: fields[3] as DateTime,
      modifiedGmt: fields[4] as DateTime,
      slug: fields[5] as String,
      status: fields[6] as String,
      type: fields[7] as String,
      cardName: fields[8] as String,
      featuredMedia: fields[9] as String,
      template: fields[10] as String,
      jfLimitResponses: fields[11] as String?,
      offerUrl: fields[12] as String,
      inHorizontalTop: fields[13] as String,
      isArchive: fields[14] as String,
      offerEpc: fields[15] as String,
      initialAmountMin: fields[16] as String,
      initialAmountMax: fields[17] as String,
      sumFrom: fields[18] as String,
      sumTo: fields[19] as String,
      ratePskFrom: fields[20] as String,
      ratePskTo: fields[21] as String,
      termFrom: fields[22] as String,
      termTo: fields[23] as String,
      unitFrom: fields[24] as String,
      unitTo: fields[25] as String,
      creditPurposes: (fields[26] as List).cast<String>(),
      programs: (fields[27] as List).cast<String>(),
      additionalConditions: fields[28] as String,
      rating: fields[29] as String,
      bankLogo: fields[31] as String,
      parentPostRelation: fields[32] as String,
      bankName: fields[30] as String,
      productType: fields[33] as BankingCategory,
      insurance: (fields[40] as List).cast<String>(),
      demands: (fields[39] as List).cast<String>(),
      documentsRequired: (fields[37] as List).cast<String>(),
      experienceRecent: fields[35] as String,
      loanAge: fields[34] as String,
      security: (fields[38] as List).cast<String>(),
      customerType: fields[36] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MortgageResponse obj) {
    writer
      ..writeByte(41)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.dateGmt)
      ..writeByte(3)
      ..write(obj.modified)
      ..writeByte(4)
      ..write(obj.modifiedGmt)
      ..writeByte(5)
      ..write(obj.slug)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.type)
      ..writeByte(8)
      ..write(obj.cardName)
      ..writeByte(9)
      ..write(obj.featuredMedia)
      ..writeByte(10)
      ..write(obj.template)
      ..writeByte(11)
      ..write(obj.jfLimitResponses)
      ..writeByte(12)
      ..write(obj.offerUrl)
      ..writeByte(13)
      ..write(obj.inHorizontalTop)
      ..writeByte(14)
      ..write(obj.isArchive)
      ..writeByte(15)
      ..write(obj.offerEpc)
      ..writeByte(16)
      ..write(obj.initialAmountMin)
      ..writeByte(17)
      ..write(obj.initialAmountMax)
      ..writeByte(18)
      ..write(obj.sumFrom)
      ..writeByte(19)
      ..write(obj.sumTo)
      ..writeByte(20)
      ..write(obj.ratePskFrom)
      ..writeByte(21)
      ..write(obj.ratePskTo)
      ..writeByte(22)
      ..write(obj.termFrom)
      ..writeByte(23)
      ..write(obj.termTo)
      ..writeByte(24)
      ..write(obj.unitFrom)
      ..writeByte(25)
      ..write(obj.unitTo)
      ..writeByte(26)
      ..write(obj.creditPurposes)
      ..writeByte(27)
      ..write(obj.programs)
      ..writeByte(28)
      ..write(obj.additionalConditions)
      ..writeByte(29)
      ..write(obj.rating)
      ..writeByte(30)
      ..write(obj.bankName)
      ..writeByte(31)
      ..write(obj.bankLogo)
      ..writeByte(32)
      ..write(obj.parentPostRelation)
      ..writeByte(33)
      ..write(obj.productType)
      ..writeByte(34)
      ..write(obj.loanAge)
      ..writeByte(35)
      ..write(obj.experienceRecent)
      ..writeByte(36)
      ..write(obj.customerType)
      ..writeByte(37)
      ..write(obj.documentsRequired)
      ..writeByte(38)
      ..write(obj.security)
      ..writeByte(39)
      ..write(obj.demands)
      ..writeByte(40)
      ..write(obj.insurance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MortgageResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
