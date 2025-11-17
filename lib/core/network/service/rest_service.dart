import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fin_uslugi/core/network/routes.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class RestService {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 120 * 1000),
      receiveTimeout: const Duration(milliseconds: 120 * 1000),
    ),
  );

  RestService() {
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  /*  int _requestCount = 0; */

  Future<Map<String, dynamic>> searchProduct(
      String type, String query, int page) async {
    final response = await _dio.get(Routes.creditSearch(type, query, page));
    return response.data;
  }

/*   int _errorCount = 0; */

/*   Future<List> searchDebt(Map<String, dynamic> body) async {
    Logger().i(body);
    try {
      final response = await _dio.post(
        "https://www.gosuslugi.ru/api/pay/public/v1/paygate/bill/create?interfaceTypeCode=BETA_NOAUTH",
        data: body,
      );
      //Logger().i(response.data);
      return response.data["bills"];
    } catch (e) {
      _errorCount++;
      print(_errorCount);
      if (_errorCount < 3) {
        return searchDebt(body);
      } else {
        _errorCount = 0;
        Logger().e(e);
        rethrow;
      }
    }
  } */

/*   Future<Map<String, dynamic>> _getResult({
    required String taskId,
    required Duration duration,
  }) async {
    _requestCount++;
    if (_requestCount > 60) {
      _requestCount = 0;
      throw ('Native timeout');
    }
    Map<String, dynamic> parameters = {"taskid": taskId};
    parameters.addAll({"timestamp": Timestamp.generate(parameters, "Jkdus7")});
    final response = await _dio.get(
        "http://xn--90aijhbe7af.xn--p1ai/getresult-fssp.php",
        queryParameters: parameters);
    if (response.data["status"] == "inprocess") {
      await Future.delayed(duration);
      return _getResult(
          taskId: taskId, duration: const Duration(milliseconds: 1500));
    } else {
      _requestCount = 0;
      return response.data;
    }
  } */

/*   Future<List> getPhone() async {
    try {
      final response = await _dio.get(
        "https://partners.bankrotgov.ru/api/phone",
        options: Options(contentType: Headers.jsonContentType),
      );
      final data = response.data['data'];
      Logger().i(data);
      return data;
    } catch (e) {
      return [];
    }
  }

  Future<void> checkPhone(String phone) async {
    try {
      final response = await _dio.post(
        "https://partners.bankrotgov.ru/api/phone/click/$phone",
        options: Options(contentType: Headers.jsonContentType),
      );
      Logger().i(response.data['success']);
    } catch (e) {
      Logger().i(e);
    }
  } */

/*   Future<Map<String, dynamic>?> getInitialMortgages(
      String searchtext, int page) async {
    try {
      final response = await _dio.get(
        Routes.searchProgramms(searchtext, page),
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      final data = json.decode(response.data);
      Logger().i(data);
      return data;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  } */

  Future<Map<String, dynamic>> getBanks(String searchtext, int page) async {
    try {
      final response = await _dio.get(
        Routes.searchBanks(searchtext, page),
        options: Options(contentType: Headers.jsonContentType),
      );

      return response.data;
    } catch (e) {
      Logger().e(e);
      return {};
    }
  }

  Future<Map<String, dynamic>> getBank(int id) async {
    try {
      final response = await _dio.get(
        Routes.searchBank(id),
        options: Options(contentType: Headers.jsonContentType),
      );

      return response.data;
    } catch (e) {
      Logger().e(e);
      return {};
    }
  }

  Future<bool> getModerationModStatus() async {
    /*    try {
      final response = await _dio.get(
        "https://xn--80ab2alw.xn--p1ai/api/appsconfig.php",
        queryParameters: {
          'bundle': packageInfo.packageName,
          'platform': Platform.isAndroid ? 'android' : 'ios',
        },
      );
      bool val = false;
      if (response.data is String) {
        val = jsonDecode(response.data)['indigo'];
      } else {
        val = response.data['indigo'];
      }
      return val;
    } catch (e) {
      Logger().e(e);
    } */
    return true;
  }
}
