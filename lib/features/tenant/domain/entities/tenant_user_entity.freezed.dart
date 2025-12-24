// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TenantUserEntity {

 String get userId; String get email; String get fullName; String get role; bool get isDefault; DateTime get joinedAt;
/// Create a copy of TenantUserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantUserEntityCopyWith<TenantUserEntity> get copyWith => _$TenantUserEntityCopyWithImpl<TenantUserEntity>(this as TenantUserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantUserEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,email,fullName,role,isDefault,joinedAt);

@override
String toString() {
  return 'TenantUserEntity(userId: $userId, email: $email, fullName: $fullName, role: $role, isDefault: $isDefault, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class $TenantUserEntityCopyWith<$Res>  {
  factory $TenantUserEntityCopyWith(TenantUserEntity value, $Res Function(TenantUserEntity) _then) = _$TenantUserEntityCopyWithImpl;
@useResult
$Res call({
 String userId, String email, String fullName, String role, bool isDefault, DateTime joinedAt
});




}
/// @nodoc
class _$TenantUserEntityCopyWithImpl<$Res>
    implements $TenantUserEntityCopyWith<$Res> {
  _$TenantUserEntityCopyWithImpl(this._self, this._then);

  final TenantUserEntity _self;
  final $Res Function(TenantUserEntity) _then;

/// Create a copy of TenantUserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? email = null,Object? fullName = null,Object? role = null,Object? isDefault = null,Object? joinedAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TenantUserEntity].
extension TenantUserEntityPatterns on TenantUserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantUserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantUserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantUserEntity value)  $default,){
final _that = this;
switch (_that) {
case _TenantUserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantUserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TenantUserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String email,  String fullName,  String role,  bool isDefault,  DateTime joinedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantUserEntity() when $default != null:
return $default(_that.userId,_that.email,_that.fullName,_that.role,_that.isDefault,_that.joinedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String email,  String fullName,  String role,  bool isDefault,  DateTime joinedAt)  $default,) {final _that = this;
switch (_that) {
case _TenantUserEntity():
return $default(_that.userId,_that.email,_that.fullName,_that.role,_that.isDefault,_that.joinedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String email,  String fullName,  String role,  bool isDefault,  DateTime joinedAt)?  $default,) {final _that = this;
switch (_that) {
case _TenantUserEntity() when $default != null:
return $default(_that.userId,_that.email,_that.fullName,_that.role,_that.isDefault,_that.joinedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TenantUserEntity implements TenantUserEntity {
  const _TenantUserEntity({required this.userId, required this.email, required this.fullName, required this.role, required this.isDefault, required this.joinedAt});
  

@override final  String userId;
@override final  String email;
@override final  String fullName;
@override final  String role;
@override final  bool isDefault;
@override final  DateTime joinedAt;

/// Create a copy of TenantUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantUserEntityCopyWith<_TenantUserEntity> get copyWith => __$TenantUserEntityCopyWithImpl<_TenantUserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantUserEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,email,fullName,role,isDefault,joinedAt);

@override
String toString() {
  return 'TenantUserEntity(userId: $userId, email: $email, fullName: $fullName, role: $role, isDefault: $isDefault, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class _$TenantUserEntityCopyWith<$Res> implements $TenantUserEntityCopyWith<$Res> {
  factory _$TenantUserEntityCopyWith(_TenantUserEntity value, $Res Function(_TenantUserEntity) _then) = __$TenantUserEntityCopyWithImpl;
@override @useResult
$Res call({
 String userId, String email, String fullName, String role, bool isDefault, DateTime joinedAt
});




}
/// @nodoc
class __$TenantUserEntityCopyWithImpl<$Res>
    implements _$TenantUserEntityCopyWith<$Res> {
  __$TenantUserEntityCopyWithImpl(this._self, this._then);

  final _TenantUserEntity _self;
  final $Res Function(_TenantUserEntity) _then;

/// Create a copy of TenantUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? email = null,Object? fullName = null,Object? role = null,Object? isDefault = null,Object? joinedAt = null,}) {
  return _then(_TenantUserEntity(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
