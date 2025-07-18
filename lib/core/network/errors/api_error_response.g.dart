// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiErrorResponse _$ApiErrorResponseFromJson(Map<String, dynamic> json) =>
    _ApiErrorResponse(
      message: json['message'] as String?,
      code: json['code'] as String?,
      details: json['details'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ApiErrorResponseToJson(_ApiErrorResponse instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.details case final value?) 'details': value,
    };
