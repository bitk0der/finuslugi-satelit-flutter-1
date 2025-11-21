// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParamsModelAdapter extends TypeAdapter<ParamsModel> {
  @override
  final typeId = 28;

  @override
  ParamsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParamsModel(
      advantages: (fields[0] as List).cast<dynamic>(),
      comisMore: (fields[1] as Map).cast<String, dynamic>(),
      created: fields[2] as String,
      dateFrom: fields[3] as String,
      dateTo: fields[4] as String,
      debtorTypes: (fields[5] as Map).cast<String, dynamic>(),
      dictDateEnd: (fields[6] as List).cast<String>(),
      dictDateFrom: (fields[7] as List).cast<String>(),
      dictDocApartment: (fields[8] as List).cast<dynamic>(),
      dictDocApartmentWys: fields[9] as dynamic,
      dictPaymentType: (fields[10] as List).cast<String>(),
      dictPurposes: (fields[11] as List).cast<String>(),
      endTime: (fields[12] as num).toInt(),
      hasBannedDetails: fields[13] as dynamic,
      hasOwnPage: fields[14] as dynamic,
      initialAmounts: (fields[15] as Map).cast<String, dynamic>(),
      insSec: (fields[16] as Map).cast<String, dynamic>(),
      insSecComment: fields[17] as dynamic,
      insurance: (fields[18] as List).cast<String>(),
      link: fields[19] as String,
      location: (fields[20] as List).cast<String>(),
      maxTime: fields[21] as dynamic,
      minTime: (fields[22] as num).toInt(),
      moreConditions: fields[23] as String,
      productDescription: fields[24] as String,
      productFine: fields[25] as dynamic,
      programs: (fields[26] as Map).cast<String, dynamic>(),
      purposes: (fields[27] as Map).cast<String, dynamic>(),
      rates: (fields[28] as Map).cast<String, dynamic>(),
      security: (fields[29] as List).cast<String>(),
      securityComment: fields[30] as dynamic,
      solvencyProof: (fields[31] as List).cast<String>(),
      status: fields[32] as String,
      subProducts: (fields[33] as Map).cast<String, dynamic>(),
      sums: (fields[34] as Map).cast<String, dynamic>(),
      tariffDateFrom: fields[35] as String,
      tariffDateTo: fields[36] as String,
      terms: (fields[37] as Map).cast<String, dynamic>(),
      updated: fields[38] as String,
      userId: fields[39] as String,
      examined: fields[40] as String,
      psk: (fields[41] as Map).cast<String, dynamic>(),
      hasAPIIntegrationEsia: fields[42] as dynamic,
      hasAPIIntegrationLidgen: fields[43] as dynamic,
      isTransitionAllowed: fields[44] as bool,
      calcMinTerm: (fields[45] as num).toDouble(),
      calcMaxTerm: (fields[46] as num).toDouble(),
      minRate: (fields[47] as num).toDouble(),
      maxRate: (fields[48] as num).toDouble(),
      minSum: (fields[49] as num).toInt(),
      maxSum: (fields[50] as num).toInt(),
      minTerm: (fields[51] as num).toDouble(),
      maxTerm: (fields[52] as num).toDouble(),
      minInitialAmount: (fields[53] as num).toDouble(),
      maxInitialAmount: fields[54] as dynamic,
      rateComment: fields[55] as dynamic,
      debtorType: fields[56] as String,
      debtorAge: (fields[57] as num).toInt(),
      endPaymentMaleDebtorAge: (fields[58] as num).toInt(),
      endPaymentFemaleDebtorAge: (fields[59] as num).toInt(),
      docRequirements: (fields[60] as List).cast<String>(),
      debtorIncome: fields[61] as dynamic,
      lastExperience: fields[62] as dynamic,
      allExperience: fields[63] as dynamic,
      docApplicationOptional: (fields[64] as List).cast<String>(),
      docApplication: (fields[65] as List).cast<String>(),
      docApplicationInfo: fields[66] as String,
      debtPrograms: (fields[67] as List).cast<String>(),
      minPsk: (fields[68] as num).toDouble(),
      maxPsk: (fields[69] as num).toDouble(),
      dictPurpose: fields[70] as String,
      calcMinRate: (fields[71] as num).toDouble(),
      calcMaxRate: (fields[72] as num).toDouble(),
      calcMinSum: (fields[73] as num).toInt(),
      calcMaxSum: (fields[74] as num).toInt(),
      topOffersPayment: (fields[75] as num).toDouble(),
      topOffersOverPayment: (fields[76] as num).toDouble(),
      payment: fields[77] as dynamic,
      paymentRefin: fields[78] as dynamic,
      overPayment: fields[79] as dynamic,
      remainingDebtPercent: fields[80] as dynamic,
      sumCredit: (fields[81] as num).toInt(),
      initialAmountInput: fields[82] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, ParamsModel obj) {
    writer
      ..writeByte(83)
      ..writeByte(0)
      ..write(obj.advantages)
      ..writeByte(1)
      ..write(obj.comisMore)
      ..writeByte(2)
      ..write(obj.created)
      ..writeByte(3)
      ..write(obj.dateFrom)
      ..writeByte(4)
      ..write(obj.dateTo)
      ..writeByte(5)
      ..write(obj.debtorTypes)
      ..writeByte(6)
      ..write(obj.dictDateEnd)
      ..writeByte(7)
      ..write(obj.dictDateFrom)
      ..writeByte(8)
      ..write(obj.dictDocApartment)
      ..writeByte(9)
      ..write(obj.dictDocApartmentWys)
      ..writeByte(10)
      ..write(obj.dictPaymentType)
      ..writeByte(11)
      ..write(obj.dictPurposes)
      ..writeByte(12)
      ..write(obj.endTime)
      ..writeByte(13)
      ..write(obj.hasBannedDetails)
      ..writeByte(14)
      ..write(obj.hasOwnPage)
      ..writeByte(15)
      ..write(obj.initialAmounts)
      ..writeByte(16)
      ..write(obj.insSec)
      ..writeByte(17)
      ..write(obj.insSecComment)
      ..writeByte(18)
      ..write(obj.insurance)
      ..writeByte(19)
      ..write(obj.link)
      ..writeByte(20)
      ..write(obj.location)
      ..writeByte(21)
      ..write(obj.maxTime)
      ..writeByte(22)
      ..write(obj.minTime)
      ..writeByte(23)
      ..write(obj.moreConditions)
      ..writeByte(24)
      ..write(obj.productDescription)
      ..writeByte(25)
      ..write(obj.productFine)
      ..writeByte(26)
      ..write(obj.programs)
      ..writeByte(27)
      ..write(obj.purposes)
      ..writeByte(28)
      ..write(obj.rates)
      ..writeByte(29)
      ..write(obj.security)
      ..writeByte(30)
      ..write(obj.securityComment)
      ..writeByte(31)
      ..write(obj.solvencyProof)
      ..writeByte(32)
      ..write(obj.status)
      ..writeByte(33)
      ..write(obj.subProducts)
      ..writeByte(34)
      ..write(obj.sums)
      ..writeByte(35)
      ..write(obj.tariffDateFrom)
      ..writeByte(36)
      ..write(obj.tariffDateTo)
      ..writeByte(37)
      ..write(obj.terms)
      ..writeByte(38)
      ..write(obj.updated)
      ..writeByte(39)
      ..write(obj.userId)
      ..writeByte(40)
      ..write(obj.examined)
      ..writeByte(41)
      ..write(obj.psk)
      ..writeByte(42)
      ..write(obj.hasAPIIntegrationEsia)
      ..writeByte(43)
      ..write(obj.hasAPIIntegrationLidgen)
      ..writeByte(44)
      ..write(obj.isTransitionAllowed)
      ..writeByte(45)
      ..write(obj.calcMinTerm)
      ..writeByte(46)
      ..write(obj.calcMaxTerm)
      ..writeByte(47)
      ..write(obj.minRate)
      ..writeByte(48)
      ..write(obj.maxRate)
      ..writeByte(49)
      ..write(obj.minSum)
      ..writeByte(50)
      ..write(obj.maxSum)
      ..writeByte(51)
      ..write(obj.minTerm)
      ..writeByte(52)
      ..write(obj.maxTerm)
      ..writeByte(53)
      ..write(obj.minInitialAmount)
      ..writeByte(54)
      ..write(obj.maxInitialAmount)
      ..writeByte(55)
      ..write(obj.rateComment)
      ..writeByte(56)
      ..write(obj.debtorType)
      ..writeByte(57)
      ..write(obj.debtorAge)
      ..writeByte(58)
      ..write(obj.endPaymentMaleDebtorAge)
      ..writeByte(59)
      ..write(obj.endPaymentFemaleDebtorAge)
      ..writeByte(60)
      ..write(obj.docRequirements)
      ..writeByte(61)
      ..write(obj.debtorIncome)
      ..writeByte(62)
      ..write(obj.lastExperience)
      ..writeByte(63)
      ..write(obj.allExperience)
      ..writeByte(64)
      ..write(obj.docApplicationOptional)
      ..writeByte(65)
      ..write(obj.docApplication)
      ..writeByte(66)
      ..write(obj.docApplicationInfo)
      ..writeByte(67)
      ..write(obj.debtPrograms)
      ..writeByte(68)
      ..write(obj.minPsk)
      ..writeByte(69)
      ..write(obj.maxPsk)
      ..writeByte(70)
      ..write(obj.dictPurpose)
      ..writeByte(71)
      ..write(obj.calcMinRate)
      ..writeByte(72)
      ..write(obj.calcMaxRate)
      ..writeByte(73)
      ..write(obj.calcMinSum)
      ..writeByte(74)
      ..write(obj.calcMaxSum)
      ..writeByte(75)
      ..write(obj.topOffersPayment)
      ..writeByte(76)
      ..write(obj.topOffersOverPayment)
      ..writeByte(77)
      ..write(obj.payment)
      ..writeByte(78)
      ..write(obj.paymentRefin)
      ..writeByte(79)
      ..write(obj.overPayment)
      ..writeByte(80)
      ..write(obj.remainingDebtPercent)
      ..writeByte(81)
      ..write(obj.sumCredit)
      ..writeByte(82)
      ..write(obj.initialAmountInput);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParamsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
