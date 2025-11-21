// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_main_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoanMainModelAdapter extends TypeAdapter<LoanMainModel> {
  @override
  final typeId = 11;

  @override
  LoanMainModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoanMainModel(
      id: fields[0] as String,
      title: fields[1] as String,
      meta: fields[3] as Meta,
      description: fields[2] as String,
      additionalInfo: fields[4] as AdditionalInfo,
    );
  }

  @override
  void write(BinaryWriter writer, LoanMainModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.meta)
      ..writeByte(4)
      ..write(obj.additionalInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoanMainModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetaAdapter extends TypeAdapter<Meta> {
  @override
  final typeId = 12;

  @override
  Meta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meta(
      offerUrl: fields[0] as String,
      inHorizontalTop: fields[1] as bool,
      offerEpc: fields[2] as String,
      namePrepositional: fields[3] as String,
      nameGenitive: fields[4] as String,
      nameFull: fields[5] as String,
      registerDate: fields[6] as DateTime,
      registerDateTs: (fields[7] as num).toInt(),
      license: fields[8] as String,
      cbrfUrl: fields[9] as String,
      website: fields[10] as String,
      phoneMain: fields[11] as String,
      emailMain: fields[12] as String,
      addressMain: fields[13] as String,
      ogrn: fields[14] as String,
      inn: fields[15] as String,
      kpp: fields[16] as String,
      bik: fields[17] as String,
      okpo: fields[18] as String,
      swift: fields[19] as String,
      personalAccountName: fields[20] as String,
      personalAccountSite: fields[21] as String,
      logoRound: fields[22] as String,
      logoSquare: fields[23] as String,
      sumFrom: (fields[24] as num).toInt(),
      sumTo: (fields[25] as num).toInt(),
      considerationTimeMin: (fields[26] as num).toInt(),
      considerationTimeMinUnit: fields[27] as String,
      considerationTimeMax: fields[28] as String,
      considerationTimeMaxUnit: fields[29] as String,
      termFrom: (fields[30] as num).toInt(),
      termFromUnit: fields[31] as String,
      termTo: (fields[32] as num).toInt(),
      termToUnit: fields[33] as String,
      rateFrom: (fields[34] as num).toInt(),
      rateTo: (fields[35] as num).toInt(),
      approvalProbability: fields[36] as String,
      footnotes: fields[37] as String,
      rating: (fields[38] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Meta obj) {
    writer
      ..writeByte(39)
      ..writeByte(0)
      ..write(obj.offerUrl)
      ..writeByte(1)
      ..write(obj.inHorizontalTop)
      ..writeByte(2)
      ..write(obj.offerEpc)
      ..writeByte(3)
      ..write(obj.namePrepositional)
      ..writeByte(4)
      ..write(obj.nameGenitive)
      ..writeByte(5)
      ..write(obj.nameFull)
      ..writeByte(6)
      ..write(obj.registerDate)
      ..writeByte(7)
      ..write(obj.registerDateTs)
      ..writeByte(8)
      ..write(obj.license)
      ..writeByte(9)
      ..write(obj.cbrfUrl)
      ..writeByte(10)
      ..write(obj.website)
      ..writeByte(11)
      ..write(obj.phoneMain)
      ..writeByte(12)
      ..write(obj.emailMain)
      ..writeByte(13)
      ..write(obj.addressMain)
      ..writeByte(14)
      ..write(obj.ogrn)
      ..writeByte(15)
      ..write(obj.inn)
      ..writeByte(16)
      ..write(obj.kpp)
      ..writeByte(17)
      ..write(obj.bik)
      ..writeByte(18)
      ..write(obj.okpo)
      ..writeByte(19)
      ..write(obj.swift)
      ..writeByte(20)
      ..write(obj.personalAccountName)
      ..writeByte(21)
      ..write(obj.personalAccountSite)
      ..writeByte(22)
      ..write(obj.logoRound)
      ..writeByte(23)
      ..write(obj.logoSquare)
      ..writeByte(24)
      ..write(obj.sumFrom)
      ..writeByte(25)
      ..write(obj.sumTo)
      ..writeByte(26)
      ..write(obj.considerationTimeMin)
      ..writeByte(27)
      ..write(obj.considerationTimeMinUnit)
      ..writeByte(28)
      ..write(obj.considerationTimeMax)
      ..writeByte(29)
      ..write(obj.considerationTimeMaxUnit)
      ..writeByte(30)
      ..write(obj.termFrom)
      ..writeByte(31)
      ..write(obj.termFromUnit)
      ..writeByte(32)
      ..write(obj.termTo)
      ..writeByte(33)
      ..write(obj.termToUnit)
      ..writeByte(34)
      ..write(obj.rateFrom)
      ..writeByte(35)
      ..write(obj.rateTo)
      ..writeByte(36)
      ..write(obj.approvalProbability)
      ..writeByte(37)
      ..write(obj.footnotes)
      ..writeByte(38)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PhoneAdapter extends TypeAdapter<Phone> {
  @override
  final typeId = 13;

  @override
  Phone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Phone(
      phone: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Phone obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EmailAdapter extends TypeAdapter<Email> {
  @override
  final typeId = 14;

  @override
  Email read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Email(
      email: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Email obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AppAdapter extends TypeAdapter<App> {
  @override
  final typeId = 15;

  @override
  App read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return App(
      appType: fields[0] as String,
      appLink: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, App obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.appType)
      ..writeByte(1)
      ..write(obj.appLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AdditionalInfoAdapter extends TypeAdapter<AdditionalInfo> {
  @override
  final typeId = 16;

  @override
  AdditionalInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdditionalInfo(
      lichniyKabinet: (fields[0] as List).cast<FAQ>(),
      goriachayaLiniya: (fields[1] as List).cast<FAQ>(),
      prosrochka: (fields[2] as List).cast<FAQ>(),
      prodlenie: (fields[3] as List).cast<FAQ>(),
    );
  }

  @override
  void write(BinaryWriter writer, AdditionalInfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.lichniyKabinet)
      ..writeByte(1)
      ..write(obj.goriachayaLiniya)
      ..writeByte(2)
      ..write(obj.prosrochka)
      ..writeByte(3)
      ..write(obj.prodlenie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdditionalInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FAQAdapter extends TypeAdapter<FAQ> {
  @override
  final typeId = 17;

  @override
  FAQ read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FAQ(
      question: fields[0] as String,
      answer: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FAQ obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.question)
      ..writeByte(1)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FAQAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
