import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_response.freezed.dart';
part 'api_error_response.g.dart';

/// APIエラーレスポンスのモデル
// TODO: 要変更
@freezed
abstract class ApiErrorResponse with _$ApiErrorResponse {
  const factory ApiErrorResponse({
    String? message,
    String? code,
    Map<String, dynamic>? details,
  }) = _ApiErrorResponse;

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);
}
