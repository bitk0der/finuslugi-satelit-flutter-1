import 'package:fin_uslugi/core/network/api_util.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart';
import 'package:fin_uslugi/features/cards/data/repositories/credit_search_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CreditSearchRepository)
class SearchDataRepository extends CreditSearchRepository {
  final ApiUtil apiUtil;

  SearchDataRepository(this.apiUtil);

  @override
  Future<Response> searchCredit(
      {required int page, required String query}) async {
    final result = await apiUtil.searchCredit(query, page, 'kredity');
    return result;
  }

  @override
  Future<Response> searchCreditCard(
      {required int page, required String query}) async {
    final result =
        await apiUtil.searchCreditCard('kreditnie-karty', query, page);
    return result;
  }

  @override
  Future<Response> searchDebitCard(
      {required int page, required String query}) async {
    final result =
        await apiUtil.searchDebitCard('debetovie-karty', query, page);
    return result;
  }

  @override
  Future<Response> searchInvestements(
      {required int page, required String query}) async {
    final result = await apiUtil.searchInvestment('vklady', query, page);
    return result;
  }

  @override
  Future<Response> searchMortgages(
      {required int page, required String query}) async {
    final result = await apiUtil.searchMortgage('ipoteka', query, page);
    return result;
  }
}
