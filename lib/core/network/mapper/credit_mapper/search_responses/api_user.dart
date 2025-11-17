import 'package:fin_uslugi/features/cards/data/models/credit_model/api_credit.dart';
import 'package:fin_uslugi/features/cards/data/models/credit_model/api_credit_card.dart';
import 'package:fin_uslugi/features/cards/data/models/credit_model/api_debit_card.dart';

class ApiUser {
  static const _FIRST_NAME = "first_name";
  static const _AGE = "age";
  static const _CREDIT = "credit";
  static const _CREDIT_CARD = "credit_card";
  static const _DEBIT_CARD = "debit_card";
  static const _creditRating = 'credit_rating';

  final String? firstName;
  final int? age;
  final ApiCredit credit;
  final ApiCreditCard creditCard;
  final ApiDebitCard debitCard;
  final int? creditRating;

  ApiUser({
    required this.firstName,
    required this.age,
    required this.credit,
    required this.creditCard,
    required this.debitCard,
    required this.creditRating,
  });

  ApiUser.fromMap(Map<String, dynamic> map)
      : firstName = map[_FIRST_NAME],
        age = map[_AGE],
        credit = ApiCredit.fromMap(map[_CREDIT]),
        creditCard = ApiCreditCard.fromMap(map[_CREDIT_CARD]),
        debitCard = ApiDebitCard.fromMap(map[_DEBIT_CARD]),
        creditRating = map[_creditRating];

  Map<String, dynamic> toMap() {
    return {
      _FIRST_NAME: firstName,
      _AGE: age,
      _CREDIT: credit.toMap(),
      _CREDIT_CARD: creditCard.toMap(),
      _DEBIT_CARD: debitCard.toMap(),
      _creditRating: creditRating,
    };
  }
}
