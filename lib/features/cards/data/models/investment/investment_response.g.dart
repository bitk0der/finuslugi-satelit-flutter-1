// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvestmentResponseAdapter extends TypeAdapter<InvestmentResponse> {
  @override
  final typeId = 7;

  @override
  InvestmentResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvestmentResponse(
      id: fields[0] as String,
      productType: fields[40] as BankingCategory,
      date: fields[1] as DateTime,
      dateGmt: fields[2] as DateTime,
      modified: fields[3] as DateTime,
      modifiedGmt: fields[4] as DateTime,
      slug: fields[5] as String,
      status: fields[6] as String,
      type: fields[7] as String,
      cardName: fields[8] as String,
      featuredMedia: (fields[9] as num).toInt(),
      menuOrder: (fields[10] as num).toInt(),
      template: fields[11] as String,
      jfLimitResponses: fields[12] as String?,
      offerUrl: fields[13] as String,
      inHorizontalTop: fields[14] as String,
      isArchive: fields[15] as String,
      offerEpc: fields[16] as String,
      depositType: fields[17] as String,
      feature: fields[18] as String,
      sumFrom: fields[19] as String,
      sumTo: fields[20] as String,
      ratePskFrom: fields[21] as String,
      ratePskTo: fields[22] as String,
      termFrom: fields[23] as String,
      termTo: fields[24] as String,
      haveReplenishment: fields[25] as String,
      haveCapitalization: fields[26] as String,
      haveFreeTermination: fields[27] as String,
      accumulativeDepositType: fields[28] as String,
      capitalizationText: fields[29] as String,
      partialWithdrawalText: fields[30] as String,
      replenishmentText: fields[31] as String,
      earlyTerminationText: fields[32] as String,
      additionalText: fields[33] as String,
      additionalDescription: fields[34] as String,
      footnotes: fields[35] as String,
      rating: fields[36] as String,
      bankName: fields[37] as String,
      bankLogo: fields[38] as String,
      parentPostRelation: fields[39] as String,
    );
  }

  @override
  void write(BinaryWriter writer, InvestmentResponse obj) {
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
      ..write(obj.menuOrder)
      ..writeByte(11)
      ..write(obj.template)
      ..writeByte(12)
      ..write(obj.jfLimitResponses)
      ..writeByte(13)
      ..write(obj.offerUrl)
      ..writeByte(14)
      ..write(obj.inHorizontalTop)
      ..writeByte(15)
      ..write(obj.isArchive)
      ..writeByte(16)
      ..write(obj.offerEpc)
      ..writeByte(17)
      ..write(obj.depositType)
      ..writeByte(18)
      ..write(obj.feature)
      ..writeByte(19)
      ..write(obj.sumFrom)
      ..writeByte(20)
      ..write(obj.sumTo)
      ..writeByte(21)
      ..write(obj.ratePskFrom)
      ..writeByte(22)
      ..write(obj.ratePskTo)
      ..writeByte(23)
      ..write(obj.termFrom)
      ..writeByte(24)
      ..write(obj.termTo)
      ..writeByte(25)
      ..write(obj.haveReplenishment)
      ..writeByte(26)
      ..write(obj.haveCapitalization)
      ..writeByte(27)
      ..write(obj.haveFreeTermination)
      ..writeByte(28)
      ..write(obj.accumulativeDepositType)
      ..writeByte(29)
      ..write(obj.capitalizationText)
      ..writeByte(30)
      ..write(obj.partialWithdrawalText)
      ..writeByte(31)
      ..write(obj.replenishmentText)
      ..writeByte(32)
      ..write(obj.earlyTerminationText)
      ..writeByte(33)
      ..write(obj.additionalText)
      ..writeByte(34)
      ..write(obj.additionalDescription)
      ..writeByte(35)
      ..write(obj.footnotes)
      ..writeByte(36)
      ..write(obj.rating)
      ..writeByte(37)
      ..write(obj.bankName)
      ..writeByte(38)
      ..write(obj.bankLogo)
      ..writeByte(39)
      ..write(obj.parentPostRelation)
      ..writeByte(40)
      ..write(obj.productType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvestmentResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
