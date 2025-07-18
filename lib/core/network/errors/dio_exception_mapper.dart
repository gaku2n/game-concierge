import 'package:dio/dio.dart';
import 'package:game_concierge/core/network/errors/api_error_response.dart';
import 'package:game_concierge/core/network/errors/network_exception.dart';

/// DioExceptionを内部のNetworkExceptionに変換するマッパー
class DioExceptionMapper {
  const DioExceptionMapper();

  NetworkException map(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return const NetworkException.connectionTimeout();
      case DioExceptionType.sendTimeout:
        return const NetworkException.sendTimeout();
      case DioExceptionType.receiveTimeout:
        return const NetworkException.receiveTimeout();
      case DioExceptionType.cancel:
        return const NetworkException.requestCancel();
      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode ?? 0;
        final data = exception.response?.data;
        ApiErrorResponse? errorResponse;

        // エラーレスポンスのパース
        if (data is Map<String, dynamic>) {
          try {
            errorResponse = ApiErrorResponse.fromJson(data);
          } on Object {
            // パースに失敗した場合は生データをメッセージとして使用
            errorResponse = ApiErrorResponse(message: data.toString());
          }
        }

        return NetworkException.badResponse(
          statusCode: statusCode,
          errorResponse: errorResponse,
        );
      case DioExceptionType.connectionError:
        return NetworkException.connectionError(
          message: exception.error?.toString() ?? 'Connection error',
        );
      case DioExceptionType.unknown:
        return NetworkException.unknownError(
          message: exception.error?.toString() ?? 'Unknown error',
        );
      case DioExceptionType.badCertificate:
        return const NetworkException.connectionError(
          message: 'Bad certificate',
        );
    }
  }
}
