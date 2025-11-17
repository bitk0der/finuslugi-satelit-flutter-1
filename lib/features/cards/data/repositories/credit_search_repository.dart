import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart';

abstract class CreditSearchRepository {
  Future<Response> searchCredit({required int page, required String query});

  Future<Response> searchCreditCard({required int page, required String query});

  Future<Response> searchDebitCard({required int page, required String query});

  Future<Response> searchInvestements(
      {required int page, required String query});

  Future<Response> searchMortgages({required int page, required String query});
}
