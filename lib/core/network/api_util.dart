import 'package:fin_uslugi/core/network/service/rest_service.dart';
import 'package:fin_uslugi/features/banks/data/models/bank_model.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_card_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/credit_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/debit_card_response.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart';
import 'package:fin_uslugi/features/cards/data/models/investment/investment_response.dart';
import 'package:fin_uslugi/features/cards/data/models/mortgages/mortgage_response.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiUtil {
  final RestService _restService;

  ApiUtil(this._restService);

  Future<String> getPhone() async {
    final response = await _restService.getPhone();
    List<String> result = [];
    for (var element in response) {
      result.add(element['phone']);
    }
    for (int index = 0; index < result.length; index++) {
      if (result[index].isNotEmpty) {
        return result[0];
      }
    }
    return '';
  }

  void checkPhone(String phone) {
    _restService.checkPhone(phone);
  }

  Future<Response> searchBanks(
    String searchString,
    int page,
  ) async {
    final result = await _restService.getBanks(searchString, page);
    final List productsMap = result['items'];
    List<BankInfo> productsList = [];
    for (var element in productsMap) {
      productsList.add(BankInfo.fromJson(element));
    }
    return Response(
      products: productsList,
      page: result['pagination']['current_page'],
      total: result['pagination']['total'],
      totalPages: result['pagination']['total_pages'],
    );
  }

  Future<BankInfo> searchBank(
    int id,
  ) async {
    final result = await _restService.getBank(id);
    final List productsMap = result['items'];
    List<BankInfo> productsList = [];
    for (var element in productsMap) {
      productsList.add(BankInfo.fromJson(element));
    }
    return productsList.first;
  }

  Future<Response> searchCredit(String query, int page, String type) async {
    final result = await _restService.searchProduct(type, query, page);
    final List productsMap = result['items'];
    List<CreditResponse> productsList = [];
    for (var element in productsMap) {
      productsList.add(CreditResponse.fromJson(element));
    }
    return Response(
      products: productsList,
      page: result['pagination']['current_page'],
      total: result['pagination']['total'],
      totalPages: result['pagination']['total_pages'],
    );
  }

  Future<Response> searchCreditCard(String type, String query, int page) async {
    final result = await _restService.searchProduct(type, query, page);
    final List productsMap = result['items'];
    List<CreditCardResponse> productsList = [];
    for (var element in productsMap) {
      productsList.add(CreditCardResponse.fromJson(element));
    }
    return Response(
      products: productsList,
      page: result['pagination']['current_page'],
      total: result['pagination']['total'],
      totalPages: result['pagination']['total_pages'],
    );
  }

  Future<Response> searchDebitCard(String type, String query, int page) async {
    final result = await _restService.searchProduct(type, query, page);
    final List productsMap = result['items'];
    List<DebitCardResponse> productsList = [];
    for (var element in productsMap) {
      productsList.add(DebitCardResponse.fromJson(element));
    }
    return Response(
      products: productsList,
      page: result['pagination']['current_page'],
      total: result['pagination']['total'],
      totalPages: result['pagination']['total_pages'],
    );
  }

  Future<Response> searchInvestment(String type, String query, int page) async {
    final result = await _restService.searchProduct(type, query, page);
    final List productsMap = result['items'];
    List<InvestmentResponse> productsList = [];
    for (var element in productsMap) {
      productsList.add(InvestmentResponse.fromJson(element));
    }
    return Response(
      products: productsList,
      page: result['pagination']['current_page'],
      total: result['pagination']['total'],
      totalPages: result['pagination']['total_pages'],
    );
  }

  Future<Response> searchMortgage(String type, String query, int page) async {
    final result = await _restService.searchProduct(type, query, page);
    final List productsMap = result['items'];
    List<MortgageResponse> productsList = [];
    for (var element in productsMap) {
      productsList.add(MortgageResponse.fromJson(element));
    }
    return Response(
      products: productsList,
      page: result['pagination']['current_page'],
      total: result['pagination']['total'],
      totalPages: result['pagination']['total_pages'],
    );
  }

/*   Future<ProductModel?> getInitialMortgages(String searchtext, int page) async {
    final result = await _restService.getInitialMortgages(searchtext, page);
    if (result != null) {
      return ProductModel.fromJson(result['data']['products']);
    }
    return null;
  } */
}
