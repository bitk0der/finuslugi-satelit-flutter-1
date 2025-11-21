import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'loan_main_model.g.dart'; // для генерации hive adapters

@HiveType(typeId: 11)
class LoanMainModel extends Product {
  @HiveField(0)
  @override
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final Meta meta;

  @HiveField(4)
  final AdditionalInfo additionalInfo;

  LoanMainModel({
    required this.id,
    required this.title,
    required this.meta,
    required this.description,
    required this.additionalInfo,
  });

  factory LoanMainModel.fromJson(Map<String, dynamic> json) {
    return LoanMainModel(
      id: json['id']?.toString() ?? '0',
      title: json['title']?['rendered'] ?? '',
      description: json['content']?['rendered'] ?? '',
      meta: Meta.fromJson(json['meta'] ?? {}),
      additionalInfo: AdditionalInfo.fromJson(json['additionalinfo'] ?? {}),
    );
  }

  @override
  String get bankName => meta.nameFull;

  @override
  String get cardName => title;

  @override
  BankingCategory get productType => BankingCategory.loans;
}

@HiveType(typeId: 12)
class Meta {
  @HiveField(0)
  final String offerUrl;
  @HiveField(1)
  final bool inHorizontalTop;
  @HiveField(2)
  final String offerEpc;
  @HiveField(3)
  final String namePrepositional;
  @HiveField(4)
  final String nameGenitive;
  @HiveField(5)
  final String nameFull;
  @HiveField(6)
  final DateTime registerDate;
  @HiveField(7)
  final int registerDateTs;
  @HiveField(8)
  final String license;
  @HiveField(9)
  final String cbrfUrl;
  @HiveField(10)
  final String website;
  @HiveField(11)
  final String phoneMain;
  @HiveField(12)
  final String emailMain;
  @HiveField(13)
  final String addressMain;
  @HiveField(14)
  final String ogrn;
  @HiveField(15)
  final String inn;
  @HiveField(16)
  final String kpp;
  @HiveField(17)
  final String bik;
  @HiveField(18)
  final String okpo;
  @HiveField(19)
  final String swift;
  @HiveField(20)
  final String personalAccountName;
  @HiveField(21)
  final String personalAccountSite;
  @HiveField(22)
  final String logoRound;
  @HiveField(23)
  final String logoSquare;
  @HiveField(24)
  final int sumFrom;
  @HiveField(25)
  final int sumTo;
  @HiveField(26)
  final int considerationTimeMin;
  @HiveField(27)
  final String considerationTimeMinUnit;
  @HiveField(28)
  final String considerationTimeMax;
  @HiveField(29)
  final String considerationTimeMaxUnit;
  @HiveField(30)
  final int termFrom;
  @HiveField(31)
  final String termFromUnit;
  @HiveField(32)
  final int termTo;
  @HiveField(33)
  final String termToUnit;
  @HiveField(34)
  final int rateFrom;
  @HiveField(35)
  final int rateTo;
  @HiveField(36)
  final String approvalProbability;
  @HiveField(37)
  final String footnotes;
  @HiveField(38)
  final double rating;

