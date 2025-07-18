// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiErrorResponse {

 String? get message; String? get code; Map<String, dynamic>? get details;
/// Create a copy of ApiErrorResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiErrorResponseCopyWith<ApiErrorResponse> get copyWith => _$ApiErrorResponseCopyWithImpl<ApiErrorResponse>(this as ApiErrorResponse, _$identity);

  /// Serializes this ApiErrorResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiErrorResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.details, details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(details));

@override
String toString() {
  return 'ApiErrorResponse(message: $message, code: $code, details: $details)';
}


}

/// @nodoc
abstract mixin class $ApiErrorResponseCopyWith<$Res>  {
  factory $ApiErrorResponseCopyWith(ApiErrorResponse value, $Res Function(ApiErrorResponse) _then) = _$ApiErrorResponseCopyWithImpl;
@useResult
$Res call({
 String? message, String? code, Map<String, dynamic>? details
});




}
/// @nodoc
class _$ApiErrorResponseCopyWithImpl<$Res>
    implements $ApiErrorResponseCopyWith<$Res> {
  _$ApiErrorResponseCopyWithImpl(this._self, this._then);

  final ApiErrorResponse _self;
  final $Res Function(ApiErrorResponse) _then;

/// Create a copy of ApiErrorResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? code = freezed,Object? details = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ApiErrorResponse implements ApiErrorResponse {
  const _ApiErrorResponse({this.message, this.code, final  Map<String, dynamic>? details}): _details = details;
  factory _ApiErrorResponse.fromJson(Map<String, dynamic> json) => _$ApiErrorResponseFromJson(json);

@override final  String? message;
@override final  String? code;
 final  Map<String, dynamic>? _details;
@override Map<String, dynamic>? get details {
  final value = _details;
  if (value == null) return null;
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ApiErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiErrorResponseCopyWith<_ApiErrorResponse> get copyWith => __$ApiErrorResponseCopyWithImpl<_ApiErrorResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiErrorResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiErrorResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other._details, _details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(_details));

@override
String toString() {
  return 'ApiErrorResponse(message: $message, code: $code, details: $details)';
}


}

/// @nodoc
abstract mixin class _$ApiErrorResponseCopyWith<$Res> implements $ApiErrorResponseCopyWith<$Res> {
  factory _$ApiErrorResponseCopyWith(_ApiErrorResponse value, $Res Function(_ApiErrorResponse) _then) = __$ApiErrorResponseCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? code, Map<String, dynamic>? details
});




}
/// @nodoc
class __$ApiErrorResponseCopyWithImpl<$Res>
    implements _$ApiErrorResponseCopyWith<$Res> {
  __$ApiErrorResponseCopyWithImpl(this._self, this._then);

  final _ApiErrorResponse _self;
  final $Res Function(_ApiErrorResponse) _then;

/// Create a copy of ApiErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? code = freezed,Object? details = freezed,}) {
  return _then(_ApiErrorResponse(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
