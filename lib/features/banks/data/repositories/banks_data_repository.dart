import 'package:fin_uslugi/core/network/api_util.dart';
import 'package:fin_uslugi/features/banks/data/models/bank_model.dart';
import 'package:fin_uslugi/features/banks/domain/repositories/banks_repository.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart';

class BanksDataRepository extends BanksRepository {
  final ApiUtil apiUtil;
  BanksDataRepository(this.apiUtil);

  @override
  Future<Response> searchBanks(
      {required int page, required String searchString}) async {
    final result = await apiUtil.searchBanks(searchString, page);
    return result;
  }

  @override
  Future<BankInfo> searchBank({required int id}) async {
    final result = await apiUtil.searchBank(id);
    return result;
  }
}
