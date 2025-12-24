// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthResult {

 AuthTokens get tokens; UserEntity get user; List<UserTenantEntity> get tenants; TenantEntity get currentTenant;
/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResultCopyWith<AuthResult> get copyWith => _$AuthResultCopyWithImpl<AuthResult>(this as AuthResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResult&&(identical(other.tokens, tokens) || other.tokens == tokens)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.tenants, tenants)&&(identical(other.currentTenant, currentTenant) || other.currentTenant == currentTenant));
}


@override
int get hashCode => Object.hash(runtimeType,tokens,user,const DeepCollectionEquality().hash(tenants),currentTenant);

@override
String toString() {
  return 'AuthResult(tokens: $tokens, user: $user, tenants: $tenants, currentTenant: $currentTenant)';
}


}

/// @nodoc
abstract mixin class $AuthResultCopyWith<$Res>  {
  factory $AuthResultCopyWith(AuthResult value, $Res Function(AuthResult) _then) = _$AuthResultCopyWithImpl;
@useResult
$Res call({
 AuthTokens tokens, UserEntity user, List<UserTenantEntity> tenants, TenantEntity currentTenant
});


$AuthTokensCopyWith<$Res> get tokens;$UserEntityCopyWith<$Res> get user;$TenantEntityCopyWith<$Res> get currentTenant;

}
/// @nodoc
class _$AuthResultCopyWithImpl<$Res>
    implements $AuthResultCopyWith<$Res> {
  _$AuthResultCopyWithImpl(this._self, this._then);

  final AuthResult _self;
  final $Res Function(AuthResult) _then;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokens = null,Object? user = null,Object? tenants = null,Object? currentTenant = null,}) {
  return _then(_self.copyWith(
tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as AuthTokens,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,tenants: null == tenants ? _self.tenants : tenants // ignore: cast_nullable_to_non_nullable
as List<UserTenantEntity>,currentTenant: null == currentTenant ? _self.currentTenant : currentTenant // ignore: cast_nullable_to_non_nullable
as TenantEntity,
  ));
}
/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokensCopyWith<$Res> get tokens {
  
  return $AuthTokensCopyWith<$Res>(_self.tokens, (value) {
    return _then(_self.copyWith(tokens: value));
  });
}/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get user {
  
  return $UserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantEntityCopyWith<$Res> get currentTenant {
  
  return $TenantEntityCopyWith<$Res>(_self.currentTenant, (value) {
    return _then(_self.copyWith(currentTenant: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthResult].
extension AuthResultPatterns on AuthResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResult value)  $default,){
final _that = this;
switch (_that) {
case _AuthResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResult value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthTokens tokens,  UserEntity user,  List<UserTenantEntity> tenants,  TenantEntity currentTenant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResult() when $default != null:
return $default(_that.tokens,_that.user,_that.tenants,_that.currentTenant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthTokens tokens,  UserEntity user,  List<UserTenantEntity> tenants,  TenantEntity currentTenant)  $default,) {final _that = this;
switch (_that) {
case _AuthResult():
return $default(_that.tokens,_that.user,_that.tenants,_that.currentTenant);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthTokens tokens,  UserEntity user,  List<UserTenantEntity> tenants,  TenantEntity currentTenant)?  $default,) {final _that = this;
switch (_that) {
case _AuthResult() when $default != null:
return $default(_that.tokens,_that.user,_that.tenants,_that.currentTenant);case _:
  return null;

}
}

}

/// @nodoc


class _AuthResult implements AuthResult {
  const _AuthResult({required this.tokens, required this.user, required final  List<UserTenantEntity> tenants, required this.currentTenant}): _tenants = tenants;
  

@override final  AuthTokens tokens;
@override final  UserEntity user;
 final  List<UserTenantEntity> _tenants;
@override List<UserTenantEntity> get tenants {
  if (_tenants is EqualUnmodifiableListView) return _tenants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tenants);
}

@override final  TenantEntity currentTenant;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResultCopyWith<_AuthResult> get copyWith => __$AuthResultCopyWithImpl<_AuthResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResult&&(identical(other.tokens, tokens) || other.tokens == tokens)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._tenants, _tenants)&&(identical(other.currentTenant, currentTenant) || other.currentTenant == currentTenant));
}


@override
int get hashCode => Object.hash(runtimeType,tokens,user,const DeepCollectionEquality().hash(_tenants),currentTenant);

@override
String toString() {
  return 'AuthResult(tokens: $tokens, user: $user, tenants: $tenants, currentTenant: $currentTenant)';
}


}

/// @nodoc
abstract mixin class _$AuthResultCopyWith<$Res> implements $AuthResultCopyWith<$Res> {
  factory _$AuthResultCopyWith(_AuthResult value, $Res Function(_AuthResult) _then) = __$AuthResultCopyWithImpl;
@override @useResult
$Res call({
 AuthTokens tokens, UserEntity user, List<UserTenantEntity> tenants, TenantEntity currentTenant
});


@override $AuthTokensCopyWith<$Res> get tokens;@override $UserEntityCopyWith<$Res> get user;@override $TenantEntityCopyWith<$Res> get currentTenant;

}
/// @nodoc
class __$AuthResultCopyWithImpl<$Res>
    implements _$AuthResultCopyWith<$Res> {
  __$AuthResultCopyWithImpl(this._self, this._then);

  final _AuthResult _self;
  final $Res Function(_AuthResult) _then;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokens = null,Object? user = null,Object? tenants = null,Object? currentTenant = null,}) {
  return _then(_AuthResult(
tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as AuthTokens,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,tenants: null == tenants ? _self._tenants : tenants // ignore: cast_nullable_to_non_nullable
as List<UserTenantEntity>,currentTenant: null == currentTenant ? _self.currentTenant : currentTenant // ignore: cast_nullable_to_non_nullable
as TenantEntity,
  ));
}

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokensCopyWith<$Res> get tokens {
  
  return $AuthTokensCopyWith<$Res>(_self.tokens, (value) {
    return _then(_self.copyWith(tokens: value));
  });
}/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get user {
  
  return $UserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantEntityCopyWith<$Res> get currentTenant {
  
  return $TenantEntityCopyWith<$Res>(_self.currentTenant, (value) {
    return _then(_self.copyWith(currentTenant: value));
  });
}
}

// dart format on
