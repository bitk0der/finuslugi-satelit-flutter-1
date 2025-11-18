import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:fin_uslugi/core/utils/colorful_print.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  static String _token = "";
  static setToken(String newToken) => _token = newToken;

  static void colorfulResponse(
    String path,
    Map<String, dynamic>? body,
    dynamic res,
  ) {
    "-------Request:-------".printGreen();
    "path: $path".printGreen();
    "body: $body".printGreen();
    debugPrint(res.toString());
    "----------------------".printGreen();
  }

  Dio? dio;

  dioConfig() {
    dio = Dio();

    dio!.interceptors.add(RetryInterceptor(
      dio: dio!,
      logPrint: print, // specify log function (optional)
      retries: 3, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before first retry
        Duration(seconds: 2), // wait 2 sec before second retry
        Duration(seconds: 3), // wait 3 sec before third retry
      ],
    ));
  }

  Future<dynamic> sendGet(
    String path,
    Map<String, dynamic>? queryParameters, {
    bool withToken = false,
    bool isUrlEncoded = false,
  }) async {
    Map<String, String> headers = {
      "Connection": "keep-alive",
      "Accept": "",
      if (withToken) "Authorization": "Token $_token",
    };

    try {
      if (dio == null) {
        dioConfig();
      }
      final Response response = await dio!.get(
        path,
        queryParameters: queryParameters,
        options: Options(
            contentType: isUrlEncoded
                ? Headers.formUrlEncodedContentType
                : Headers.jsonContentType,
            headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        dynamic res = response.data;

        colorfulResponse(path, queryParameters, res);
        return res;
      } else {
        debugPrint('statusCode ${response.statusCode.toString()}');
        debugPrint('body ${utf8.decode(response.data).toString()}');
        if (response.statusCode == 403) throw "Неправильный логин или пароль";
        throw "get error";
      }
    } catch (e) {
      colorfulResponse(path, queryParameters, e.toString());
      throw e.toString();
    }
  }

  Future<dynamic> sendPost(
    String path,
    Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters, {
    bool withToken = false,
  }) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Connection": "keep-alive",
      "Accept": "*/*",
      if (withToken) "Authorization": "Token $_token",
    };

    try {
      if (dio == null) {
        dioConfig();
      }
      final Response response = await dio!.post(
        path,
        queryParameters: queryParameters,
        data: jsonEncode(body),
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic res = response.data.isNotEmpty ? response.data : {};

        colorfulResponse(path, queryParameters, res);
        return res;
      } else {
        debugPrint('statusCode ${response.statusCode.toString()}');
        debugPrint('body ${utf8.decode(response.data).toString()}');
        if (response.statusCode == 403) throw "Неправильный логин или пароль";
        throw "get error";
      }
    } catch (e) {
      colorfulResponse(path, queryParameters, e.toString());
      throw e.toString();
    }
  }

  Future<dynamic> sendDelete(
    String path,
    Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters, {
    bool withToken = false,
  }) async {
    Map<String, String> headers = {
      "Connection": "keep-alive",
      "Accept": "*/*",
      if (withToken) "Authorization": "Token $_token",
    };

    try {
      if (dio == null) {
        dioConfig();
      }
      final Response response = await dio!.delete(
        path,
        queryParameters: queryParameters,
        data: jsonEncode(body),
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        dynamic res = response.data.isNotEmpty ? response.data : {};

        colorfulResponse(path, queryParameters, res);
        return res;
      } else {
        debugPrint('statusCode ${response.statusCode.toString()}');
        debugPrint('body ${utf8.decode(response.data).toString()}');
        if (response.statusCode == 403) throw "Неправильный логин или пароль";
        throw "get error";
      }
    } catch (e) {
      colorfulResponse(path, queryParameters, e.toString());
      throw e.toString();
    }
  }
}
