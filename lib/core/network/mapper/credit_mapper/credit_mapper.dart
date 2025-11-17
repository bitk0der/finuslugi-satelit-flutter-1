import 'package:fin_uslugi/features/cards/data/models/credit/credit.dart';
import 'package:fin_uslugi/features/cards/data/models/credit_model/api_credit.dart';

class CreditMapper {
  static Credit fromApi(ApiCredit apiCredit) {
    return Credit(
      sum: apiCredit.summ,
      term: apiCredit.term,
    );
  }

  static ApiCredit toApi(Credit credit) {
    return ApiCredit(
      summ: credit.sum,
      term: credit.term,
    );
  }
}
