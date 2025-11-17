import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_card_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/debit_card_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/product.dart';
import 'package:fin_uslugi/features/cards/data/models/investment/investment_response.dart';
import 'package:fin_uslugi/features/cards/data/models/mortgages/mortgage_response.dart';
import 'package:hive_ce_flutter/adapters.dart';

abstract class StorageModule {
  Future<Box> get hive async {
    await Hive.initFlutter();
    Hive.registerAdapter(CreditCardResponseAdapter());
    Hive.registerAdapter(BankingCategoryAdapter());
    Hive.registerAdapter(CreditResponseAdapter());
    Hive.registerAdapter(DebitCardResponseAdapter());
    Hive.registerAdapter(MortgageResponseAdapter());
    Hive.registerAdapter(InvestmentResponseAdapter());
    return Hive.openBox('v1.0');
  }
}
