import 'package:fin_uslugi/features/loans/data/models/credit/search_responses/response.dart';

abstract class CreditSearchRepository {
  Future<Response> searchCredit(
      {required int page, required String query, required String searchString});
}
