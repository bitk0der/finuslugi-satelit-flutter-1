import 'dart:convert';

import 'package:fin_uslugi/core/constants/translations.dart';

class Translator {
  static Map<String, String> translationMap = {};
  // Функция для создания карты переводов
  static Map<String, String> createTranslationMap(String json) {
    List<dynamic> data = jsonDecode(json);
    translationMap = {
      for (var item in data) item['value'] as String: item['label'] as String
    };
    return translationMap;
  }

// Функция для перевода строки
  static String translateCommaSeparatedString(String input) {
    if (translationMap.isEmpty) createTranslationMap(translationsJson);

    List<String> words = input.split(',');

    // Переводим каждое слово
    List<String> translatedWords = words.map((word) {
      String trimmedWord = word.trim(); // Убираем пробелы

      return translationMap[trimmedWord] ??
          trimmedWord; // Переводим слово или оставляем оригинал
    }).toList();

    // Собираем строку обратно
    return translatedWords.join(', ');
  }
}
