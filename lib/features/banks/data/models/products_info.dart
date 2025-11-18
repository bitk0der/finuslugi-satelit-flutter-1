import 'package:hive_ce_flutter/adapters.dart';

part 'products_info.g.dart';

@HiveType(typeId: 6) // Уникальный идентификатор типа для этой модели
class ProductsInfo extends HiveObject {
  @HiveField(0)
  final int kredityCount;

  @HiveField(1)
  final int kreditnieKartyCount;

  @HiveField(2)
  final int debetovieKartyCount;

  @HiveField(3)
  final int vkladyCountCount;

  @HiveField(4)
  final int ipotekaCount;

  ProductsInfo({
    required this.kredityCount,
    required this.kreditnieKartyCount,
    required this.debetovieKartyCount,
    required this.vkladyCountCount,
    required this.ipotekaCount,
  });

  // Фабрика для создания объекта из JSON
  factory ProductsInfo.fromJson(Map<String, dynamic> json) {
    return ProductsInfo(
      kredityCount: json['kredity_count'] ?? 0,
      kreditnieKartyCount: json['kreditnie_karty_count'] ?? 0,
      debetovieKartyCount: json['debetovie_karty_count'] ?? 0,
      vkladyCountCount: json['vklady_count_count'] ?? 0,
      ipotekaCount: json['ipoteka_count'] ?? 0,
    );
  }

  // Метод для преобразования объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'kredity_count': kredityCount,
      'kreditnie_karty_count': kreditnieKartyCount,
      'debetovie_karty_count': debetovieKartyCount,
      'vklady_count_count': vkladyCountCount,
      'ipoteka_count': ipotekaCount,
    };
  }
}
