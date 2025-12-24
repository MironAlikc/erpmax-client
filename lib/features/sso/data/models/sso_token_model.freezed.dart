// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sso_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SSOTokenModel {

@JsonKey(name: 'sso_url') String get ssoUrl; String get token;@JsonKey(name: 'expires_at') DateTime get expiresAt;
/// Create a copy of SSOTokenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SSOTokenModelCopyWith<SSOTokenModel> get copyWith => _$SSOTokenModelCopyWithImpl<SSOTokenModel>(this as SSOTokenModel, _$identity);

  /// Serializes this SSOTokenModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SSOTokenModel&&(identical(other.ssoUrl, ssoUrl) || other.ssoUrl == ssoUrl)&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ssoUrl,token,expiresAt);

@override
String toString() {
  return 'SSOTokenModel(ssoUrl: $ssoUrl, token: $token, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $SSOTokenModelCopyWith<$Res>  {
  factory $SSOTokenModelCopyWith(SSOTokenModel value, $Res Function(SSOTokenModel) _then) = _$SSOTokenModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'sso_url') String ssoUrl, String token,@JsonKey(name: 'expires_at') DateTime expiresAt
});




}
/// @nodoc
class _$SSOTokenModelCopyWithImpl<$Res>
    implements $SSOTokenModelCopyWith<$Res> {
  _$SSOTokenModelCopyWithImpl(this._self, this._then);

  final SSOTokenModel _self;
  final $Res Function(SSOTokenModel) _then;

/// Create a copy of SSOTokenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ssoUrl = null,Object? token = null,Object? expiresAt = null,}) {
  return _then(_self.copyWith(
ssoUrl: null == ssoUrl ? _self.ssoUrl : ssoUrl // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SSOTokenModel].
extension SSOTokenModelPatterns on SSOTokenModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SSOTokenModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SSOTokenModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SSOTokenModel value)  $default,){
final _that = this;
switch (_that) {
case _SSOTokenModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SSOTokenModel value)?  $default,){
final _that = this;
switch (_that) {
case _SSOTokenModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'sso_url')  String ssoUrl,  String token, @JsonKey(name: 'expires_at')  DateTime expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SSOTokenModel() when $default != null:
return $default(_that.ssoUrl,_that.token,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'sso_url')  String ssoUrl,  String token, @JsonKey(name: 'expires_at')  DateTime expiresAt)  $default,) {final _that = this;
switch (_that) {
case _SSOTokenModel():
return $default(_that.ssoUrl,_that.token,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'sso_url')  String ssoUrl,  String token, @JsonKey(name: 'expires_at')  DateTime expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _SSOTokenModel() when $default != null:
return $default(_that.ssoUrl,_that.token,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SSOTokenModel extends SSOTokenModel {
  const _SSOTokenModel({@JsonKey(name: 'sso_url') required this.ssoUrl, required this.token, @JsonKey(name: 'expires_at') required this.expiresAt}): super._();
  factory _SSOTokenModel.fromJson(Map<String, dynamic> json) => _$SSOTokenModelFromJson(json);

@override@JsonKey(name: 'sso_url') final  String ssoUrl;
@override final  String token;
@override@JsonKey(name: 'expires_at') final  DateTime expiresAt;

/// Create a copy of SSOTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SSOTokenModelCopyWith<_SSOTokenModel> get copyWith => __$SSOTokenModelCopyWithImpl<_SSOTokenModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SSOTokenModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SSOTokenModel&&(identical(other.ssoUrl, ssoUrl) || other.ssoUrl == ssoUrl)&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ssoUrl,token,expiresAt);

@override
String toString() {
  return 'SSOTokenModel(ssoUrl: $ssoUrl, token: $token, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$SSOTokenModelCopyWith<$Res> implements $SSOTokenModelCopyWith<$Res> {
  factory _$SSOTokenModelCopyWith(_SSOTokenModel value, $Res Function(_SSOTokenModel) _then) = __$SSOTokenModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'sso_url') String ssoUrl, String token,@JsonKey(name: 'expires_at') DateTime expiresAt
});




}
/// @nodoc
class __$SSOTokenModelCopyWithImpl<$Res>
    implements _$SSOTokenModelCopyWith<$Res> {
  __$SSOTokenModelCopyWithImpl(this._self, this._then);

  final _SSOTokenModel _self;
  final $Res Function(_SSOTokenModel) _then;

/// Create a copy of SSOTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ssoUrl = null,Object? token = null,Object? expiresAt = null,}) {
  return _then(_SSOTokenModel(
ssoUrl: null == ssoUrl ? _self.ssoUrl : ssoUrl // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
