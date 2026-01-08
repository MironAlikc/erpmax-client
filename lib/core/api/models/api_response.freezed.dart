// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ErrorInfo {

 String? get code; String get message; Map<String, dynamic>? get details;
/// Create a copy of ErrorInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorInfoCopyWith<ErrorInfo> get copyWith => _$ErrorInfoCopyWithImpl<ErrorInfo>(this as ErrorInfo, _$identity);

  /// Serializes this ErrorInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorInfo&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.details, details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(details));

@override
String toString() {
  return 'ErrorInfo(code: $code, message: $message, details: $details)';
}


}

/// @nodoc
abstract mixin class $ErrorInfoCopyWith<$Res>  {
  factory $ErrorInfoCopyWith(ErrorInfo value, $Res Function(ErrorInfo) _then) = _$ErrorInfoCopyWithImpl;
@useResult
$Res call({
 String? code, String message, Map<String, dynamic>? details
});




}
/// @nodoc
class _$ErrorInfoCopyWithImpl<$Res>
    implements $ErrorInfoCopyWith<$Res> {
  _$ErrorInfoCopyWithImpl(this._self, this._then);

  final ErrorInfo _self;
  final $Res Function(ErrorInfo) _then;

/// Create a copy of ErrorInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = freezed,Object? message = null,Object? details = freezed,}) {
  return _then(_self.copyWith(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ErrorInfo].
extension ErrorInfoPatterns on ErrorInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ErrorInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ErrorInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ErrorInfo value)  $default,){
final _that = this;
switch (_that) {
case _ErrorInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ErrorInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ErrorInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? code,  String message,  Map<String, dynamic>? details)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ErrorInfo() when $default != null:
return $default(_that.code,_that.message,_that.details);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? code,  String message,  Map<String, dynamic>? details)  $default,) {final _that = this;
switch (_that) {
case _ErrorInfo():
return $default(_that.code,_that.message,_that.details);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? code,  String message,  Map<String, dynamic>? details)?  $default,) {final _that = this;
switch (_that) {
case _ErrorInfo() when $default != null:
return $default(_that.code,_that.message,_that.details);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ErrorInfo implements ErrorInfo {
  const _ErrorInfo({this.code, required this.message, final  Map<String, dynamic>? details}): _details = details;
  factory _ErrorInfo.fromJson(Map<String, dynamic> json) => _$ErrorInfoFromJson(json);

@override final  String? code;
@override final  String message;
 final  Map<String, dynamic>? _details;
@override Map<String, dynamic>? get details {
  final value = _details;
  if (value == null) return null;
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ErrorInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorInfoCopyWith<_ErrorInfo> get copyWith => __$ErrorInfoCopyWithImpl<_ErrorInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ErrorInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorInfo&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._details, _details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(_details));

@override
String toString() {
  return 'ErrorInfo(code: $code, message: $message, details: $details)';
}


}

/// @nodoc
abstract mixin class _$ErrorInfoCopyWith<$Res> implements $ErrorInfoCopyWith<$Res> {
  factory _$ErrorInfoCopyWith(_ErrorInfo value, $Res Function(_ErrorInfo) _then) = __$ErrorInfoCopyWithImpl;
@override @useResult
$Res call({
 String? code, String message, Map<String, dynamic>? details
});




}
/// @nodoc
class __$ErrorInfoCopyWithImpl<$Res>
    implements _$ErrorInfoCopyWith<$Res> {
  __$ErrorInfoCopyWithImpl(this._self, this._then);

  final _ErrorInfo _self;
  final $Res Function(_ErrorInfo) _then;

/// Create a copy of ErrorInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? message = null,Object? details = freezed,}) {
  return _then(_ErrorInfo(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,details: freezed == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$BaseResponse<T> {

 String get status; T? get data; ErrorInfo? get error;
/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseResponseCopyWith<T, BaseResponse<T>> get copyWith => _$BaseResponseCopyWithImpl<T, BaseResponse<T>>(this as BaseResponse<T>, _$identity);

  /// Serializes this BaseResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseResponse<T>&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(data),error);

@override
String toString() {
  return 'BaseResponse<$T>(status: $status, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $BaseResponseCopyWith<T,$Res>  {
  factory $BaseResponseCopyWith(BaseResponse<T> value, $Res Function(BaseResponse<T>) _then) = _$BaseResponseCopyWithImpl;
@useResult
$Res call({
 String status, T? data, ErrorInfo? error
});


$ErrorInfoCopyWith<$Res>? get error;

}
/// @nodoc
class _$BaseResponseCopyWithImpl<T,$Res>
    implements $BaseResponseCopyWith<T, $Res> {
  _$BaseResponseCopyWithImpl(this._self, this._then);

  final BaseResponse<T> _self;
  final $Res Function(BaseResponse<T>) _then;

/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorInfo?,
  ));
}
/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorInfoCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorInfoCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [BaseResponse].
extension BaseResponsePatterns<T> on BaseResponse<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _BaseResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _BaseResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  T? data,  ErrorInfo? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseResponse() when $default != null:
return $default(_that.status,_that.data,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  T? data,  ErrorInfo? error)  $default,) {final _that = this;
switch (_that) {
case _BaseResponse():
return $default(_that.status,_that.data,_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  T? data,  ErrorInfo? error)?  $default,) {final _that = this;
switch (_that) {
case _BaseResponse() when $default != null:
return $default(_that.status,_that.data,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _BaseResponse<T> implements BaseResponse<T> {
  const _BaseResponse({required this.status, this.data, this.error});
  factory _BaseResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$BaseResponseFromJson(json,fromJsonT);

@override final  String status;
@override final  T? data;
@override final  ErrorInfo? error;

/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseResponseCopyWith<T, _BaseResponse<T>> get copyWith => __$BaseResponseCopyWithImpl<T, _BaseResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$BaseResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseResponse<T>&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(data),error);

@override
String toString() {
  return 'BaseResponse<$T>(status: $status, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$BaseResponseCopyWith<T,$Res> implements $BaseResponseCopyWith<T, $Res> {
  factory _$BaseResponseCopyWith(_BaseResponse<T> value, $Res Function(_BaseResponse<T>) _then) = __$BaseResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, T? data, ErrorInfo? error
});


@override $ErrorInfoCopyWith<$Res>? get error;

}
/// @nodoc
class __$BaseResponseCopyWithImpl<T,$Res>
    implements _$BaseResponseCopyWith<T, $Res> {
  __$BaseResponseCopyWithImpl(this._self, this._then);

  final _BaseResponse<T> _self;
  final $Res Function(_BaseResponse<T>) _then;

/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_BaseResponse<T>(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorInfo?,
  ));
}

/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorInfoCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ErrorInfoCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
