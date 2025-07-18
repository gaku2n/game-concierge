import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/core/network/errors/dio_exception_mapper.dart';
import 'package:test_app/core/network/errors/network_exception.dart';

void main() {
  group('DioExceptionMapper', () {
    late DioExceptionMapper mapper;

    setUp(() {
      mapper = const DioExceptionMapper();
    });

    test('接続タイムアウトエラーをNetworkExceptionに変換する', () {
      // Arrange
      final dioError = DioException(
        type: DioExceptionType.connectionTimeout,
        requestOptions: RequestOptions(path: '/test'),
      );

      // Act
      final result = mapper.map(dioError);

      // Assert
      expect(result, isA<NetworkException>());
      expect(result, isA<ConnectionTimeout>());
    });

    test('不正なレスポンス（404）をNetworkExceptionに変換する', () {
      // Arrange
      final response = Response(
        statusCode: 404,
        data: {'message': 'Not Found', 'code': 'RESOURCE_NOT_FOUND'},
        requestOptions: RequestOptions(path: '/test'),
      );
      final dioError = DioException(
        type: DioExceptionType.badResponse,
        response: response,
        requestOptions: RequestOptions(path: '/test'),
      );

      // Act
      final result = mapper.map(dioError);

      // Assert
      expect(result, isA<NetworkException>());
      expect(result, isA<BadResponse>());
      final badResponse = result as BadResponse;
      expect(badResponse.statusCode, 404);
      expect(badResponse.errorResponse?.message, 'Not Found');
      expect(badResponse.errorResponse?.code, 'RESOURCE_NOT_FOUND');
    });

    test('接続エラーをNetworkExceptionに変換する', () {
      // Arrange
      final dioError = DioException(
        type: DioExceptionType.connectionError,
        error: 'Network is unreachable',
        requestOptions: RequestOptions(path: '/test'),
      );

      // Act
      final result = mapper.map(dioError);

      // Assert
      expect(result, isA<NetworkException>());
      expect(result, isA<ConnectionError>());
      final connectionError = result as ConnectionError;
      expect(connectionError.message, 'Network is unreachable');
    });

    test('不明なエラーをNetworkExceptionに変換する', () {
      // Arrange
      final dioError = DioException(
        type: DioExceptionType.unknown,
        error: 'Something went wrong',
        requestOptions: RequestOptions(path: '/test'),
      );

      // Act
      final result = mapper.map(dioError);

      // Assert
      expect(result, isA<NetworkException>());
      expect(result, isA<UnknownError>());
      final unknownError = result as UnknownError;
      expect(unknownError.message, 'Something went wrong');
    });

    test('エラーレスポンスのJSONをApiErrorResponseに変換する', () {
      // Arrange
      final response = Response(
        statusCode: 400,
        data: {
          'message': 'Validation failed',
          'code': 'VALIDATION_ERROR',
          'details': {'field': 'email', 'error': 'Invalid format'},
        },
        requestOptions: RequestOptions(path: '/test'),
      );
      final dioError = DioException(
        type: DioExceptionType.badResponse,
        response: response,
        requestOptions: RequestOptions(path: '/test'),
      );

      // Act
      final result = mapper.map(dioError);

      // Assert
      expect(result, isA<BadResponse>());
      final badResponse = result as BadResponse;
      expect(badResponse.statusCode, 400);
      expect(badResponse.errorResponse?.message, 'Validation failed');
      expect(badResponse.errorResponse?.code, 'VALIDATION_ERROR');
      expect(badResponse.errorResponse?.details, {
        'field': 'email',
        'error': 'Invalid format',
      });
    });
  });
}
