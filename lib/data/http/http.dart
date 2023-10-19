import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/either.dart';
import '../../presentation/core/environment/environment.dart';
import '../../presentation/core/utils/formatters/formatters.dart';

part 'http_failure.dart';
part 'logs.dart';

enum HttpMethod { get, post, put, patch, delete }

class Http {
  Dio _dio;
  String? _token;
  Http({required Dio dio, required String? token})
      : _dio = dio,
        _token = token;

  Future<Either<HttpFailure, R>> request<R>(
    String path, {
    Map<String, String> queryParameters = const {},
    String contentType = Headers.jsonContentType,
    dynamic data = const {},
    Map<String, String> headers = const {},
    HttpMethod method = HttpMethod.get,
    required R Function(dynamic responseBody) onSuccess,
  }) async {
    Map<String, dynamic> logs = {};
    StackTrace? stackTrace;
    String baseUrl = MyEnviroment.host;
    try {
      _dio = Dio(BaseOptions(
        baseUrl: path.startsWith('http') ? '' : baseUrl,
        queryParameters: queryParameters,
        headers: _token != null
            ? {'Authorization': 'Token $_token', ...headers}
            : headers,
        responseType: ResponseType.json,
        contentType: contentType,
        validateStatus: (_) => true,
      ));
      late final Response response;
      logs = {
        'path': path,
        'method': method.name,
        'queryParameters': queryParameters,
        'data': data is FormData ? Formatters.mapFormat(data) : data,
        'startTime': DateTime.now().toIso8601String(),
      };
      switch (method) {
        case HttpMethod.get:
          response = await _dio.get(path, data: data);
        case HttpMethod.post:
          response = await _dio.post(path, data: data);
        case HttpMethod.put:
          response = await _dio.put(path, data: data);
        case HttpMethod.patch:
          response = await _dio.patch(path, data: data);
        case HttpMethod.delete:
          response = await _dio.delete(path, data: data);
      }
      final int? statusCode = response.statusCode;
      logs = {
        ...logs,
        'statusCode': statusCode,
        'data': data is FormData ? Formatters.mapFormat(data) : data,
        'responseBody': response.data,
      };
      if (statusCode! >= 200 && statusCode < 300) {
        return Either.right(onSuccess(response.data));
      }
      return Either.left(HttpFailure(statusCode: statusCode));
    } catch (e, s) {
      stackTrace = s;
      logs = {
        ...logs,
        'exception': e.runtimeType.toString(),
      };
      if (e is SocketException || e is DioException) {
        logs = {
          ...logs,
          'exception': 'NetworkException',
        };
        return Either.left(HttpFailure(exception: NetworkException()));
      }
      return Either.left(HttpFailure(exception: e));
    } finally {
      logs = {
        ...logs,
        'endTime': DateTime.now().toIso8601String(),
      };
      _printLogs(logs, stackTrace);
    }
  }
}