  Meta({
    required this.offerUrl,
    required this.inHorizontalTop,
    required this.offerEpc,
    required this.namePrepositional,
    required this.nameGenitive,
    required this.nameFull,
    required this.registerDate,
    required this.registerDateTs,
    required this.license,
    required this.cbrfUrl,
    required this.website,
    required this.phoneMain,
    required this.emailMain,
    required this.addressMain,
    required this.ogrn,
    required this.inn,
    required this.kpp,
    required this.bik,
    required this.okpo,
    required this.swift,
    required this.personalAccountName,
    required this.personalAccountSite,
    required this.logoRound,
    required this.logoSquare,
    required this.sumFrom,
    required this.sumTo,
    required this.considerationTimeMin,
    required this.considerationTimeMinUnit,
    required this.considerationTimeMax,
    required this.considerationTimeMaxUnit,
    required this.termFrom,
    required this.termFromUnit,
    required this.termTo,
    required this.termToUnit,
    required this.rateFrom,
    required this.rateTo,
    required this.approvalProbability,
    required this.footnotes,
    required this.rating,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      offerUrl: json['offerurl'] ?? '',
      inHorizontalTop: json['inhorizontaltop'] == 'true',
      offerEpc: json['offerepc'] ?? '',
      namePrepositional: json['nameprepositional'] ?? '',
      nameGenitive: json['namegenitive'] ?? '',
      nameFull: json['namefull'] ?? '',
      registerDate:
          DateTime.tryParse(json['registerdate'] ?? '') ?? DateTime.now(),
      registerDateTs: json['registerdatets'] ?? 0,
      license: json['license'] ?? '',
      cbrfUrl: json['cbrfurl'] ?? '',
      website: json['website'] ?? '',
      phoneMain: json['phonemain'] ?? '',
      emailMain: json['emailmain'] ?? '',
      addressMain: json['addressmain'] ?? '',
      ogrn: json['ogrn'] ?? '',
      inn: json['inn'] ?? '',
      kpp: json['kpp'] ?? '',
      bik: json['bik'] ?? '',
      okpo: json['okpo'] ?? '',
      swift: json['swift'] ?? '',
      personalAccountName: json['personalaccountname'] ?? '',
      personalAccountSite: json['personalaccountsite'] ?? '',
      logoRound: json['logoround'] ?? '',
      logoSquare: json['logosquare'] ?? '',
      sumFrom: int.tryParse(json['sumfrom'] ?? '0') ?? 0,
      sumTo: int.tryParse(json['sumto'] ?? '0') ?? 0,
      considerationTimeMin:
          int.tryParse(json['considerationtimemin'] ?? '0') ?? 0,
      considerationTimeMinUnit: json['considerationtimeminunit'] ?? '',
      considerationTimeMax: json['considerationtimemax'] ?? '',
      considerationTimeMaxUnit: json['considerationtimemaxunit'] ?? '',
      termFrom: int.tryParse(json['termfrom'] ?? '0') ?? 0,
      termFromUnit: json['termfromunit'] ?? '',
      termTo: int.tryParse(json['termto'] ?? '0') ?? 0,
      termToUnit: json['termtounit'] ?? '',
      rateFrom: int.tryParse(json['ratefrom'] ?? '0') ?? 0,
      rateTo: int.tryParse(json['rateto'] ?? '0') ?? 0,
      approvalProbability: json['approvalprobability'] ?? '',
      footnotes: json['footnotes'] ?? '',
      rating: double.tryParse(json['rating']?.toString() ?? '0') ?? 0,
    );
  }
}

@HiveType(typeId: 13)
class Phone {
  @HiveField(0)
  final String phone;

  Phone({required this.phone});

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(phone: json['phone'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'phone': phone};
  }
}

@HiveType(typeId: 14)
class Email {
  @HiveField(0)
  final String email;

  Email({required this.email});

  factory Email.fromJson(Map<String, dynamic> json) {
    return Email(email: json['email'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}

@HiveType(typeId: 15)
class App {
  @HiveField(0)
  final String appType;

  @HiveField(1)
  final String appLink;

  App({required this.appType, required this.appLink});

  factory App.fromJson(Map<String, dynamic> json) {
    return App(
      appType: json['apptype'] ?? '',
      appLink: json['applink'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apptype': appType,
      'applink': appLink,
    };
  }
}

@HiveType(typeId: 16)
class AdditionalInfo {
  @HiveField(0)
  final List<FAQ> lichniyKabinet;

  @HiveField(1)
  final List<FAQ> goriachayaLiniya;

  @HiveField(2)
  final List<FAQ> prosrochka;

  @HiveField(3)
  final List<FAQ> prodlenie;

  AdditionalInfo({
    required this.lichniyKabinet,
    required this.goriachayaLiniya,
    required this.prosrochka,
    required this.prodlenie,
  });

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) {
    return AdditionalInfo(
      lichniyKabinet: (json['lichniy-kabinet'] as List?)
              ?.map((item) => FAQ.fromJson(item))
              .toList() ??
          [],
      goriachayaLiniya: (json['goriachaya-liniya'] as List?)
              ?.map((item) => FAQ.fromJson(item))
              .toList() ??
          [],
      prosrochka: (json['prosrochka'] as List?)
              ?.map((item) => FAQ.fromJson(item))
              .toList() ??
          [],
      prodlenie: (json['prodlenie'] as List?)
              ?.map((item) => FAQ.fromJson(item))
              .toList() ??
          [],
    );
  }
}

@HiveType(typeId: 17)
class FAQ {
  @HiveField(0)
  final String question;

  @HiveField(1)
  final String answer;

  FAQ({
    required this.question,
    required this.answer,
  });

  factory FAQ.fromJson(Map<String, dynamic> json) {
    return FAQ(
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
    };
  }
}
