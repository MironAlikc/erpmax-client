// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'switch_tenant_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SwitchTenantResponseModel {

@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'refresh_token') String get refreshToken; TenantModel get tenant;
/// Create a copy of SwitchTenantResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwitchTenantResponseModelCopyWith<SwitchTenantResponseModel> get copyWith => _$SwitchTenantResponseModelCopyWithImpl<SwitchTenantResponseModel>(this as SwitchTenantResponseModel, _$identity);

  /// Serializes this SwitchTenantResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwitchTenantResponseModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.tenant, tenant) || other.tenant == tenant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,tenant);

@override
String toString() {
  return 'SwitchTenantResponseModel(accessToken: $accessToken, refreshToken: $refreshToken, tenant: $tenant)';
}


}

/// @nodoc
abstract mixin class $SwitchTenantResponseModelCopyWith<$Res>  {
  factory $SwitchTenantResponseModelCopyWith(SwitchTenantResponseModel value, $Res Function(SwitchTenantResponseModel) _then) = _$SwitchTenantResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken, TenantModel tenant
});


$TenantModelCopyWith<$Res> get tenant;

}
/// @nodoc
class _$SwitchTenantResponseModelCopyWithImpl<$Res>
    implements $SwitchTenantResponseModelCopyWith<$Res> {
  _$SwitchTenantResponseModelCopyWithImpl(this._self, this._then);

  final SwitchTenantResponseModel _self;
  final $Res Function(SwitchTenantResponseModel) _then;

/// Create a copy of SwitchTenantResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? tenant = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,tenant: null == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as TenantModel,
  ));
}
/// Create a copy of SwitchTenantResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantModelCopyWith<$Res> get tenant {
  
  return $TenantModelCopyWith<$Res>(_self.tenant, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}
}


/// Adds pattern-matching-related methods to [SwitchTenantResponseModel].
extension SwitchTenantResponseModelPatterns on SwitchTenantResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SwitchTenantResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SwitchTenantResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SwitchTenantResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _SwitchTenantResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SwitchTenantResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _SwitchTenantResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken,  TenantModel tenant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SwitchTenantResponseModel() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.tenant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken,  TenantModel tenant)  $default,) {final _that = this;
switch (_that) {
case _SwitchTenantResponseModel():
return $default(_that.accessToken,_that.refreshToken,_that.tenant);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken,  TenantModel tenant)?  $default,) {final _that = this;
switch (_that) {
case _SwitchTenantResponseModel() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.tenant);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SwitchTenantResponseModel extends SwitchTenantResponseModel {
  const _SwitchTenantResponseModel({@JsonKey(name: 'access_token') required this.accessToken, @JsonKey(name: 'refresh_token') required this.refreshToken, required this.tenant}): super._();
  factory _SwitchTenantResponseModel.fromJson(Map<String, dynamic> json) => _$SwitchTenantResponseModelFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'refresh_token') final  String refreshToken;
@override final  TenantModel tenant;

/// Create a copy of SwitchTenantResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwitchTenantResponseModelCopyWith<_SwitchTenantResponseModel> get copyWith => __$SwitchTenantResponseModelCopyWithImpl<_SwitchTenantResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SwitchTenantResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SwitchTenantResponseModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.tenant, tenant) || other.tenant == tenant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,tenant);

@override
String toString() {
  return 'SwitchTenantResponseModel(accessToken: $accessToken, refreshToken: $refreshToken, tenant: $tenant)';
}


}

/// @nodoc
abstract mixin class _$SwitchTenantResponseModelCopyWith<$Res> implements $SwitchTenantResponseModelCopyWith<$Res> {
  factory _$SwitchTenantResponseModelCopyWith(_SwitchTenantResponseModel value, $Res Function(_SwitchTenantResponseModel) _then) = __$SwitchTenantResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken, TenantModel tenant
});


@override $TenantModelCopyWith<$Res> get tenant;

}
/// @nodoc
class __$SwitchTenantResponseModelCopyWithImpl<$Res>
    implements _$SwitchTenantResponseModelCopyWith<$Res> {
  __$SwitchTenantResponseModelCopyWithImpl(this._self, this._then);

  final _SwitchTenantResponseModel _self;
  final $Res Function(_SwitchTenantResponseModel) _then;

/// Create a copy of SwitchTenantResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? tenant = null,}) {
  return _then(_SwitchTenantResponseModel(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,tenant: null == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as TenantModel,
  ));
}

/// Create a copy of SwitchTenantResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantModelCopyWith<$Res> get tenant {
  
  return $TenantModelCopyWith<$Res>(_self.tenant, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}
}

// dart format on
