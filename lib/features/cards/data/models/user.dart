import 'package:fin_uslugi/features/cards/data/models/credit/credit.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/credit_card.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/debit_card.dart';

class User {
  final String? firstName;
  final int? age;
  final Credit credit;
  final CreditCard creditCard;
  final DebitCard debitCard;
  final int? creditRating;

  User({
    this.firstName,
    this.age,
    required this.credit,
    required this.creditCard,
    required this.debitCard,
    required this.creditRating,
  });

  bool isEmpty() {
    return firstName == null;
  }

  bool isNotEmpty() => !isEmpty();

  User copyWith({
    String? firstName,
    int? age,
    Credit? credit,
    CreditCard? creditCard,
    DebitCard? debitCard,
    int? creditRating,
  }) =>
      User(
        firstName: firstName ?? this.firstName,
        age: age ?? this.age,
        credit: credit ?? this.credit,
        creditCard: creditCard ?? this.creditCard,
        debitCard: debitCard ?? this.debitCard,
        creditRating: creditRating ?? this.creditRating,
      );
}
