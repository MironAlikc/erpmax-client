// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutResponseModel {

@JsonKey(name: 'session_id') String get sessionId;@JsonKey(name: 'checkout_url') String get checkoutUrl;
/// Create a copy of CheckoutResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutResponseModelCopyWith<CheckoutResponseModel> get copyWith => _$CheckoutResponseModelCopyWithImpl<CheckoutResponseModel>(this as CheckoutResponseModel, _$identity);

  /// Serializes this CheckoutResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutResponseModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,checkoutUrl);

@override
String toString() {
  return 'CheckoutResponseModel(sessionId: $sessionId, checkoutUrl: $checkoutUrl)';
}


}

/// @nodoc
abstract mixin class $CheckoutResponseModelCopyWith<$Res>  {
  factory $CheckoutResponseModelCopyWith(CheckoutResponseModel value, $Res Function(CheckoutResponseModel) _then) = _$CheckoutResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'checkout_url') String checkoutUrl
});




}
/// @nodoc
class _$CheckoutResponseModelCopyWithImpl<$Res>
    implements $CheckoutResponseModelCopyWith<$Res> {
  _$CheckoutResponseModelCopyWithImpl(this._self, this._then);

  final CheckoutResponseModel _self;
  final $Res Function(CheckoutResponseModel) _then;

/// Create a copy of CheckoutResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? checkoutUrl = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,checkoutUrl: null == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutResponseModel].
extension CheckoutResponseModelPatterns on CheckoutResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'checkout_url')  String checkoutUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutResponseModel() when $default != null:
return $default(_that.sessionId,_that.checkoutUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'checkout_url')  String checkoutUrl)  $default,) {final _that = this;
switch (_that) {
case _CheckoutResponseModel():
return $default(_that.sessionId,_that.checkoutUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'checkout_url')  String checkoutUrl)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutResponseModel() when $default != null:
return $default(_that.sessionId,_that.checkoutUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutResponseModel extends CheckoutResponseModel {
  const _CheckoutResponseModel({@JsonKey(name: 'session_id') required this.sessionId, @JsonKey(name: 'checkout_url') required this.checkoutUrl}): super._();
  factory _CheckoutResponseModel.fromJson(Map<String, dynamic> json) => _$CheckoutResponseModelFromJson(json);

@override@JsonKey(name: 'session_id') final  String sessionId;
@override@JsonKey(name: 'checkout_url') final  String checkoutUrl;

/// Create a copy of CheckoutResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutResponseModelCopyWith<_CheckoutResponseModel> get copyWith => __$CheckoutResponseModelCopyWithImpl<_CheckoutResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutResponseModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,checkoutUrl);

@override
String toString() {
  return 'CheckoutResponseModel(sessionId: $sessionId, checkoutUrl: $checkoutUrl)';
}


}

/// @nodoc
abstract mixin class _$CheckoutResponseModelCopyWith<$Res> implements $CheckoutResponseModelCopyWith<$Res> {
  factory _$CheckoutResponseModelCopyWith(_CheckoutResponseModel value, $Res Function(_CheckoutResponseModel) _then) = __$CheckoutResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'checkout_url') String checkoutUrl
});




}
/// @nodoc
class __$CheckoutResponseModelCopyWithImpl<$Res>
    implements _$CheckoutResponseModelCopyWith<$Res> {
  __$CheckoutResponseModelCopyWithImpl(this._self, this._then);

  final _CheckoutResponseModel _self;
  final $Res Function(_CheckoutResponseModel) _then;

/// Create a copy of CheckoutResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? checkoutUrl = null,}) {
  return _then(_CheckoutResponseModel(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,checkoutUrl: null == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
