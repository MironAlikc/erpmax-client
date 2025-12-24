// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'switch_tenant_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SwitchTenantResult {

 AuthTokens get tokens; TenantEntity get tenant;
/// Create a copy of SwitchTenantResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwitchTenantResultCopyWith<SwitchTenantResult> get copyWith => _$SwitchTenantResultCopyWithImpl<SwitchTenantResult>(this as SwitchTenantResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwitchTenantResult&&(identical(other.tokens, tokens) || other.tokens == tokens)&&(identical(other.tenant, tenant) || other.tenant == tenant));
}


@override
int get hashCode => Object.hash(runtimeType,tokens,tenant);

@override
String toString() {
  return 'SwitchTenantResult(tokens: $tokens, tenant: $tenant)';
}


}

/// @nodoc
abstract mixin class $SwitchTenantResultCopyWith<$Res>  {
  factory $SwitchTenantResultCopyWith(SwitchTenantResult value, $Res Function(SwitchTenantResult) _then) = _$SwitchTenantResultCopyWithImpl;
@useResult
$Res call({
 AuthTokens tokens, TenantEntity tenant
});


$AuthTokensCopyWith<$Res> get tokens;$TenantEntityCopyWith<$Res> get tenant;

}
/// @nodoc
class _$SwitchTenantResultCopyWithImpl<$Res>
    implements $SwitchTenantResultCopyWith<$Res> {
  _$SwitchTenantResultCopyWithImpl(this._self, this._then);

  final SwitchTenantResult _self;
  final $Res Function(SwitchTenantResult) _then;

/// Create a copy of SwitchTenantResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokens = null,Object? tenant = null,}) {
  return _then(_self.copyWith(
tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as AuthTokens,tenant: null == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as TenantEntity,
  ));
}
/// Create a copy of SwitchTenantResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokensCopyWith<$Res> get tokens {
  
  return $AuthTokensCopyWith<$Res>(_self.tokens, (value) {
    return _then(_self.copyWith(tokens: value));
  });
}/// Create a copy of SwitchTenantResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantEntityCopyWith<$Res> get tenant {
  
  return $TenantEntityCopyWith<$Res>(_self.tenant, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}
}


/// Adds pattern-matching-related methods to [SwitchTenantResult].
extension SwitchTenantResultPatterns on SwitchTenantResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SwitchTenantResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SwitchTenantResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SwitchTenantResult value)  $default,){
final _that = this;
switch (_that) {
case _SwitchTenantResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SwitchTenantResult value)?  $default,){
final _that = this;
switch (_that) {
case _SwitchTenantResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthTokens tokens,  TenantEntity tenant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SwitchTenantResult() when $default != null:
return $default(_that.tokens,_that.tenant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthTokens tokens,  TenantEntity tenant)  $default,) {final _that = this;
switch (_that) {
case _SwitchTenantResult():
return $default(_that.tokens,_that.tenant);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthTokens tokens,  TenantEntity tenant)?  $default,) {final _that = this;
switch (_that) {
case _SwitchTenantResult() when $default != null:
return $default(_that.tokens,_that.tenant);case _:
  return null;

}
}

}

/// @nodoc


class _SwitchTenantResult implements SwitchTenantResult {
  const _SwitchTenantResult({required this.tokens, required this.tenant});
  

@override final  AuthTokens tokens;
@override final  TenantEntity tenant;

/// Create a copy of SwitchTenantResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwitchTenantResultCopyWith<_SwitchTenantResult> get copyWith => __$SwitchTenantResultCopyWithImpl<_SwitchTenantResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SwitchTenantResult&&(identical(other.tokens, tokens) || other.tokens == tokens)&&(identical(other.tenant, tenant) || other.tenant == tenant));
}


@override
int get hashCode => Object.hash(runtimeType,tokens,tenant);

@override
String toString() {
  return 'SwitchTenantResult(tokens: $tokens, tenant: $tenant)';
}


}

/// @nodoc
abstract mixin class _$SwitchTenantResultCopyWith<$Res> implements $SwitchTenantResultCopyWith<$Res> {
  factory _$SwitchTenantResultCopyWith(_SwitchTenantResult value, $Res Function(_SwitchTenantResult) _then) = __$SwitchTenantResultCopyWithImpl;
@override @useResult
$Res call({
 AuthTokens tokens, TenantEntity tenant
});


@override $AuthTokensCopyWith<$Res> get tokens;@override $TenantEntityCopyWith<$Res> get tenant;

}
/// @nodoc
class __$SwitchTenantResultCopyWithImpl<$Res>
    implements _$SwitchTenantResultCopyWith<$Res> {
  __$SwitchTenantResultCopyWithImpl(this._self, this._then);

  final _SwitchTenantResult _self;
  final $Res Function(_SwitchTenantResult) _then;

/// Create a copy of SwitchTenantResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokens = null,Object? tenant = null,}) {
  return _then(_SwitchTenantResult(
tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as AuthTokens,tenant: null == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as TenantEntity,
  ));
}

/// Create a copy of SwitchTenantResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokensCopyWith<$Res> get tokens {
  
  return $AuthTokensCopyWith<$Res>(_self.tokens, (value) {
    return _then(_self.copyWith(tokens: value));
  });
}/// Create a copy of SwitchTenantResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantEntityCopyWith<$Res> get tenant {
  
  return $TenantEntityCopyWith<$Res>(_self.tenant, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}
}

// dart format on
