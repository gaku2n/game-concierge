import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:game_concierge/core/config/flavor.dart';
import 'package:game_concierge/core/config/flavor_provider.dart';
import 'package:game_concierge/core/network/interceptors/error_handling_interceptor.dart';
import 'package:game_concierge/core/network/interceptors/logging_interceptor.dart';
import 'package:game_concierge/core/utils/logger.dart';

part 'dio_client.g.dart';

/// Dioインスタンスを提供するプロバイダー
@riverpod
Dio dioClient(Ref ref) {
  final flavor = ref.watch(flavorProvider);
  return DioClient.createDio(flavor);
}

/// HTTPクライアントの設定と生成を行うクラス
class DioClient {
  DioClient._();

  /// Flavorに基づいてDioインスタンスを生成
  static Dio createDio(Flavor flavor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: flavor.apiBaseUrl,
        connectTimeout: flavor.connectTimeout,
        receiveTimeout: flavor.receiveTimeout,
        sendTimeout: flavor.sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // インターセプターの追加
    dio.interceptors.addAll([
      // エラーハンドリングを最初に追加（他のインターセプターより先に実行）
      ErrorHandlingInterceptor(),
      // ロギングは最後に追加（エラーも含めてログ出力）
      LoggingInterceptor(
        logger: logger,
        enableDetailedLog: flavor.enableDetailedLog,
        maskSensitiveData: flavor.maskSensitiveData,
      ),
    ]);

    return dio;
  }
}
