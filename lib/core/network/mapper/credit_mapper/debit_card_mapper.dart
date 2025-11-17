import 'package:fin_uslugi/features/cards/data/models/credit/debit_card.dart';
import 'package:fin_uslugi/features/cards/data/models/credit_model/api_debit_card.dart';

class DebitCardMapper {
  static DebitCard fromApi(ApiDebitCard apiDebitCard) {
    return DebitCard(
      cashbackCategories: apiDebitCard.cashbackCategories != null
          ? List<String>.from(apiDebitCard.cashbackCategories!)
          : null,
      balance: apiDebitCard.balance,
      spending: apiDebitCard.spending,
    );
  }

  static ApiDebitCard toApi(DebitCard debitCard) {
    return ApiDebitCard(
      cashbackCategories: debitCard.cashbackCategories,
      balance: debitCard.balance,
      spending: debitCard.spending,
    );
  }
}
