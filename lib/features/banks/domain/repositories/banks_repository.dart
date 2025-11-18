import 'package:fin_uslugi/features/banks/data/models/bank_model.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart';

abstract class BanksRepository {
  Future<Response> searchBanks(
      {required int page, required String searchString});
  Future<BankInfo> searchBank({required int id});
}
