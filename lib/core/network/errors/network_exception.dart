import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_concierge/core/network/errors/api_error_response.dart';

part 'network_exception.freezed.dart';

/// ネットワーク関連の例外を表現する統一的なエラー型
@freezed
sealed class NetworkException with _$NetworkException implements Exception {
  const factory NetworkException.connectionTimeout() = ConnectionTimeout;
  const factory NetworkException.sendTimeout() = SendTimeout;
  const factory NetworkException.receiveTimeout() = ReceiveTimeout;
  const factory NetworkException.requestCancel() = RequestCancel;
  const factory NetworkException.badResponse({
    required int statusCode,
    ApiErrorResponse? errorResponse,
  }) = BadResponse;
  const factory NetworkException.connectionError({required String message}) =
      ConnectionError;
  const factory NetworkException.unknownError({required String message}) =
      UnknownError;

  const NetworkException._();

  /// エラーメッセージの取得
  String get message => switch (this) {
    ConnectionTimeout() => 'Connection timeout',
    SendTimeout() => 'Send timeout',
    ReceiveTimeout() => 'Receive timeout',
    RequestCancel() => 'Request cancelled',
    BadResponse(:final statusCode, :final errorResponse) =>
      errorResponse?.message ?? 'Bad response: $statusCode',
    ConnectionError(:final message) => message,
    UnknownError(:final message) => message,
  };

  @override
  String toString() => message;
}
