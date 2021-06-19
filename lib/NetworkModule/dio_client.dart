// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:my_guardian/Providers/global_provider.dart';
// import 'package:provider/provider.dart';
// import 'api_base.dart';
// import 'api_exception.dart';
// import 'api_response.dart';
//
// class DioClient {
//   static final DioClient _singleton = DioClient();
//
//   static DioClient get instance => _singleton;
//
//   Future<CustomResponse> fetchData(BuildContext context, String url, {Map<String, String> params}) async {
//     CustomResponse responseJson;
//     Provider.of<GlobalProvider>(context, listen: false).setIsBusy(true, null);
//     try {
//       final response = await Dio().get(APIBase.baseURL + url);
//       print("the response:: " + response.statusCode.toString());
//       responseJson = _returnResponse(response);
//     } catch(e) {
//       print(e.toString());
//     }
//     Provider.of<GlobalProvider>(context, listen: false).setIsBusy(false, responseJson?.Error);
//     return responseJson;
//   }
//
//
//   Future<CustomResponse> postData(BuildContext context, String url, dynamic body) async {
//     // Provider.of<GlobalProvider>(context, listen: false).setIsBusy(true);
//     var responseJson;
//     try {
//       final response = await Dio(APIBase.networkOptions).post(url, data: body);
//       responseJson = _returnResponse(response);
//     } catch(e) {
//       responseJson = CustomResponse(Data: null, Status: 0, Error: "Internal Error: " + e.message.toString());
//     }
//     // Provider.of<GlobalProvider>(context, listen: false).setIsBusy(false);
//     return responseJson;
//   }
//
//
//   CustomResponse _returnResponse(Response response) {
//     switch (response.statusCode) {
//       case 200:
//         CustomResponse res = CustomResponse.fromJson(response.data);
//         return res;
//       case 400:
//         return CustomResponse(Data: null, Status: 0, Error: "Bad Request: " + response.data.toString());
//       case 401:
//       case 403:
//         return CustomResponse(Data: null, Status: 0, Error: "Unauthorized: " + response.data.toString());
//       case 500:
//       default:
//         try{
//           return  CustomResponse.fromJson(response.data);
//         }catch(e){
//           return CustomResponse(Data: null, Status: 0, Error: "Server Error: " + response.data.toString());
//         }
//
//     }
//   }
// }
