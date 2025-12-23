// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_with_tenants.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserWithTenants {

 UserEntity get user; List<UserTenantEntity> get tenants;
/// Create a copy of UserWithTenants
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserWithTenantsCopyWith<UserWithTenants> get copyWith => _$UserWithTenantsCopyWithImpl<UserWithTenants>(this as UserWithTenants, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserWithTenants&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.tenants, tenants));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(tenants));

@override
String toString() {
  return 'UserWithTenants(user: $user, tenants: $tenants)';
}


}

/// @nodoc
abstract mixin class $UserWithTenantsCopyWith<$Res>  {
  factory $UserWithTenantsCopyWith(UserWithTenants value, $Res Function(UserWithTenants) _then) = _$UserWithTenantsCopyWithImpl;
@useResult
$Res call({
 UserEntity user, List<UserTenantEntity> tenants
});


$UserEntityCopyWith<$Res> get user;

}
/// @nodoc
class _$UserWithTenantsCopyWithImpl<$Res>
    implements $UserWithTenantsCopyWith<$Res> {
  _$UserWithTenantsCopyWithImpl(this._self, this._then);

  final UserWithTenants _self;
  final $Res Function(UserWithTenants) _then;

/// Create a copy of UserWithTenants
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? tenants = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,tenants: null == tenants ? _self.tenants : tenants // ignore: cast_nullable_to_non_nullable
as List<UserTenantEntity>,
  ));
}
/// Create a copy of UserWithTenants
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get user {
  
  return $UserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserWithTenants].
extension UserWithTenantsPatterns on UserWithTenants {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserWithTenants value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserWithTenants() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserWithTenants value)  $default,){
final _that = this;
switch (_that) {
case _UserWithTenants():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserWithTenants value)?  $default,){
final _that = this;
switch (_that) {
case _UserWithTenants() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserEntity user,  List<UserTenantEntity> tenants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserWithTenants() when $default != null:
return $default(_that.user,_that.tenants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserEntity user,  List<UserTenantEntity> tenants)  $default,) {final _that = this;
switch (_that) {
case _UserWithTenants():
return $default(_that.user,_that.tenants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserEntity user,  List<UserTenantEntity> tenants)?  $default,) {final _that = this;
switch (_that) {
case _UserWithTenants() when $default != null:
return $default(_that.user,_that.tenants);case _:
  return null;

}
}

}

/// @nodoc


class _UserWithTenants implements UserWithTenants {
  const _UserWithTenants({required this.user, required final  List<UserTenantEntity> tenants}): _tenants = tenants;
  

@override final  UserEntity user;
 final  List<UserTenantEntity> _tenants;
@override List<UserTenantEntity> get tenants {
  if (_tenants is EqualUnmodifiableListView) return _tenants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tenants);
}


/// Create a copy of UserWithTenants
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserWithTenantsCopyWith<_UserWithTenants> get copyWith => __$UserWithTenantsCopyWithImpl<_UserWithTenants>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserWithTenants&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._tenants, _tenants));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_tenants));

@override
String toString() {
  return 'UserWithTenants(user: $user, tenants: $tenants)';
}


}

/// @nodoc
abstract mixin class _$UserWithTenantsCopyWith<$Res> implements $UserWithTenantsCopyWith<$Res> {
  factory _$UserWithTenantsCopyWith(_UserWithTenants value, $Res Function(_UserWithTenants) _then) = __$UserWithTenantsCopyWithImpl;
@override @useResult
$Res call({
 UserEntity user, List<UserTenantEntity> tenants
});


@override $UserEntityCopyWith<$Res> get user;

}
/// @nodoc
class __$UserWithTenantsCopyWithImpl<$Res>
    implements _$UserWithTenantsCopyWith<$Res> {
  __$UserWithTenantsCopyWithImpl(this._self, this._then);

  final _UserWithTenants _self;
  final $Res Function(_UserWithTenants) _then;

/// Create a copy of UserWithTenants
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? tenants = null,}) {
  return _then(_UserWithTenants(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,tenants: null == tenants ? _self._tenants : tenants // ignore: cast_nullable_to_non_nullable
as List<UserTenantEntity>,
  ));
}

/// Create a copy of UserWithTenants
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get user {
  
  return $UserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
