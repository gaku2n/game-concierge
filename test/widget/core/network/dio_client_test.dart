import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/core/config/flavor.dart';
import 'package:test_app/core/config/flavor_provider.dart';
import 'package:test_app/core/network/dio_client.dart';
import 'package:test_app/core/network/interceptors/logging_interceptor.dart';

void main() {
  group('DioClient', () {
    test('Dioインスタンスを生成できる', () {
      // Arrange
      const flavor = Flavor.dev;

      // Act
      final dio = DioClient.createDio(flavor);

      // Assert
      expect(dio, isA<Dio>());
      expect(dio.options.baseUrl, 'https://jsonplaceholder.typicode.com');
      expect(dio.options.connectTimeout, const Duration(seconds: 10));
      expect(dio.options.receiveTimeout, const Duration(seconds: 30));
      expect(dio.options.sendTimeout, const Duration(seconds: 30));
    });

    test('共通ヘッダーが設定される', () {
      // Arrange
      const flavor = Flavor.dev;

      // Act
      final dio = DioClient.createDio(flavor);

      // Assert
      expect(dio.options.headers['Content-Type'], 'application/json');
      expect(dio.options.headers['Accept'], 'application/json');
    });

    test('LoggingInterceptorが追加される', () {
      // Arrange
      const flavor = Flavor.dev;

      // Act
      final dio = DioClient.createDio(flavor);

      // Assert
      expect(dio.interceptors.any((i) => i is LoggingInterceptor), true);
    });

    test('環境別のログレベルが適用される', () {
      // Arrange & Act
      final devDio = DioClient.createDio(Flavor.dev);
      final prodDio = DioClient.createDio(Flavor.prod);

      // Assert
      final devInterceptor = devDio.interceptors
          .whereType<LoggingInterceptor>()
          .first;
      final prodInterceptor = prodDio.interceptors
          .whereType<LoggingInterceptor>()
          .first;

      expect(devInterceptor.enableDetailedLog, true);
      expect(prodInterceptor.enableDetailedLog, false);
    });
  });

  group('dioClientProvider', () {
    test('プロバイダーからDioインスタンスを取得できる', () {
      // Arrange
      final container = ProviderContainer(
        overrides: [flavorProvider.overrideWithValue(Flavor.dev)],
      );

      // Act
      final dio = container.read(dioClientProvider);

      // Assert
      expect(dio, isA<Dio>());
      expect(dio.options.baseUrl, 'https://jsonplaceholder.typicode.com');

      // Cleanup
      container.dispose();
    });

    test('Flavor変更時に新しいDioインスタンスが生成される', () {
      // Arrange
      final container = ProviderContainer(
        overrides: [flavorProvider.overrideWithValue(Flavor.dev)],
      );

      // Act
      final devDio = container.read(dioClientProvider);

      // Flavorを変更
      container.updateOverrides([
        flavorProvider.overrideWithValue(Flavor.prod),
      ]);

      final prodDio = container.read(dioClientProvider);

      // Assert
      expect(devDio, isNot(same(prodDio)));

      final devInterceptor = devDio.interceptors
          .whereType<LoggingInterceptor>()
          .first;
      final prodInterceptor = prodDio.interceptors
          .whereType<LoggingInterceptor>()
          .first;

      expect(devInterceptor.enableDetailedLog, true);
      expect(prodInterceptor.enableDetailedLog, false);

      // Cleanup
      container.dispose();
    });
  });
}
