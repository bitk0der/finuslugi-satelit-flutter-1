import 'package:fin_uslugi/features/banks/data/models/products_info.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'bank_model.g.dart';

@HiveType(typeId: 5) // Уникальный typeId
class BankInfo extends Product {
  @override
  @HiveField(0)
  final BankingCategory productType;

  @override
  @HiveField(1)
  final int id;

  @HiveField(2)
  final String fullName;

  @HiveField(3)
  final String bankName;

  @HiveField(4)
  final String registrationDate;

  @HiveField(5)
  final String license;

  @HiveField(6)
  final String website;

  @HiveField(7)
  final String phone;

  @HiveField(8)
  final String address;

  @HiveField(9)
  final String ogrn;

  @HiveField(10)
  final String inn;

  @HiveField(11)
  final String kpp;

  @HiveField(12)
  final String okpo;

  @HiveField(13)
  final String bik;

  @HiveField(14)
  final String swift;

  @HiveField(15)
  final String aboutBank;

  @HiveField(16)
  final String logoRound;

  @HiveField(17)
  final String logosquare;

  @HiveField(18)
  final String rating;

  @HiveField(19)
  final ProductsInfo productsInfo;

  @override
  final String cardName;

  BankInfo(
      {required this.productType,
      required this.id,
      required this.bankName,
      required this.fullName,
      required this.registrationDate,
      required this.license,
      required this.website,
      required this.phone,
      required this.address,
      required this.ogrn,
      required this.inn,
      required this.kpp,
      required this.okpo,
      required this.bik,
      required this.swift,
      required this.aboutBank,
      required this.logoRound,
      required this.logosquare,
      this.cardName = '',
      required this.productsInfo,
      required this.rating});

  factory BankInfo.fromJson(Map<String, dynamic> json) {
    return BankInfo(
        id: json['id'],
        productType: BankingCategory.banks,
        bankName: json['title']['rendered'] ?? "Нет данных",
        fullName: json['meta']['namefull'] ?? "Нет данных",
        registrationDate: json['meta']['registerdate'] ?? "Нет данных",
        license: json['meta']['license'] ?? "Нет данных",
        website: json['meta']['website'] ?? "Нет данных",
        phone: json['meta']['phonemain'] ?? "Нет данных",
        address: json['meta']['addressmain'] ?? "Нет данных",
        ogrn: json['meta']['ogrn'] ?? "Нет данных",
        inn: json['meta']['inn'] ?? "Нет данных",
        kpp: json['meta']['kpp'] ?? "Нет данных",
        okpo: json['meta']['okpo'] ?? "Нет данных",
        bik: json['meta']['bik'] ?? "Нет данных",
        swift: json['meta']['swift'] ?? "Нет данных",
        aboutBank: json['content'] != null
            ? json['content']['rendered'] ?? "Нет данных"
            : '',
        logoRound: json['meta']['logoround'] ?? "Нет данных",
        logosquare: json['meta']['logosquare'] ?? "Нет данных",
        rating: json['meta']['rating'] ?? "Нет данных",
        productsInfo: json['productsinfo'] != null
            ? ProductsInfo.fromJson(json['productsinfo'])
            : ProductsInfo(
                kredityCount: 0,
                kreditnieKartyCount: 0,
                debetovieKartyCount: 0,
                vkladyCountCount: 0,
                ipotekaCount: 0));
  }
  Map<String, dynamic> toJson() {
    return {
      'productType': productType.toString(),
      'id': id,
      'fullName': fullName,
      'bankName': bankName,
      'registrationDate': registrationDate,
      'license': license,
      'website': website,
      'phone': phone,
      'address': address,
      'ogrn': ogrn,
      'inn': inn,
      'kpp': kpp,
      'okpo': okpo,
      'bik': bik,
      'swift': swift,
      'aboutBank': aboutBank,
      'logoRound': logoRound,
      'logosquare': logosquare,
      'rating': rating,
      'productsinfo': productsInfo
    };
  }
}
