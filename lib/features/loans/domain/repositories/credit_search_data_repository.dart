import 'package:fin_uslugi/features/loans/data/models/credit/loan_main_model.dart';
import 'package:fin_uslugi/features/loans/data/models/credit/search_responses/response.dart';
import 'package:fin_uslugi/features/loans/data/repositories/credit_search_repository.dart';
import 'package:fin_uslugi/core/network/api_client.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CreditSearchRepository)
class SearchDataRepository implements CreditSearchRepository {
  final ApiClient apiUtil;

  SearchDataRepository(this.apiUtil);

  @override
  Future<Response> searchCredit(
      {required int page,
      required String searchString,
      required String query}) async {
    final result = await apiUtil.searchCredit(searchString, query, page);
    final List productsMap = result.items;
    List<LoanMainModel> productsList = [];
    for (var element in productsMap) {
      productsList.add(LoanMainModel.fromJson(element));
    }
    return Response(
      products: productsList,
      page: result.pagination.page,
      total: result.pagination.total,
      totalPages: result.pagination.totalPages,
    );
  }
}
