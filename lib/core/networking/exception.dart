import 'package:dio/dio.dart';

class DioExceptionHandle implements Exception {
  final String message;

  DioExceptionHandle._(this.message);

  factory DioExceptionHandle.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionError:
        return DioExceptionHandle._(
          "Connection failed due to internet connection",
        );

      case DioExceptionType.badResponse:
        final statusCode = dioError.response?.statusCode ?? 0;
        final errorData = dioError.response?.data;
        return DioExceptionHandle._(_handleError(statusCode, errorData));

      default:
        return DioExceptionHandle._("Something went wrong");
    }
  }

  static String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 500:
        return error['message'] ?? "Internal server error";
      case 401:
        return error['message'] ?? "Unauthorized Access";
      case 400:
        return error['message'] ?? "Bad Request";
      default:
        return "Something went wrong";
    }
  }

  @override
  String toString() => message;
}
