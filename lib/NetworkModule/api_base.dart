
import 'package:flutter/foundation.dart';

class APIBase{
  static String get baseURL {
    if (kReleaseMode) {
      return "http://151.106.113.253/api/";
      // return "http://20.197.31.247/api/";
    } else {
      return "http://151.106.113.253/api/";
      // return "http://20.197.31.247/api/";
    }

  }

  static String get mainBaseURL {
    if (kReleaseMode) {
      return "http://151.106.113.253/";
      // return "http://20.197.31.247/api/";
    } else {
      return "http://151.106.113.253/";
      // return "http://20.197.31.247/api/";
    }

  }


}