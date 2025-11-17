import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UiUtil {
  static String monthName(int number) {
    switch (number) {
      case 1:
        return "Январь";
      case 2:
        return "Февраль";
      case 3:
        return "Март";
      case 4:
        return "Апрель";
      case 5:
        return "Май";
      case 6:
        return "Июнь";
      case 7:
        return "Июль";
      case 8:
        return "Август";
      case 9:
        return "Сентябрь";
      case 10:
        return "Октябрь";
      case 11:
        return "Ноябрь";
      case 12:
        return "Декабрь";
      default:
        return "";
    }
  }

  static List<Map<String, dynamic>> benefits = [
    {"value": "freeNotifications", "label": "Бесплатные уведомления"},
    {"value": "freeService", "label": "Бесплатное обслуживание"},
    {"value": "graceCash", "label": "Льготный период на снятие"},
    {"value": "noCertificates", "label": "Без справок о доходах"},
    {"value": "forTravelling", "label": "Для путешествий"},
    {"value": "freeCash", "label": "Наличные бесплатно"},
    {"value": "selfEmployed", "label": "Для самозанятых"},
    {"value": "gasolineBonuses", "label": "Бонусы на АЗС"},
    {"value": "supermarketBonuses", "label": "Бонусы в супермаркетах"},
    {"value": "taxiBonuses", "label": "Бонусы на такси"},
    {"value": "entertainmentBonuses", "label": "Бонусы за развлечения"},
    {"value": "restaurantBonuses", "label": "Бонусы в ресторанах"},
    {"value": "bonusAutoService", "label": "Бонусы за автоуслуги"},
    {"value": "drugstoreBonuses", "label": "Бонусы за медицинские услуги"},
    {"value": "purchaseBonuses", "label": "Бонусы за покупки"},
    {
      "value": "freeWithdrawalInAnyCashpoint",
      "label": "Наличные без комиссии в любых банкоматах"
    },
    {"value": "freeCash", "label": "Наличные бесплатно"},
    {"value": "installment", "label": "Рассрочка"}
  ];

  static List<Map<String, dynamic>> features = [
    {"value": "smartphone", "label": "Оплата смартфоном"},
    {"value": "cobranding", "label": "Кобрендинг"},
    {"value": "contactlessPayment", "label": "Бесконтактная оплата"},
    {"value": "courier", "label": "Доставка курьером"},
    {"value": "businessLounge", "label": "Доступ в бизнес-залы"},
    {"value": "conciergeService", "label": "Консьерж-сервис"},
    {"value": "freeTcdInsurance", "label": "Бесплатный полис ВЗР"},
    {"value": "mirAccept", "label": "MirAccept"},
    {"value": "3dSecure", "label": "3D Secure"},
    {"value": "social", "label": "Социальная"}
  ];

  static String generateYearPlural(int count) {
    return (count % 10 == 1 && count != 11)
        ? "год"
        : (count % 10 >= 2 &&
                count % 10 <= 4 &&
                !(count % 100 >= 12 && count % 100 <= 14))
            ? "года"
            : "лет";
  }

  static String prepareNumber(String number) {
    if (number.length > 3 && number.length < 7) {
      return "${number.substring(0, number.length - 3)} ${number.substring(number.length - 3)}";
    } else if (number.length >= 7 && number.length < 10) {
      return "${number.substring(0, number.length - 6)} ${number.substring(number.length - 6, number.length - 3)} ${number.substring(number.length - 3)}";
    } else if (number.length >= 10) {
      return "${number.substring(0, number.length - 9)} ${number.substring(number.length - 9, number.length - 6)} ${number.substring(number.length - 6, number.length - 3)} ${number.substring(number.length - 3)}";
    }
    return number;
  }

  static String translit(String text) {
    String result = "";
    for (int i = 0; i < text.length; i++) {
      switch (text[i].toUpperCase()) {
        case ("A"):
          result += "А";
          break;
        case ("B"):
          result += "В";
          break;
        case ("E"):
          result += "Е";
          break;
        case ("K"):
          result += "К";
          break;
        case ("M"):
          result += "М";
          break;
        case ("H"):
          result += "Н";
          break;
        case ("O"):
          result += "О";
          break;
        case ("P"):
          result += "Р";
          break;
        case ("C"):
          result += "С";
          break;
        case ("T"):
          result += "Т";
          break;
        case ("Y"):
          result += "У";
          break;
        case ("X"):
          result += "Х";
          break;
        default:
          result += text[i].toUpperCase();
      }
    }
    return result;
  }

  static String generatePaymentPlural(int count) {
    return (count % 10 == 1 && count % 100 != 11)
        ? "начисление"
        : (count % 10 >= 2 &&
                count % 10 <= 4 &&
                (count % 100 < 10 || count % 100 >= 20))
            ? "начисления"
            : "начислений";
  }

  static String invoicesCountPlural(int count) {
    return (count % 10 == 1 && count % 100 != 11)
        ? "задолженность"
        : (count % 10 >= 2 &&
                count % 10 <= 4 &&
                (count % 100 < 10 || count % 100 >= 20))
            ? "задолженности"
            : "задолженностей";
  }

  static String formatDate(DateTime date) {
    String day;
    String month;
    String year = date.year.toString();
    if (date.day < 10) {
      day = "0${date.day}";
    } else {
      day = "${date.day}";
    }
    if (date.month < 10) {
      month = "0${date.month}";
    } else {
      month = "${date.month}";
    }
    return "$day.$month.$year";
  }

  static String prepareSum(double sum) {
    String result = "";
    if (sum % 1 == 0) {
      result = sum.toStringAsFixed(0);
    } else {
      result = sum.toStringAsFixed(2);
    }
    result = result.replaceAll(".", ",");
    return "$result ₽";
  }

  static String formatSts(String text) {
    if (checkSts(text)) {
      return text;
    } else {
      try {
        final textWithoutSpaces = text.replaceAll(" ", "");
        return "${textWithoutSpaces.substring(0, 2)} ${textWithoutSpaces.substring(2, 4)} ${textWithoutSpaces.substring(4)}";
      } catch (e) {
        Logger().e(e);
        return text;
      }
    }
  }

  static String formatVy(String text) {
    if (checkVy(text)) {
      return text;
    } else {
      try {
        final textWithoutSpaces = text.replaceAll(" ", "");
        return "${textWithoutSpaces.substring(0, 4)} ${textWithoutSpaces.substring(4)}";
      } catch (e) {
        Logger().e(e);
        return text;
      }
    }
  }

  static String formatPasport(String text) {
    if (checkPasport(text)) {
      return text;
    } else {
      try {
        final textWithoutSpaces = text.replaceAll(" ", "");
        return "${textWithoutSpaces.substring(0, 2)} ${textWithoutSpaces.substring(2, 4)} ${textWithoutSpaces.substring(4)}";
      } catch (e) {
        Logger().e(e);
        return text;
      }
    }
  }

  static String formatSnils(String text) {
    if (checkSnils(text)) {
      return text;
    } else {
      try {
        String textWithoutSpaces = text.replaceAll(" ", "");
        textWithoutSpaces = textWithoutSpaces.replaceAll("-", "");
        return "${textWithoutSpaces.substring(0, 3)}-${textWithoutSpaces.substring(3, 6)}-${textWithoutSpaces.substring(6, 9)} ${textWithoutSpaces.substring(9)}";
      } catch (e) {
        Logger().e(e);
        return text;
      }
    }
  }

  static String getlogoUrl(String url) {
    Uri uri = Uri.parse(url);
    String? imageParam = uri.queryParameters['image'];
    if (imageParam != null) {
      return utf8.decode(base64.decode(imageParam));
    } else {
      return url;
    }
  }

  static bool checkSts(String text) {
    return RegExp(r"\d{2} [\dукенхваросмтУКЕНХВАРОСМТ]{2} \d{6}$")
        .hasMatch(text);
  }

  static bool checkVy(String text) {
    return RegExp(r"^\d{2}[\dА-Яа-я]{2}\s\d{6}$").hasMatch(text);
  }

  static bool checkSnils(String text) {
    return RegExp(r"^\d{3}-\d{3}-\d{3}\s\d{2}$").hasMatch(text);
  }

  static bool checkInn(String text) {
    return RegExp(r"^\d{10,12}$").hasMatch(text);
  }

  static bool checkPasport(String text) {
    return RegExp(r"^\d{2}\s\d{2}\s\d{6}$").hasMatch(text);
  }

  static bool checkInternationalPassport(String text) {
    return RegExp(r"^\d{2}\s\d{7}$").hasMatch(text);
  }

  static bool checkBirthCertificate(String text) {
    return RegExp(r"^[I,V,X]{1,3}[А-Я]{2}\d{6}$").hasMatch(text);
  }

  static bool checkPhone(String text) {
    return RegExp(r"^\+7\s\(\d{3}\)\s\d{3}-\d{2}-\d{2}$").hasMatch(text);
  }

  static final phoneFormatter = MaskTextInputFormatter(
      mask: '+# (###) ###-##-##', filter: {"#": RegExp(r'\d')});

  static List<String> creditCardsComparisonTitles = [
    "Минимальная сумма кредита",
    "Максимальная сумма кредита",
    "Беспроцентный период на покупки",
/*     "Беспроцентный период на снятие наличных", */
    "Минимальный платеж",
    "Рассрочка",
    "Платежная система карты",
    "Оплата смартфоном",
    "Стоимость обслуживания в первый год",
    "Стоимость обслуживания со второго года",
    "Класс карты",
    "Особенности карты",
    "Преимущества",
    "Комиссия за снятие наличных",
    "Места снятия наличных",
    /*  "Дополнительные условия", */
    "Банки-партнеры",
  ];

  static List<String> debitCardsComparisonTitles = [
    "Лимит операции",
    "Платежная система карты",
    "Оплата смартфоном",
    "Стоимость обслуживания в первый год",
    "Стоимость обслуживания со второго года",
    "Класс карты",
    "Особенности карты",
    "Преимущества",
    "Комиссия за снятие наличных",
    "Места снятия наличных",
    "Дополнительные условия"
  ];

  static List<String> creditsComparisonTitles = [
    "Минимальная сумма кредита",
    "Максимальная сумма кредита",
    "Время рассмотрения заявки",
    "Минимальный возраст заемщика",
    "Минимальный доход",
    "Стаж на последнем месте работы",
    "Цель кредита",
    "Тип заемщика",
    "Способ получения",
    "Требования к заемщику",
    "Тип платежей",
    "Периодичность платежей",
    "Обеспечение",
    "Поручители",
    "Обязательные документы",
    "Необязательные документы",
  ];

  static List<String> depositComparisonTitles = [
    "Тип вклада",
    "Назначение вклада",
    "Пополняемый вклад",
    "Капитализация",
    "Досрочное закрытие",
    "Частичное снятие",
  ];

  static List<String> mortgageComparisonTitles = [
    "Минимальная сумма кредита",
    "Максимальная сумма кредита",
    "Процентная ставка",
    "Первоначальный взнос",
    "Минимальный возраст заемщика",
    "Стаж на последнем месте работы",
    "Цель кредита",
    "Доступные программы",
    "Тип заемщика",
    "Требования к заемщику",
    "Обеспечение",
    "Обязательные документы для подачи заявки",
    "Дополнительные условия"
  ];
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class LongNumberTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length < oldValue.text.length) {
      return TextEditingValue(
        text: newValue.text,
        selection: newValue.selection,
      );
    }
    String number = newValue.text.replaceAll(RegExp(r'[^\d]'), "");
    String text = newValue.text;
    int offset = newValue.selection.baseOffset;
    if (number.length < 10) {
      if (number.length > 3 && number.length < 7) {
        text =
            "${number.substring(0, number.length - 3)} ${number.substring(number.length - 3)}";
        if (offset == newValue.text.length) offset++;
      } else if (number.length >= 7 && number.length < 10) {
        text =
            "${number.substring(0, number.length - 6)} ${number.substring(number.length - 6, number.length - 3)} ${number.substring(number.length - 3)}";
        if (offset == newValue.text.length) offset++;
      }
    }
    if (offset >= text.length) offset = text.length;
    return TextEditingValue(
      text: text,
      selection: TextSelection(
        baseOffset: offset,
        extentOffset: offset,
      ),
    );
  }
}

class FloatingPointNumberTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }
    if (newValue.text.replaceFirst(".", "").contains(".")) {
      return oldValue;
    }
    String result = newValue.text.replaceAll(",", '.');
    result = newValue.text.replaceAll(RegExp(r'[^0-9.]'), '');
    if (result.length == 2 && !result.contains(".")) {
      return TextEditingValue(
        text: "$result.",
        selection: TextSelection(
          baseOffset: newValue.selection.baseOffset + 1 < result.length + 1
              ? newValue.selection.baseOffset + 1
              : result.length + 1,
          extentOffset: newValue.selection.extentOffset + 1 < result.length + 1
              ? newValue.selection.extentOffset + 1
              : result.length + 1,
        ),
      );
    }
    return TextEditingValue(
      text: result,
      selection: TextSelection(
        baseOffset: newValue.selection.baseOffset < result.length
            ? newValue.selection.baseOffset
            : result.length,
        extentOffset: newValue.selection.extentOffset < result.length
            ? newValue.selection.extentOffset
            : result.length,
      ),
    );
  }
}
