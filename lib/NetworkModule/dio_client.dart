import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'api_base.dart';
import 'api_exception.dart';

class DioClient {
  static final Dio _singleton = Dio(APIBase.options);

  static Dio get instance => _singleton;

  Future<dynamic> fetchData(String url, {Map<String, String> params}) async {
    var responseJson;
    try {
      final response = await Dio().get(url, queryParameters: params);
      printResponse(response);
      responseJson = _returnResponse(response);
    } catch(e) {
      throw FetchDataException(e.message);
    }
    return responseJson;
  }


  Future<dynamic> postData(String url, dynamic body) async {
    var responseJson;
    try {
      final response = await Dio().post(url, data: body);
      responseJson = _returnResponse(response);
    } catch(e) {
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  Future<dynamic> sendFiles(String url, dynamic body) async {
    var responseJson;
    try {
      final response =
      await Dio().post(url, data: body);
      responseJson = _returnResponse(response);
    } catch(e) {
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.data.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  void printResponse(Response response) {
    print(response);
    print(response.data);
    print(response.statusCode);
    print(response.statusMessage);
  }
}
