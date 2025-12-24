// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutResponseEntity {

 String get sessionId; String get checkoutUrl;
/// Create a copy of CheckoutResponseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutResponseEntityCopyWith<CheckoutResponseEntity> get copyWith => _$CheckoutResponseEntityCopyWithImpl<CheckoutResponseEntity>(this as CheckoutResponseEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutResponseEntity&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,checkoutUrl);

@override
String toString() {
  return 'CheckoutResponseEntity(sessionId: $sessionId, checkoutUrl: $checkoutUrl)';
}


}

/// @nodoc
abstract mixin class $CheckoutResponseEntityCopyWith<$Res>  {
  factory $CheckoutResponseEntityCopyWith(CheckoutResponseEntity value, $Res Function(CheckoutResponseEntity) _then) = _$CheckoutResponseEntityCopyWithImpl;
@useResult
$Res call({
 String sessionId, String checkoutUrl
});




}
/// @nodoc
class _$CheckoutResponseEntityCopyWithImpl<$Res>
    implements $CheckoutResponseEntityCopyWith<$Res> {
  _$CheckoutResponseEntityCopyWithImpl(this._self, this._then);

  final CheckoutResponseEntity _self;
  final $Res Function(CheckoutResponseEntity) _then;

/// Create a copy of CheckoutResponseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? checkoutUrl = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,checkoutUrl: null == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutResponseEntity].
extension CheckoutResponseEntityPatterns on CheckoutResponseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutResponseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutResponseEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutResponseEntity value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutResponseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutResponseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutResponseEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  String checkoutUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutResponseEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  String checkoutUrl)  $default,) {final _that = this;
switch (_that) {
case _CheckoutResponseEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  String checkoutUrl)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutResponseEntity() when $default != null:
return $default(_that.sessionId,_that.checkoutUrl);case _:
  return null;

}
}

}

/// @nodoc


class _CheckoutResponseEntity implements CheckoutResponseEntity {
  const _CheckoutResponseEntity({required this.sessionId, required this.checkoutUrl});
  

@override final  String sessionId;
@override final  String checkoutUrl;

/// Create a copy of CheckoutResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutResponseEntityCopyWith<_CheckoutResponseEntity> get copyWith => __$CheckoutResponseEntityCopyWithImpl<_CheckoutResponseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutResponseEntity&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,checkoutUrl);

@override
String toString() {
  return 'CheckoutResponseEntity(sessionId: $sessionId, checkoutUrl: $checkoutUrl)';
}


}

/// @nodoc
abstract mixin class _$CheckoutResponseEntityCopyWith<$Res> implements $CheckoutResponseEntityCopyWith<$Res> {
  factory _$CheckoutResponseEntityCopyWith(_CheckoutResponseEntity value, $Res Function(_CheckoutResponseEntity) _then) = __$CheckoutResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, String checkoutUrl
});




}
/// @nodoc
class __$CheckoutResponseEntityCopyWithImpl<$Res>
    implements _$CheckoutResponseEntityCopyWith<$Res> {
  __$CheckoutResponseEntityCopyWithImpl(this._self, this._then);

  final _CheckoutResponseEntity _self;
  final $Res Function(_CheckoutResponseEntity) _then;

/// Create a copy of CheckoutResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? checkoutUrl = null,}) {
  return _then(_CheckoutResponseEntity(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,checkoutUrl: null == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
