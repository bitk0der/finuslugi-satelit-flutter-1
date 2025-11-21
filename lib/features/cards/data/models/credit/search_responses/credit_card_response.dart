import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'credit_card_response.g.dart';

@HiveType(typeId: 1)
class CreditCardResponse extends Product {
  @override
  @HiveField(0)
  final String id;

  @override
  @HiveField(1)
  final BankingCategory productType;

  @HiveField(2)
  final int minCreditSum;

  @HiveField(3)
  final int maxCreditSum;

  @HiveField(4)
  final int interestFreePeriod;

  @HiveField(5)
  final String minPayment;

  @HiveField(6)
  final int installmentMonths;

  @HiveField(7)
  final String paymentSystem;

  @HiveField(8)
  final List<String> smartphonePayments;

  @HiveField(9)
  final int firstYearServiceCost;

  @HiveField(10)
  final int secondYearServiceCost;

  @HiveField(11)
  final String cardClass;

  @HiveField(12)
  final List<String> features;

  @HiveField(13)
  final List<String> advantages;

  @HiveField(14)
  final double cashWithdrawalFee;

  @HiveField(15)
  final List<String> withdrawalLocations;

  @HiveField(16)
  final List<String> partnerBanks;

  @HiveField(17)
  final int minAge;

  @HiveField(18)
  final int workExperience;

  @HiveField(19)
  final List<String> incomeDocuments;

  @HiveField(20)
  final List<String> requiredDocuments;

  @HiveField(21)
  final List<String> clientRequirements;

  @HiveField(22)
  final String bonusType;

  @HiveField(23)
  final String maxCashback;

  @HiveField(24)
  final List<String> cashbackCategories;

  @HiveField(25)
  final String cashbackDescription;

  @override
  @HiveField(26)
  final String bankName;

  @override
  @HiveField(27)
  final String cardName;

  @HiveField(28)
  final String bankLogoUrl;

  @HiveField(29)
  final String additionalImageUrl;

  @HiveField(30)
  final String parentPostTitle;

  @HiveField(31)
  final String yoastTitle;

  @HiveField(32)
  final int parentPostRelation;

  @HiveField(33)
  final String offerUrl;

  CreditCardResponse(
      {required this.id,
      required this.productType,
      required this.minCreditSum,
      required this.maxCreditSum,
      required this.interestFreePeriod,
      required this.minPayment,
      required this.installmentMonths,
      required this.paymentSystem,
      required this.smartphonePayments,
      required this.firstYearServiceCost,
      required this.secondYearServiceCost,
      required this.cardClass,
      required this.features,
      required this.advantages,
      required this.cashWithdrawalFee,
      required this.withdrawalLocations,
      required this.partnerBanks,
      required this.minAge,
      required this.workExperience,
      required this.incomeDocuments,
      required this.requiredDocuments,
      required this.clientRequirements,
      required this.bonusType,
      required this.maxCashback,
      required this.cashbackCategories,
      required this.cashbackDescription,
      required this.bankName,
      required this.cardName,
      required this.bankLogoUrl,
      required this.additionalImageUrl,
      required this.parentPostTitle,
      required this.yoastTitle,
      required this.offerUrl,
      required this.parentPostRelation});

