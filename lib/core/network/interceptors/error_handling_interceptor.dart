import 'package:dio/dio.dart';
import 'package:game_concierge/core/network/errors/dio_exception_mapper.dart';

/// DioExceptionを自動的にNetworkExceptionにマッピングするInterceptor
class ErrorHandlingInterceptor extends Interceptor {
  static const _mapper = DioExceptionMapper();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // DioExceptionをNetworkExceptionにマッピング
    final networkException = _mapper.map(err);

    // 元のDioExceptionのerrorフィールドに変換済みの例外を設定
    final mappedException = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: networkException,
      message: networkException.message,
    );

    // マッピング済みの例外で処理を続行
    handler.next(mappedException);
  }
}
