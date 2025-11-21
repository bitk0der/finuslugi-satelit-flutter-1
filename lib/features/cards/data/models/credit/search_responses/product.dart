import 'package:hive_ce_flutter/adapters.dart';

part 'product.g.dart';

abstract class Product {
  BankingCategory get productType;
  String get id;
  String get bankName;
  String get cardName;
}

@HiveType(typeId: 0) // Уникальный ID для адаптера
enum BankingCategory {
  @HiveField(0)
  credits, // Кредиты
  @HiveField(1)
  creditCards, // Кредитные карты
  @HiveField(2)
  debitCards, // Дебетовые карты
  @HiveField(3)
  deposits, // Вклады
  @HiveField(4)
  mortgages, // Ипотеки
  @HiveField(5)
  banks, // Банки
  @HiveField(6)
  loans, // Займы
  @HiveField(7)
  promocodes // Промокоды
}
