import 'package:fin_uslugi/features/cards/data/models/credit/credit_card.dart';
import 'package:fin_uslugi/features/cards/data/models/credit_model/api_credit_card.dart';

class CreditCardMapper {
  static CreditCard fromApi(ApiCreditCard apiCreditCard) {
    return CreditCard(
      sum: apiCreditCard.summ,
    );
  }

  static ApiCreditCard toApi(CreditCard creditCard) {
    return ApiCreditCard(
      summ: creditCard.sum,
    );
  }
}
