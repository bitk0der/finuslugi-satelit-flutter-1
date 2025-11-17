import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'debit_card_response.g.dart';

@HiveType(typeId: 4) // Убедитесь, что typeId уникален для каждой модели
class DebitCardResponse extends Product {
  @override
  @HiveField(0)
  final BankingCategory productType;
  @override
  @HiveField(1)
  final int id;

  @override
  @HiveField(2)
  final String cardName;

  @HiveField(3)
  final String status;

  @HiveField(4)
  final String type;

  @HiveField(5)
  final String link;

  @HiveField(6)
  final String offerUrl;

  @HiveField(7)
  final String fullImageUrl;

  @HiveField(8)
  final String bankLogoUrl;

  @override
  @HiveField(9)
  final String bankName;

  @HiveField(10)
  final String cardClass;

  @HiveField(11)
  final String balanceincomerate;

  @HiveField(12)
  final int maintenancePriceFirstYear;

  @HiveField(13)
  final int maintenancePriceSecondYear;

  @HiveField(14)
  final double cashbackValue;

  @HiveField(15)
  final double cashbackValueMax;

  @HiveField(16)
  final String cashbackDescription;

  @HiveField(17)
  final String incomeDescription;

  @HiveField(18)
  final String ageFrom;

  @HiveField(19)
  final List<String> paymentSystems;

  @HiveField(20)
  final List<String> smartphonePayments;

  @HiveField(21)
  final String operationLimit;

  @HiveField(22)
  final String withdrawalComment;

  @HiveField(23)
  final List<String> cardFeatures;

  @HiveField(24)
  final List<String> benefits;

  @HiveField(25)
  final List<String> withdrawalLocations;

  @HiveField(26)
  final List<String> documents;

  @HiveField(27)
  final List<String> cashbackCategories;

  @HiveField(28)
  final int parentPostRelation;

  DebitCardResponse({
    required this.id,
    required this.productType,
    required this.cardName,
    required this.status,
    required this.type,
    required this.link,
    required this.offerUrl,
    required this.fullImageUrl,
    required this.bankLogoUrl,
    required this.bankName,
    required this.cardClass,
    required this.maintenancePriceFirstYear,
    required this.maintenancePriceSecondYear,
    required this.cashbackValue,
    required this.cashbackValueMax,
    required this.cashbackDescription,
    required this.incomeDescription,
    required this.paymentSystems,
    required this.smartphonePayments,
    required this.operationLimit,
    required this.withdrawalComment,
    required this.cardFeatures,
    required this.benefits,
    required this.withdrawalLocations,
    required this.balanceincomerate,
    required this.ageFrom,
    required this.documents,
    required this.cashbackCategories,
    required this.parentPostRelation,
  });

  factory DebitCardResponse.fromJson(Map<String, dynamic> json) {
    final meta = json['meta'] as Map<String, dynamic>;
    final bankInfo = json['bankinfo'] as Map<String, dynamic>?;

    return DebitCardResponse(
      id: json['id'] as int,
      productType: BankingCategory.debitCards,
      parentPostRelation:
          int.tryParse(json['parent_post_relation']?.toString() ?? '0') ?? 0,
      cardName: json['title']['rendered'] as String,
      offerUrl: meta['offerurl'],
      status: json['status'] as String,
      type: json['type'] as String,
      link: (json['link'] ?? '') as String,
      fullImageUrl: bankInfo?['additional_image'] ?? '',
      bankLogoUrl: bankInfo?['logo'] ?? '',
      ageFrom: meta['agefrom'] ?? '',
      balanceincomerate: meta['balanceincomerate'] ?? '',
      bankName: json['parent_post_title'] ?? 'Не указан',
      cardClass:
          (meta['cardclass'] as List<dynamic>?)?.join(', ') ?? 'Не указано',
      maintenancePriceFirstYear:
          int.tryParse(meta['maintenanceprice']?.toString() ?? '0') ?? 0,
      maintenancePriceSecondYear:
          int.tryParse(meta['maintenancepricess']?.toString() ?? '0') ?? 0,
      cashbackValue:
          double.tryParse(meta['cashbackvalue']?.toString() ?? '0.0') ?? 0.0,
      cashbackValueMax:
          double.tryParse(meta['cashbackvaluemax']?.toString() ?? '0.0') ?? 0.0,
      cashbackDescription: meta['cashbackdescription'] ?? 'Не указано',
      incomeDescription: meta['incomedescription'] ?? 'Не указано',
      paymentSystems: (meta['paymentsystem'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      smartphonePayments: (meta['smartphone']?.toString() ?? '')
          .split(', ')
          .map((e) => e.trim())
          .toList(),
      operationLimit:
          '${meta['withdrawratefrom'] ?? '0'} ₽. ${meta['limitperiodicity'] ?? ''}',
      withdrawalComment: meta['withdrawcomment'] ?? 'Не указано',
      cardFeatures: (meta['feature'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      benefits: (meta['benefits'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      withdrawalLocations: (meta['withdrawplace'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      documents: (meta['documents'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      cashbackCategories: (meta['cashbackcategories'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'operationLimit': operationLimit.split('.')[0], // Лимит операций
      'paymentSystems': paymentSystems.join(','), // Платежная система карты
      'smartphonePayments': smartphonePayments.join(','), // Оплата смартфоном
      'maintenancePriceFirstYear':
          maintenancePriceFirstYear, // Стоимость обслуживания в первый год
      'maintenancePriceSecondYear':
          maintenancePriceSecondYear, // Стоимость обслуживания со второго года
      'cardClass': cardClass, // Класс карты
      'cardFeatures': cardFeatures.join(','), // Особенности карты
      'benefits': benefits.join(','), // Преимущества
      'cashbackValueMax': cashbackValueMax, // Максимальный кэшбэк
      'cashbackDescription': cashbackDescription, // Описание кэшбэка
      'withdrawalComment': withdrawalComment, // Комиссия за снятие наличных
      'withdrawalLocations':
          withdrawalLocations.join(','), // Места снятия наличных
      'documents': documents.join(','), // Необходимые документы
      'link': link, // Ссылка
      'offerUrl': offerUrl, // Ссылка на предложение
      'fullImageUrl': fullImageUrl, // Полный URL изображения
      'bankLogoUrl': bankLogoUrl, // URL логотипа банка
      'bankName': bankName, // Название банка
      'title': cardName, // Название карты
      'productType': productType.toString(), // Тип продукта
      'id': id, // Идентификатор
      'status': status, // Статус карты
      'type': type, // Тип
      'balanceincomerate': balanceincomerate, // Процент на остаток
      'incomeDescription': incomeDescription, // Условия дохода
      'ageFrom': ageFrom, // Минимальный возраст
      'cashbackCategories': cashbackCategories.join(','), // Категории кэшбэка
    };
  }
}
