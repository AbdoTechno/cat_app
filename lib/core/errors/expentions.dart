
import 'package:dio/dio.dart';
import 'error_model.dart';

//! Base Exceptions

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException(this.errorModel);

  @override
  String toString() => errorModel.errorMessage;
}

class CacheException implements Exception {
  final String errorMessage;

  CacheException({required this.errorMessage});

  @override
  String toString() => errorMessage;
}

//! Network Exceptions

class BadCertificateException extends ServerException {
  BadCertificateException(super.errorModel);
}

class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException(super.errorModel);
}

class ReceiveTimeoutException extends ServerException {
  ReceiveTimeoutException(super.errorModel);
}

class SendTimeoutException extends ServerException {
  SendTimeoutException(super.errorModel);
}

class ConnectionErrorException extends ServerException {
  ConnectionErrorException(super.errorModel);
}

class CancelException extends ServerException {
  CancelException(super.errorModel);
}

class UnknownException extends ServerException {
  UnknownException(super.errorModel);
}

//! HTTP Exceptions

class BadResponseException extends ServerException {
  BadResponseException(super.errorModel);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException(super.errorModel);
}

class ForbiddenException extends ServerException {
  ForbiddenException(super.errorModel);
}

class NotFoundException extends ServerException {
  NotFoundException(super.errorModel);
}

class ConflictException extends ServerException {
  ConflictException(super.errorModel);
}

class TooManyRequestsException extends ServerException {
  TooManyRequestsException(super.errorModel);
}

//! Dio Exception Handler

void handleDioException(DioException exception) {
  final errorModel = _createErrorModel(exception);

  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(errorModel);

    case DioExceptionType.sendTimeout:
      throw SendTimeoutException(errorModel);

    case DioExceptionType.receiveTimeout:
      throw ReceiveTimeoutException(errorModel);

    case DioExceptionType.badCertificate:
      throw BadCertificateException(errorModel);

    case DioExceptionType.connectionError:
      throw ConnectionErrorException(errorModel);

    case DioExceptionType.cancel:
      throw CancelException(errorModel);

    case DioExceptionType.badResponse:
      _handleBadResponse(exception, errorModel);

    case DioExceptionType.transformTimeout:
    case DioExceptionType.unknown:
      throw UnknownException(errorModel);
  }
}

//! HTTP Status Code Handler

Never _handleBadResponse(
  DioException exception,
  ErrorModel errorModel,
) {
  switch (exception.response?.statusCode) {
    case 400:
      throw BadResponseException(errorModel);

    case 401:
      throw UnauthorizedException(errorModel);

    case 403:
      throw ForbiddenException(errorModel);

    case 404:
      throw NotFoundException(errorModel);

    case 409:
      throw ConflictException(errorModel);

    case 429:
      throw TooManyRequestsException(errorModel);

    default:
      throw ServerException(errorModel);
  }
}

//! Error Model Parser

ErrorModel _createErrorModel(DioException exception) {
  final statusCode = exception.response?.statusCode ?? 500;
  final responseData = exception.response?.data;

  if (responseData is Map) {
    try {
      return ErrorModel.fromJson(
        Map<String, dynamic>.from(responseData),
      );
    } catch (_) {
      // Fall back to a generic error model.
    }
  }

  return ErrorModel(
    status: statusCode,
    errorMessage: _getErrorMessage(exception),
  );
}

//! Error Message Handler

String _getErrorMessage(DioException exception) {
  final responseData = exception.response?.data;

  if (responseData is String && responseData.isNotEmpty) {
    return responseData;
  }

  if (exception.message != null && exception.message!.isNotEmpty) {
    return exception.message!;
  }

  return 'Something went wrong. Please try again.';
}
