import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'investment_response.g.dart';

@HiveType(typeId: 7)
class InvestmentResponse extends Product {
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
  int featuredMedia;

  @HiveField(10)
  int menuOrder;

  @HiveField(11)
  String template;

  @HiveField(12)
  String? jfLimitResponses;

  @HiveField(13)
  String offerUrl;

  @HiveField(14)
  String inHorizontalTop;

  @HiveField(15)
  String isArchive;

  @HiveField(16)
  String offerEpc;

  @HiveField(17)
  String depositType;

  @HiveField(18)
  String feature;

  @HiveField(19)
  String sumFrom;

  @HiveField(20)
  String sumTo;

  @HiveField(21)
  String ratePskFrom;

  @HiveField(22)
  String ratePskTo;

  @HiveField(23)
  String termFrom;

  @HiveField(24)
  String termTo;

  @HiveField(25)
  String haveReplenishment;

  @HiveField(26)
  String haveCapitalization;

  @HiveField(27)
  String haveFreeTermination;

  @HiveField(28)
  String accumulativeDepositType;

  @HiveField(29)
  String capitalizationText;

  @HiveField(30)
  String partialWithdrawalText;

  @HiveField(31)
  String replenishmentText;

  @HiveField(32)
  String earlyTerminationText;

  @HiveField(33)
  String additionalText;

  @HiveField(34)
  String additionalDescription;

  @HiveField(35)
  String footnotes;

  @HiveField(36)
  String rating;

  @override
  @HiveField(37)
  String bankName;

  @HiveField(38)
  String bankLogo;

  @HiveField(39)
  String parentPostRelation;

  @override
  @HiveField(40)
  BankingCategory productType;

  InvestmentResponse({
    required this.id,
    required this.productType,
    required this.date,
    required this.dateGmt,
    required this.modified,
    required this.modifiedGmt,
    required this.slug,
    required this.status,
    required this.type,
    required this.cardName,
    required this.featuredMedia,
    required this.menuOrder,
    required this.template,
    this.jfLimitResponses,
    required this.offerUrl,
    required this.inHorizontalTop,
    required this.isArchive,
    required this.offerEpc,
    required this.depositType,
    required this.feature,
    required this.sumFrom,
    required this.sumTo,
    required this.ratePskFrom,
    required this.ratePskTo,
    required this.termFrom,
    required this.termTo,
    required this.haveReplenishment,
    required this.haveCapitalization,
    required this.haveFreeTermination,
    required this.accumulativeDepositType,
    required this.capitalizationText,
    required this.partialWithdrawalText,
    required this.replenishmentText,
    required this.earlyTerminationText,
    required this.additionalText,
    required this.additionalDescription,
    required this.footnotes,
    required this.rating,
    required this.bankName,
    required this.bankLogo,
    required this.parentPostRelation,
  });

  // Преобразование объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'deposittype': depositType, // Тип вклада
      'feature': feature, // Назначение вклада
      'replenishmenttext': replenishmentText, // Пополняемый вклад
      'capitalizationtext': capitalizationText, // Капитализация
      'earlyterminationtext': earlyTerminationText, // Досрочное закрытие
      'partialwithdrawaltext': partialWithdrawalText, // Частичное снятие
      'additionaltext': additionalText, // Дополнительный текст
      'id': id, // ID
      'date': date.toIso8601String(), // Дата
      'date_gmt': dateGmt.toIso8601String(), // Дата GMT
      'modified': modified.toIso8601String(), // Изменено
      'modified_gmt': modifiedGmt.toIso8601String(), // Изменено GMT
      'slug': slug, // Slug
      'status': status, // Статус
      'type': type, // Тип
      'cardName': cardName, // Название карты
      'featured_media': featuredMedia, // Медиа
      'menu_order': menuOrder, // Порядок
      'template': template, // Шаблон
      'meta': {
        '_jf_limit_responses': jfLimitResponses, // Ограничения ответа
        'offerurl': offerUrl, // URL предложения
        'inhorizontaltop': inHorizontalTop, // В топе горизонтально
        'isarchive': isArchive, // Архивировано
        'offerepc': offerEpc, // EPC предложения
        'sumfrom': sumFrom, // Минимальная сумма
        'sumto': sumTo, // Максимальная сумма
        'ratepskfrom': ratePskFrom, // Минимальная ставка
        'ratepskto': ratePskTo, // Максимальная ставка
        'termfrom': termFrom, // Срок от
        'termto': termTo, // Срок до
        'havereplenishment': haveReplenishment, // Есть пополнение
        'havecapitalization': haveCapitalization, // Есть капитализация
        'havefreetermination':
            haveFreeTermination, // Есть бесплатное расторжение
        'accumulativedeposittype':
            accumulativeDepositType, // Накопительный депозит
        'additionaldescription':
            additionalDescription, // Дополнительное описание
        'footnotes': footnotes, // Примечания
        'rating': rating, // Рейтинг
      },
      'bankinfo': {
        'name': bankName, // Название банка
        'logo': bankLogo, // Логотип банка
      },
      'parent_post_relation': parentPostRelation, // Связь с постом
    };
  }

  // Создание объекта из JSON
  factory InvestmentResponse.fromJson(Map<String, dynamic> json) {
    return InvestmentResponse(
      id: json['id'],
      productType: BankingCategory.deposits,
      date: DateTime.parse(json['date']),
      dateGmt: DateTime.parse(json['date_gmt']),
      modified: DateTime.parse(json['modified']),
      modifiedGmt: DateTime.parse(json['modified_gmt']),
      slug: json['slug'],
      status: json['status'],
      type: json['type'],
      cardName: json['title']['rendered'],
      featuredMedia: json['featured_media'],
      menuOrder: json['menu_order'],
      template: json['template'],
      jfLimitResponses: json['meta']['_jf_limit_responses'],
      offerUrl: json['meta']['offerurl'],
      inHorizontalTop: json['meta']['inhorizontaltop'],
      isArchive: json['meta']['isarchive'],
      offerEpc: json['meta']['offerepc'],
      depositType: json['meta']['deposittype'],
      feature: json['meta']['feature'],
      sumFrom: json['meta']['sumfrom'],
      sumTo: json['meta']['sumto'],
      ratePskFrom: json['meta']['ratepskfrom'],
      ratePskTo: json['meta']['ratepskto'],
      termFrom: json['meta']['termfrom'],
      termTo: json['meta']['termto'],
      haveReplenishment: json['meta']['havereplenishment'],
      haveCapitalization: json['meta']['havecapitalization'],
      haveFreeTermination: json['meta']['havefreetermination'],
      accumulativeDepositType: json['meta']['accumulativedeposittype'],
      capitalizationText: json['meta']['capitalizationtext'],
      partialWithdrawalText: json['meta']['partialwithdrawaltext'],
      replenishmentText: json['meta']['replenishmenttext'],
      earlyTerminationText: json['meta']['earlyterminationtext'],
      additionalText: json['meta']['additionaltext'],
      additionalDescription: json['meta']['additionaldescription'],
      footnotes: json['meta']['footnotes'],
      rating: json['meta']['rating'],
      bankLogo: json['bankinfo']['logo'],
      parentPostRelation: json['parent_post_relation'],
      bankName: json['parent_post_title'],
    );
  }
}
