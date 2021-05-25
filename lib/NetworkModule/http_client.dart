import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:my_guardian/Providers/global_provider.dart';
import 'api_base.dart';
import 'package:provider/provider.dart';
import 'api_exception.dart';
import 'api_response.dart';

class HttpClient {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;

  Future<CustomResponse> fetchData(BuildContext context, String url, {Map<String, String> params}) async {
    CustomResponse responseJson;
    Provider.of<GlobalProvider>(context, listen: false).setIsBusy(true, null);
    var uri = APIBase.baseURL + url + ((params != null) ? this.queryParameters(params) : "");
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response = await http.get(Uri.parse(uri), headers: header);
      responseJson = _returnResponse(response);
    }catch(e){
      responseJson = CustomResponse(Data: null, Status: 0, Error: "Internal Error: " + e.message.toString());
    }
    Provider.of<GlobalProvider>(context, listen: false).setIsBusy(false, responseJson.Error);
    return responseJson;
  }

  String queryParameters(Map<String, String> params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
  }

  Future<CustomResponse> postData(BuildContext context, String url, dynamic body) async {
    Provider.of<GlobalProvider>(context, listen: false).setIsBusy(true, null);
    var responseJson;
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response = await http.post(Uri.parse(APIBase.baseURL + url), body: body, headers: header);
      responseJson = _returnResponse(response);
    }catch(e){
      responseJson = CustomResponse(Data: null, Status: 0, Error: "Internal Error: " + e.message.toString());
    }
    if (responseJson.Error != null){
      Provider.of<GlobalProvider>(context, listen: false).setIsBusy(false, responseJson.Error);
    }
    return responseJson;
  }





  CustomResponse _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        CustomResponse res = CustomResponse.fromJson(json.decode(response.body));
        return res;
      case 400:
        return CustomResponse(Data: null, Status: 0, Error: "Bad Request: " + response.body.toString());
      case 401:
      case 403:
      return CustomResponse(Data: null, Status: 0, Error: "Unauthorized: " + response.body.toString());
      case 500:
      default:
        try{
          return  CustomResponse.fromJson(json.decode(response.body));
        }catch(e){
          return CustomResponse(Data: null, Status: 0, Error: "Server Error: " + response.body.toString());
        }

    }
  }
}
