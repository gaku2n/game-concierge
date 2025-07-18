import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_concierge/core/network/interceptors/logging_interceptor.dart';
import 'package:simple_logger/simple_logger.dart';

// Mock ErrorInterceptorHandler
class _MockErrorInterceptorHandler extends ErrorInterceptorHandler {
  @override
  void next(DioException err) {
    // Do nothing - avoid throwing InterceptorState
  }
}

void main() {
  group('LoggingInterceptor', () {
    late LoggingInterceptor interceptor;
    late SimpleLogger logger;
    late List<String> logMessages;
    late Level? logLevel;

    setUp(() {
      logMessages = [];
      logLevel = null;

      logger = SimpleLogger()
        ..setLevel(Level.FINEST)
        ..onLogged = (log, info) {
          logMessages.add(log);
          logLevel = info.level;
        };

      interceptor = LoggingInterceptor(logger: logger, enableDetailedLog: true);
    });

    test('リクエスト情報をログ出力する', () async {
      // Arrange
      final options = RequestOptions(
        path: '/users/1',
        method: 'GET',
        baseUrl: 'https://api.example.com',
        queryParameters: {'lang': 'ja'},
        headers: {'Authorization': 'Bearer token123'},
      );
      final handler = RequestInterceptorHandler();

      // Act
      interceptor.onRequest(options, handler);

      // Assert
      expect(logMessages.length, greaterThan(0));
      expect(logMessages.any((log) => log.contains('GET')), true);
      expect(logMessages.any((log) => log.contains('/users/1')), true);
      expect(logMessages.any((log) => log.contains('lang=ja')), true);
    });

    test('詳細ログ無効時はヘッダー情報をマスクする', () async {
      // Arrange
      interceptor = LoggingInterceptor(
        logger: logger,
      );

      final options = RequestOptions(
        path: '/users/1',
        method: 'GET',
        baseUrl: 'https://api.example.com',
        headers: {'Authorization': 'Bearer sensitive_token'},
      );
      final handler = RequestInterceptorHandler();

      // Act
      interceptor.onRequest(options, handler);

      // Assert
      expect(logMessages.any((log) => log.contains('sensitive_token')), false);
      expect(logMessages.any((log) => log.contains('***')), true);
    });

    test('レスポンス情報をログ出力する', () async {
      // Arrange
      final response = Response(
        requestOptions: RequestOptions(path: '/users/1'),
        statusCode: 200,
        data: {'id': 1, 'name': 'Test User'},
      );
      final handler = ResponseInterceptorHandler();

      // Act
      interceptor.onResponse(response, handler);

      // Assert
      expect(logMessages.length, greaterThan(0));
      expect(logMessages.any((log) => log.contains('200')), true);
      expect(logMessages.any((log) => log.contains('/users/1')), true);
    });

    test('エラー情報をログ出力する', () async {
      // Arrange
      logMessages.clear(); // 前のテストのログをクリア
      final requestOptions = RequestOptions(path: '/users/999');
      final error = DioException(
        requestOptions: requestOptions,
        response: Response(
          requestOptions: requestOptions,
          statusCode: 404,
          data: {'error': 'Not Found'},
        ),
        type: DioExceptionType.badResponse,
      );

      // Mock ErrorInterceptorHandler
      final handler = _MockErrorInterceptorHandler();

      // Act
      interceptor.onError(error, handler);

      // Assert
      expect(logMessages.length, greaterThan(0));
      expect(logMessages.any((log) => log.contains('404')), true);
      expect(logMessages.any((log) => log.contains('/users/999')), true);
      expect(logLevel, Level.WARNING);
    });

    test('詳細ログ無効時は最小限の情報のみ出力する', () async {
      // Arrange
      interceptor = LoggingInterceptor(
        logger: logger,
      );

      final response = Response(
        requestOptions: RequestOptions(path: '/users/1'),
        statusCode: 200,
        data: {
          'id': 1,
          'name': 'Test User',
          'email': 'test@example.com',
          'password': 'should_not_log_this',
        },
      );
      final handler = ResponseInterceptorHandler();

      // Act
      interceptor.onResponse(response, handler);

      // Assert
      expect(
        logMessages.any((log) => log.contains('should_not_log_this')),
        false,
      );
      expect(logMessages.any((log) => log.contains('200')), true);
    });
  });
}
