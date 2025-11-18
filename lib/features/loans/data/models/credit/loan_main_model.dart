import 'package:fin_uslugi/features/loans/data/models/credit/search_responses/product.dart';

class LoanMainModel extends Product {
  @override
  final int id;
  final String title;
  final String description;
  final Meta meta;
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
      id: json['id'] ?? 0,
      title: json['title']?['rendered'] ?? '',
      description: json['content']?['rendered'] ?? '',
      meta: Meta.fromJson(json['meta'] ?? {}),
      additionalInfo: AdditionalInfo.fromJson(json['additionalinfo'] ?? {}),
    );
  }
}

class Meta {
  final String offerUrl;
  final bool inHorizontalTop;
  final String offerEpc;
  final String namePrepositional;
  final String nameGenitive;
  final String nameFull;
  final DateTime registerDate;
  final int registerDateTs;
  final String license;
  final String cbrfUrl;
  final String website;
  final String phoneMain;
  final String emailMain;
  final String addressMain;
  final String ogrn;
  final String inn;
  final String kpp;
  final String bik;
  final String okpo;
  final String swift;
  final String personalAccountName;
  final String personalAccountSite;
  final String logoRound;
  final String logoSquare;
  final int sumFrom;
  final int sumTo;
  final int considerationTimeMin;
  final String considerationTimeMinUnit;
  final String considerationTimeMax;
  final String considerationTimeMaxUnit;
  final int termFrom;
  final String termFromUnit;
  final int termTo;
  final String termToUnit;
  final int rateFrom;
  final int rateTo;
  final String approvalProbability;
  final String footnotes;
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

  Map<String, dynamic> toJson() {
    return {
      'offerurl': offerUrl,
      'inhorizontaltop': inHorizontalTop ? 'true' : 'false',
      'offerepc': offerEpc,
      'nameprepositional': namePrepositional,
      'namegenitive': nameGenitive,
      'namefull': nameFull,
      'registerdate': registerDate.toIso8601String(),
      'registerdatets': registerDateTs,
      'license': license,
      'cbrfurl': cbrfUrl,
      'website': website,
      'phonemain': phoneMain,
      'emailmain': emailMain,
      'addressmain': addressMain,
      'ogrn': ogrn,
      'inn': inn,
      'kpp': kpp,
      'bik': bik,
      'okpo': okpo,
      'swift': swift,
      'personalaccountname': personalAccountName,
      'personalaccountsite': personalAccountSite,
      'logoround': logoRound,
      'logosquare': logoSquare,
      'sumfrom': sumFrom,
      'sumto': sumTo,
      'considerationtimemin': considerationTimeMin,
      'considerationtimeminunit': considerationTimeMinUnit,
      'considerationtimemax': considerationTimeMax,
      'considerationtimemaxunit': considerationTimeMaxUnit,
      'termfrom': termFrom,
      'termfromunit': termFromUnit,
      'termto': termTo,
      'termtounit': termToUnit,
      'ratefrom': rateFrom,
      'rateto': rateTo,
      'approvalprobability': approvalProbability,
      'footnotes': footnotes,
      'rating': rating,
    };
  }
}

class Phone {
  final String phone;

  Phone({required this.phone});

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(phone: json['phone'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'phone': phone};
  }
}

class Email {
  final String email;

  Email({required this.email});

  factory Email.fromJson(Map<String, dynamic> json) {
    return Email(email: json['email'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}

class App {
  final String appType;
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

class AdditionalInfo {
  final List<FAQ> lichniyKabinet;
  final List<FAQ> goriachayaLiniya;
  final List<FAQ> prosrochka;
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

class FAQ {
  final String question;
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
