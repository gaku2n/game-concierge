// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkException {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkException);
}


@override
int get hashCode => runtimeType.hashCode;



}

/// @nodoc
class $NetworkExceptionCopyWith<$Res>  {
$NetworkExceptionCopyWith(NetworkException _, $Res Function(NetworkException) __);
}


/// @nodoc


class ConnectionTimeout extends NetworkException {
  const ConnectionTimeout(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionTimeout);
}


@override
int get hashCode => runtimeType.hashCode;



}




/// @nodoc


class SendTimeout extends NetworkException {
  const SendTimeout(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendTimeout);
}


@override
int get hashCode => runtimeType.hashCode;



}




/// @nodoc


class ReceiveTimeout extends NetworkException {
  const ReceiveTimeout(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveTimeout);
}


@override
int get hashCode => runtimeType.hashCode;



}




/// @nodoc


class RequestCancel extends NetworkException {
  const RequestCancel(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCancel);
}


@override
int get hashCode => runtimeType.hashCode;



}




/// @nodoc


class BadResponse extends NetworkException {
  const BadResponse({required this.statusCode, this.errorResponse}): super._();
  

 final  int statusCode;
 final  ApiErrorResponse? errorResponse;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadResponseCopyWith<BadResponse> get copyWith => _$BadResponseCopyWithImpl<BadResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadResponse&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.errorResponse, errorResponse) || other.errorResponse == errorResponse));
}


@override
int get hashCode => Object.hash(runtimeType,statusCode,errorResponse);



}

/// @nodoc
abstract mixin class $BadResponseCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $BadResponseCopyWith(BadResponse value, $Res Function(BadResponse) _then) = _$BadResponseCopyWithImpl;
@useResult
$Res call({
 int statusCode, ApiErrorResponse? errorResponse
});


$ApiErrorResponseCopyWith<$Res>? get errorResponse;

}
/// @nodoc
class _$BadResponseCopyWithImpl<$Res>
    implements $BadResponseCopyWith<$Res> {
  _$BadResponseCopyWithImpl(this._self, this._then);

  final BadResponse _self;
  final $Res Function(BadResponse) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? errorResponse = freezed,}) {
  return _then(BadResponse(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,errorResponse: freezed == errorResponse ? _self.errorResponse : errorResponse // ignore: cast_nullable_to_non_nullable
as ApiErrorResponse?,
  ));
}

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiErrorResponseCopyWith<$Res>? get errorResponse {
    if (_self.errorResponse == null) {
    return null;
  }

  return $ApiErrorResponseCopyWith<$Res>(_self.errorResponse!, (value) {
    return _then(_self.copyWith(errorResponse: value));
  });
}
}

/// @nodoc


class ConnectionError extends NetworkException {
  const ConnectionError({required this.message}): super._();
  

 final  String message;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionErrorCopyWith<ConnectionError> get copyWith => _$ConnectionErrorCopyWithImpl<ConnectionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);



}

/// @nodoc
abstract mixin class $ConnectionErrorCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $ConnectionErrorCopyWith(ConnectionError value, $Res Function(ConnectionError) _then) = _$ConnectionErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ConnectionErrorCopyWithImpl<$Res>
    implements $ConnectionErrorCopyWith<$Res> {
  _$ConnectionErrorCopyWithImpl(this._self, this._then);

  final ConnectionError _self;
  final $Res Function(ConnectionError) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ConnectionError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnknownError extends NetworkException {
  const UnknownError({required this.message}): super._();
  

 final  String message;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownErrorCopyWith<UnknownError> get copyWith => _$UnknownErrorCopyWithImpl<UnknownError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);



}

/// @nodoc
abstract mixin class $UnknownErrorCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $UnknownErrorCopyWith(UnknownError value, $Res Function(UnknownError) _then) = _$UnknownErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnknownErrorCopyWithImpl<$Res>
    implements $UnknownErrorCopyWith<$Res> {
  _$UnknownErrorCopyWithImpl(this._self, this._then);

  final UnknownError _self;
  final $Res Function(UnknownError) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnknownError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
