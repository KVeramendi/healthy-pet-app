import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class InternetChecker {
  final _dio = Dio();

  Future<bool> hasInternet() async {
    try {
      if (kIsWeb) {
        const url = 'https://www.google.com/';
        final Response response = await _dio.get(url);
        return response.statusCode == 200;
      } else {
        final list = await InternetAddress.lookup('google.com');
        return list.isNotEmpty && list.first.rawAddress.isNotEmpty;
      }
    } catch (e) {
      debugPrint('Error en solicitud http: ${e.runtimeType}');
      return false;
    }
  }
}
