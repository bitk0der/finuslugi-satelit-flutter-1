import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';

import 'package:hive_ce_flutter/adapters.dart';

part 'credit_response.g.dart';

@HiveType(typeId: 2)
class CreditResponse extends Product {
  @HiveField(0)
  @override
  final BankingCategory productType;

  @HiveField(1)
  @override
  final int id;

  @override
  @HiveField(2)
  final String cardName;

  @HiveField(3)
  final String link;

  @override
  @HiveField(4)
  final String bankName;

  @HiveField(5)
  final String bankLogoUrl;

  @HiveField(6)
  final String fullImageUrl;

  @HiveField(7)
  final String offerUrl;

  @HiveField(8)
  final int sumFrom;

  @HiveField(9)
  final int sumTo;

  @HiveField(10)
  final double rateFrom;

  @HiveField(11)
  final double rateTo;

  @HiveField(12)
  final int termFrom;

  @HiveField(13)
  final int termTo;

  @HiveField(14)
  final String termUnit;

  @HiveField(15)
  final String applicationTime;

  @HiveField(16)
  final String applicationUnit;

  @HiveField(17)
  final int minAge;

  @HiveField(18)
  final String minIncome;

  @HiveField(19)
  final int workExperienceRecent;

  @HiveField(20)
  final int workExperienceTotal;

  @HiveField(21)
  final List<String> creditPurposes;

  @HiveField(22)
  final String customerType;

  @HiveField(23)
  final List<String> obtainingMethods;

  @HiveField(24)
  final List<String> demands;

  @HiveField(25)
  final List<String> paymentTypes;

  @HiveField(26)
  final List<String> paymentFrequencies;

  @HiveField(27)
  final List<String> security;

  @HiveField(28)
  final String guarantorFilter;

  @HiveField(29)
  final List<String> requiredDocuments;

  @HiveField(30)
  final List<String> optionalDocuments;

  @HiveField(31)
  final String additionalConditions;

  @HiveField(32)
  final int parentPostRelation;

  CreditResponse(
      {required this.productType,
      required this.id,
      required this.cardName,
      required this.offerUrl,
      required this.link,
      required this.bankName,
      required this.bankLogoUrl,
      required this.fullImageUrl,
      required this.sumFrom,
      required this.sumTo,
      required this.rateFrom,
      required this.rateTo,
      required this.termFrom,
      required this.termTo,
      required this.termUnit,
      required this.applicationTime,
      required this.applicationUnit,
      required this.minAge,
      required this.minIncome,
      required this.workExperienceRecent,
      required this.workExperienceTotal,
      required this.creditPurposes,
      required this.customerType,
      required this.obtainingMethods,
      required this.demands,
      required this.paymentTypes,
      required this.paymentFrequencies,
      required this.security,
      required this.guarantorFilter,
      required this.requiredDocuments,
      required this.optionalDocuments,
      required this.additionalConditions,
      required this.parentPostRelation});

  factory CreditResponse.fromJson(Map<String, dynamic> json) {
    final meta = json['meta'] as Map<String, dynamic>? ?? {};
    final bankInfo = json['bankinfo'] as Map<String, dynamic>? ?? {};

    return CreditResponse(
      productType: BankingCategory.credits,
      id: json['id'] as int,
      cardName: json['title']['rendered'] as String,
      link: (json['link'] ?? '') as String,
      offerUrl: meta['offerurl'],
      parentPostRelation:
          int.tryParse(json['parent_post_relation']?.toString() ?? '0') ?? 0,
      bankName: json['parent_post_title'] ?? 'Не указан',
      bankLogoUrl: bankInfo['logo'] ?? '',
      fullImageUrl: bankInfo['logo'] ?? '', // Используем logo как полный URL
      sumFrom: int.tryParse(meta['sumfrom']?.toString() ?? '0') ?? 0,
      sumTo: int.tryParse(meta['sumto']?.toString() ?? '0') ?? 0,
      rateFrom: double.tryParse(meta['ratepskfrom']?.toString() ?? '0') ?? 0,
      rateTo: double.tryParse(meta['ratepskto']?.toString() ?? '0') ?? 0,
      termFrom: int.tryParse(meta['termfrom']?.toString() ?? '0') ?? 0,
      termTo: int.tryParse(meta['termto']?.toString() ?? '0') ?? 0,
      termUnit: meta['unitto'] ?? 'месяцы',
      applicationTime: meta['timeapplicationto'] ?? '0',
      applicationUnit: meta['unitapplicationto'] ?? 'дни',
      minAge: int.tryParse(meta['loanage']?.toString() ?? '0') ?? 0,
      minIncome: meta['salary'] ?? 'Не указано',
      workExperienceRecent:
          int.tryParse(meta['experiencerecent']?.toString() ?? '0') ?? 0,
      workExperienceTotal:
          int.tryParse(meta['experienceall']?.toString() ?? '0') ?? 0,
      creditPurposes: (meta['creditpurposes'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      customerType: meta['customertype'] ?? 'Не указан',
      obtainingMethods: (meta['creditobtainingmethod'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      demands: (meta['demands'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      paymentTypes: (meta['payments'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      paymentFrequencies: (meta['paymentsfrequency'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      security: (meta['security'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      guarantorFilter: meta['guarantorfilter'] ?? 'Не указано',
      requiredDocuments: (meta['documentsrequired'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      optionalDocuments: (meta['documentsoptional'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      additionalConditions: meta['additionalconditions'] ?? 'Не указано',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'sumFrom': sumFrom, // Минимальная сумма кредита
      'sumTo': sumTo, // Максимальная сумма кредита
      'applicationTime': applicationTime, // Время рассмотрения заявки
      'minAge': minAge, // Минимальный возраст заемщика
      'minIncome': minIncome, // Минимальный доход
      'workExperienceRecent':
          workExperienceRecent, // Стаж на последнем месте работы
      'creditPurposes': creditPurposes.join(','), // Цель кредита
      'customerType': customerType, // Тип заемщика
      'obtainingMethods': obtainingMethods.join(','), // Способ получения
      'demands': demands.join(','), // Требования к заемщику
      'paymentTypes': paymentTypes.join(','), // Тип платежей
      'paymentFrequencies':
          paymentFrequencies.join(','), // Периодичность платежей
      'security': security.join(','), // Обеспечение
      'guarantorFilter': guarantorFilter, // Поручительство
      'requiredDocuments':
          requiredDocuments.join(','), // Обязательные документы
      'optionalDocuments':
          optionalDocuments.join(','), // Необязательные документы
      'additionalConditions': additionalConditions, // Дополнительные условия
      // Остальные поля
      'productType': productType.toString(),
      'id': id,
      'cardName': cardName,
      'link': link,
      'bankName': bankName,
      'bankLogoUrl': bankLogoUrl,
      'fullImageUrl': fullImageUrl,
      'offerUrl': offerUrl,
      'rateFrom': rateFrom,
      'rateTo': rateTo,
      'termFrom': termFrom,
      'termTo': termTo,
      'termUnit': termUnit,
      'applicationUnit': applicationUnit,
    };
  }
}
