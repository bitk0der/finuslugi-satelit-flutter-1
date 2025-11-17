import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'mortgage_response.g.dart';

@HiveType(typeId: 8)
class MortgageResponse extends Product {
  @override
  @HiveField(0)
  int id;

  @HiveField(1)
  DateTime date;

  @HiveField(2)
  DateTime dateGmt;

  @HiveField(3)
  DateTime modified;

  @HiveField(4)
  DateTime modifiedGmt;

  @HiveField(5)
  String slug;

  @HiveField(6)
  String status;

  @HiveField(7)
  String type;

  @override
  @HiveField(8)
  String cardName;

  @HiveField(9)
  String featuredMedia;

  @HiveField(10)
  String template;

  @HiveField(11)
  String? jfLimitResponses;

  @HiveField(12)
  String offerUrl;

  @HiveField(13)
  String inHorizontalTop;

  @HiveField(14)
  String isArchive;

  @HiveField(15)
  String offerEpc;

  @HiveField(16)
  String initialAmountMin;

  @HiveField(17)
  String initialAmountMax;

  @HiveField(18)
  String sumFrom;

  @HiveField(19)
  String sumTo;

  @HiveField(20)
  String ratePskFrom;

  @HiveField(21)
  String ratePskTo;

  @HiveField(22)
  String termFrom;

  @HiveField(23)
  String termTo;

  @HiveField(24)
  String unitFrom;

  @HiveField(25)
  String unitTo;

  @HiveField(26)
  List<String> creditPurposes;

  @HiveField(27)
  List<String> programs;

  @HiveField(28)
  String additionalConditions;

  @HiveField(29)
  String rating;

  @override
  @HiveField(30)
  String bankName;

  @HiveField(31)
  String bankLogo;

  @HiveField(32)
  String parentPostRelation;

  @override
  @HiveField(33)
  BankingCategory productType;

  @HiveField(34)
  String loanAge;

  @HiveField(35)
  String experienceRecent;

  @HiveField(36)
  String customerType;

  @HiveField(37)
  List<String> documentsRequired;

  @HiveField(38)
  List<String> security;

  @HiveField(39)
  List<String> demands;

  @HiveField(40)
  List<String> insurance;

  MortgageResponse(
      {required this.id,
      required this.date,
      required this.dateGmt,
      required this.modified,
      required this.modifiedGmt,
      required this.slug,
      required this.status,
      required this.type,
      required this.cardName,
      required this.featuredMedia,
      required this.template,
      this.jfLimitResponses,
      required this.offerUrl,
      required this.inHorizontalTop,
      required this.isArchive,
      required this.offerEpc,
      required this.initialAmountMin,
      required this.initialAmountMax,
      required this.sumFrom,
      required this.sumTo,
      required this.ratePskFrom,
      required this.ratePskTo,
      required this.termFrom,
      required this.termTo,
      required this.unitFrom,
      required this.unitTo,
      required this.creditPurposes,
      required this.programs,
      required this.additionalConditions,
      required this.rating,
      required this.bankLogo,
      required this.parentPostRelation,
      required this.bankName,
      required this.productType,
      required this.insurance,
      required this.demands,
      required this.documentsRequired,
      required this.experienceRecent,
      required this.loanAge,
      required this.security,
      required this.customerType});

  // Преобразование объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'sumFrom': sumFrom, // Минимальная сумма кредита
      'sumTo': sumTo, // Максимальная сумма кредита
      'ratePskFrom': ratePskFrom, // Процентная ставка (от)
      'ratePskTo': ratePskTo, // Процентная ставка (до)
      'initialAmountMin': initialAmountMin, // Первоначальный взнос
      'loanAge': loanAge, // Минимальный возраст заемщика
      'experienceRecent': experienceRecent, // Стаж на последнем месте работы
      'creditPurposes': creditPurposes
          .join(', '), // Цель кредита (например, Загородный дом/участок)
      'programs': programs.join(
          ', '), // Доступные программы (например, Господдержка семей с детьми, Материнский капитал)
      'customerType': customerType, // Тип заемщика (например, Паспорт)
      'demands': demands.join(
          ', '), // Требования к заемщику (например, Паспорт, заверенная копия трудовой книжки, СНИЛС, ИНН)
      'security': security.join(', '), // Обеспечение (например, propertyEstate)
      'documentsRequired': documentsRequired.join(
          ', '), // Обязательные документы для подачи заявки (например, Паспорт, СНИЛС, свидетельства о рождении детей)
      'additionalConditions':
          additionalConditions, // Дополнительные условия (например, оформление заявки по двум документам)
    };
  }

  // Создание объекта из JSON
  factory MortgageResponse.fromJson(Map<String, dynamic> json) {
    return MortgageResponse(
      id: json['id'],
      productType: BankingCategory.mortgages,
      date: DateTime.parse(json['date']),
      dateGmt: DateTime.parse(json['date_gmt']),
      modified: DateTime.parse(json['modified']),
      modifiedGmt: DateTime.parse(json['modified_gmt']),
      slug: json['slug'],
      status: json['status'],
      type: json['type'],
      cardName: json['title']['rendered'],
      featuredMedia: json['featured_media'].toString(),
      template: json['template'],
      jfLimitResponses: json['meta']['_jf_limit_responses'],
      offerUrl: json['meta']['offerurl'],
      inHorizontalTop: json['meta']['inhorizontaltop'],
      isArchive: json['meta']['isarchive'],
      offerEpc: json['meta']['offerepc'],
      initialAmountMin: json['meta']['initialamountmin'],
      initialAmountMax: json['meta']['initialamountmax'],
      sumFrom: json['meta']['sumfrom'],
      sumTo: json['meta']['sumto'],
      ratePskFrom: json['meta']['ratepskfrom'],
      ratePskTo: json['meta']['ratepskto'],
      termFrom: json['meta']['termfrom'],
      termTo: json['meta']['termto'],
      unitFrom: json['meta']['unitfrom'],
      unitTo: json['meta']['unitto'],
      creditPurposes: List<String>.from(json['meta']['creditpurposes']),
      programs: List<String>.from(json['meta']['programs']),
      additionalConditions: json['meta']['additionalconditions'],
      rating: json['meta']['rating'],
      bankLogo: json['bankinfo']['logo'],
      parentPostRelation: json['parent_post_relation'].toString(),
      bankName: json['parent_post_title'],
      security: List<String>.from(json['meta']['security']),
      documentsRequired: List<String>.from(json['meta']['documentsrequired']),
      demands: List<String>.from(json['meta']['demands']),
      insurance: List<String>.from(json['meta']['insurance']),
      customerType: json['meta']['customertype'],
      loanAge: json['meta']['loanage'],
      experienceRecent: json['meta']['experiencerecent'],
    );
  }
}
