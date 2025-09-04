import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_const.dart';
import 'exception.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: ApiConst.baseUrl,
              headers: {'Content-Type': 'application/json'},
            ),
          ) {
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  Future<dynamic> get(String path, {Map<String, dynamic>? query}) async {
    try {
      final response = await _dio.get(path, queryParameters: query);
      return response.data;
    } on DioException catch (e) {
      throw DioExceptionHandle.fromDioError(e);
    }
  }

  Future<dynamic> post(
    String path, {
    dynamic data,
    bool isFormData = false,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
      );
      return response.data;
    } on DioException catch (e) {
      throw DioExceptionHandle.fromDioError(e);
    }
  }

  Future<dynamic> put(String path, {dynamic data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return response.data;
    } on DioException catch (e) {
      throw DioExceptionHandle.fromDioError(e);
    }
  }

  Future<dynamic> patch(
    String path, {
    dynamic data,
    bool isFormData = false,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
      );
      return response.data;
    } on DioException catch (e) {
      throw DioExceptionHandle.fromDioError(e);
    }
  }

  Future<dynamic> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return response.data;
    } on DioException catch (e) {
      throw DioExceptionHandle.fromDioError(e);
    }
  }
}
