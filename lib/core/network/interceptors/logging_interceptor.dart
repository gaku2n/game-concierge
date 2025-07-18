import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:simple_logger/simple_logger.dart';

/// HTTP通信のログを出力するインターセプター
class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({
    required this.logger,
    this.enableDetailedLog = false,
    this.maskSensitiveData = true,
  });

  final SimpleLogger logger;
  final bool enableDetailedLog;
  final bool maskSensitiveData;

  // センシティブな情報を含む可能性のあるヘッダーキー
  static const _sensitiveHeaders = [
    'authorization',
    'cookie',
    'set-cookie',
    'x-api-key',
    'x-auth-token',
  ];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final buffer = StringBuffer()
      ..writeln('━━━ HTTP Request ━━━')
      ..writeln('${options.method} ${options.uri}');

    // クエリパラメータ
    if (options.queryParameters.isNotEmpty) {
      buffer.writeln('Query: ${options.queryParameters}');
    }

    // ヘッダー（maskSensitiveDataがtrueの場合はマスク）
    if (options.headers.isNotEmpty) {
      final headers = <String, dynamic>{};
      options.headers.forEach((key, value) {
        if (!maskSensitiveData || !_isSensitiveHeader(key)) {
          headers[key] = value;
        } else {
          headers[key] = '***';
        }
      });
      buffer.writeln('Headers: $headers');
    }

    // リクエストボディ（詳細ログ有効時のみ）
    if (enableDetailedLog && options.data != null) {
      try {
        final data = _formatJson(options.data);
        buffer.writeln('Body: $data');
      } on Object {
        buffer.writeln('Body: ${options.data}');
      }
    }

    logger.info(buffer.toString());
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final buffer = StringBuffer()
      ..writeln('━━━ HTTP Response ━━━')
      ..writeln('${response.statusCode} ${response.requestOptions.uri}');

    // レスポンスボディ（詳細ログ有効時のみ）
    if (enableDetailedLog && response.data != null) {
      try {
        final data = _formatJson(response.data);
        buffer.writeln('Body: $data');
      } on Object {
        buffer.writeln('Body: [${response.data.runtimeType}]');
      }
    }

    logger.info(buffer.toString());
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final buffer = StringBuffer()
      ..writeln('━━━ HTTP Error ━━━')
      ..writeln(
        '${err.response?.statusCode ?? 'N/A'} ${err.requestOptions.uri}',
      )
      ..writeln('Type: ${err.type}')
      ..writeln('Message: ${err.message}');

    // エラーレスポンス（詳細ログ有効時のみ）
    if (enableDetailedLog && err.response?.data != null) {
      try {
        final data = _formatJson(err.response!.data);
        buffer.writeln('Response: $data');
      } on Object {
        buffer.writeln('Response: ${err.response!.data}');
      }
    }

    logger.warning(buffer.toString());
    handler.next(err);
  }

  bool _isSensitiveHeader(String key) {
    final lowerKey = key.toLowerCase();
    return _sensitiveHeaders.any(lowerKey.contains);
  }

  String _formatJson(dynamic data) {
    if (data is Map || data is List) {
      return const JsonEncoder.withIndent('  ').convert(data);
    }
    return data.toString();
  }
}
