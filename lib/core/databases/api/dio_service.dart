import 'package:flutter/foundation.dart';
import 'package:cat_app/core/databases/api/api_constants.dart';
import 'package:cat_app/core/databases/api/api_consumer.dart';
import 'package:cat_app/core/errors/expentions.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService extends ApiConsumer {
  final Dio _dio;
  DioService(this._dio) {
    _initDio();
  }
  void _initDio() {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  @override
  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> patch(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<dynamic> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