  factory CreditCardResponse.fromJson(Map<String, dynamic> json) {
    // Извлечение вложенного объекта `meta` и `bankinfo`
    final meta = json['meta'] as Map<String, dynamic>? ?? {};
    final bankInfo = json['bankinfo'] as Map<String, dynamic>? ?? {};

    return CreditCardResponse(
      id: json['id']?.toString() ?? '0',
      productType: BankingCategory.creditCards,
      parentPostRelation:
          int.tryParse(json['parent_post_relation']?.toString() ?? '0') ?? 0,
      minCreditSum: int.tryParse(meta['sumfrom']?.toString() ?? '0') ?? 0,
      maxCreditSum: int.tryParse(meta['sumto']?.toString() ?? '0') ?? 0,
      interestFreePeriod:
          int.tryParse(meta['interestfreeperiodpurchase']?.toString() ?? '0') ??
              0,
      minPayment: meta['minpaymentpercent'] != null
          ? 'до ${meta['minpaymentpercent']}%, но не менее ${meta['minpaymentmoney']} руб.'
          : 'Не указано',
      installmentMonths:
          int.tryParse(meta['installmentperiod']?.toString() ?? '0') ?? 0,
      paymentSystem:
          (meta['paymentsystem'] as List<dynamic>?)?.first ?? 'Не указано',
      smartphonePayments: (meta['smartphone']?.toString() ?? '').split(', '),

      // Стоимость обслуживания из meta
      firstYearServiceCost:
          int.tryParse(meta['maintenanceprice']?.toString() ?? '0') ?? 0,
      secondYearServiceCost:
          int.tryParse(meta['maintenancepricess']?.toString() ?? '0') ?? 0,

      // Классы и особенности из meta
      cardClass:
          (meta['cardclass'] as List<dynamic>?)?.join(', ') ?? 'Не указано',
      features:
          meta['feature'] != null ? List<String>.from(meta['feature']) : [],
      advantages:
          meta['benefits'] != null ? List<String>.from(meta['benefits']) : [],

      // Снятие наличных из meta
      cashWithdrawalFee:
          double.tryParse(meta['withdrawratefrom']?.toString() ?? '0.0') ?? 0.0,
      withdrawalLocations: meta['withdrawplace'] != null
          ? List<String>.from(meta['withdrawplace'])
          : [],
      partnerBanks: meta['partnerBanks']?.split(', ') ?? [],

      // Требования из meta
      minAge: int.tryParse(meta['agefrom']?.toString() ?? '0') ?? 0,
      workExperience:
          int.tryParse(meta['experiencerecent']?.toString() ?? '0') ?? 0,
      incomeDocuments: meta['solvencyproof'] != null
          ? List<String>.from(meta['solvencyproof'])
          : [],
      requiredDocuments:
          meta['documents'] != null ? List<String>.from(meta['documents']) : [],
      clientRequirements:
          meta['demands'] != null ? List<String>.from(meta['demands']) : [],

      // Бонусная программа из meta
      bonusType: meta['bonusType'] ?? 'Не указано',
      maxCashback: meta['cashbackvalue'] ?? '0%',
      cashbackCategories: meta['cashbackcategories'] != null
          ? List<String>.from(meta['cashbackcategories'])
          : [],
      cashbackDescription: meta['cashbackdescription'] ?? 'Не указано',

      // Информация о банке и карте
      parentPostTitle: bankInfo['name'] ?? 'Не указано',
      bankLogoUrl: bankInfo['logo'] ?? '',
      additionalImageUrl: bankInfo['additional_image'] ?? '',
      bankName: json['parent_post_title']?.toString() ?? 'Не указано',
      yoastTitle: json['yoast_title']?.toString() ?? 'Не указано',

      // Новое поле
      offerUrl: json['meta']?['offerurl'] ?? 'Не указано',
      cardName: json['title']?['rendered'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      // Сортировка по creditCardsComparisonTitles
      'minCreditSum': minCreditSum, // Минимальная сумма кредита
      'maxCreditSum': maxCreditSum, // Максимальная сумма кредита
      'interestFreePeriod':
          interestFreePeriod, // Беспроцентный период на покупки
/*       'interestFreeWithdrawalPeriod':
          interestFreeWithdrawalPeriod, // Беспроцентный период на снятие наличных */
      'minPayment': minPayment, // Минимальный платеж
      'installmentMonths': installmentMonths, // Рассрочка
      'paymentSystem': paymentSystem, // Платежная система карты
      'smartphonePayments': smartphonePayments.join(','), // Оплата смартфоном
      'firstYearServiceCost':
          firstYearServiceCost, // Стоимость обслуживания в первый год
      'secondYearServiceCost':
          secondYearServiceCost, // Стоимость обслуживания со второго года
      'cardClass': cardClass, // Класс карты
      'features': features.join(','), // Особенности карты
      'advantages': advantages.join(','), // Преимущества
      'cashWithdrawalFee': cashWithdrawalFee, // Комиссия за снятие наличных
      'withdrawalLocations':
          withdrawalLocations.join(','), // Места снятия наличных
      /* 'additionalConditions': additionalConditions, // Дополнительные условия */
      'partnerBanks': partnerBanks.join(','), // Банки-партнеры

      // Оставшиеся поля
      'id': id,
      'productType': productType.toString(),
      'minAge': minAge,
      'workExperience': workExperience,
      'incomeDocuments': incomeDocuments,
      'requiredDocuments': requiredDocuments,
      'clientRequirements': clientRequirements,
      'bonusType': bonusType,
      'maxCashback': maxCashback,
      'cashbackCategories': cashbackCategories,
      'cashbackDescription': cashbackDescription,
      'bankName': bankName,
      'cardName': cardName,
      'bankLogoUrl': bankLogoUrl,
      'additionalImageUrl': additionalImageUrl,
      'parentPostTitle': parentPostTitle,
      'yoastTitle': yoastTitle,
      'offerUrl': offerUrl,
    };
  }
}
