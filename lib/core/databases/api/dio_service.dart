import 'package:cat_app/core/databases/api/api_constants.dart';
import 'package:cat_app/core/databases/api/api_consumer.dart';
import 'package:cat_app/core/errors/error_model.dart';
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
    _dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ]);
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
    Response<dynamic> response = await _dio.get(path);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw ServerException(ErrorModel.fromJson(response.data));
      }
    } on Exception catch (e) {
      if (e is DioException) {
        handleDioException(e);
      } else {
        throw UnknownException(
          ErrorModel(errorMessage: e.toString(), status: 500),
        );
      }
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
