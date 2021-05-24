
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class APIBase{
  static String get baseURL {
    if (kReleaseMode) {
      return "prod url here";
    } else {
      return "http://20.197.31.247/api/";
    }

  }

  static final options = BaseOptions(
    baseUrl: baseURL,
    // connectTimeout: 5000,
    // receiveTimeout: 3000,
      headers:{
        Headers.contentTypeHeader: 'application/json',
      }
  );

}