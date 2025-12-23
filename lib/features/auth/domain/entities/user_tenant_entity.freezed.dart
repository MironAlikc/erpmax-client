// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_tenant_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserTenantEntity {

 String get tenantId; String get tenantName; String get role; bool get isDefault;
/// Create a copy of UserTenantEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserTenantEntityCopyWith<UserTenantEntity> get copyWith => _$UserTenantEntityCopyWithImpl<UserTenantEntity>(this as UserTenantEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserTenantEntity&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.role, role) || other.role == role)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}


@override
int get hashCode => Object.hash(runtimeType,tenantId,tenantName,role,isDefault);

@override
String toString() {
  return 'UserTenantEntity(tenantId: $tenantId, tenantName: $tenantName, role: $role, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $UserTenantEntityCopyWith<$Res>  {
  factory $UserTenantEntityCopyWith(UserTenantEntity value, $Res Function(UserTenantEntity) _then) = _$UserTenantEntityCopyWithImpl;
@useResult
$Res call({
 String tenantId, String tenantName, String role, bool isDefault
});




}
/// @nodoc
class _$UserTenantEntityCopyWithImpl<$Res>
    implements $UserTenantEntityCopyWith<$Res> {
  _$UserTenantEntityCopyWithImpl(this._self, this._then);

  final UserTenantEntity _self;
  final $Res Function(UserTenantEntity) _then;

/// Create a copy of UserTenantEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenantId = null,Object? tenantName = null,Object? role = null,Object? isDefault = null,}) {
  return _then(_self.copyWith(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserTenantEntity].
extension UserTenantEntityPatterns on UserTenantEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserTenantEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserTenantEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserTenantEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserTenantEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserTenantEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserTenantEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenantId,  String tenantName,  String role,  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserTenantEntity() when $default != null:
return $default(_that.tenantId,_that.tenantName,_that.role,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenantId,  String tenantName,  String role,  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _UserTenantEntity():
return $default(_that.tenantId,_that.tenantName,_that.role,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenantId,  String tenantName,  String role,  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _UserTenantEntity() when $default != null:
return $default(_that.tenantId,_that.tenantName,_that.role,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc


class _UserTenantEntity implements UserTenantEntity {
  const _UserTenantEntity({required this.tenantId, required this.tenantName, required this.role, required this.isDefault});
  

@override final  String tenantId;
@override final  String tenantName;
@override final  String role;
@override final  bool isDefault;

/// Create a copy of UserTenantEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserTenantEntityCopyWith<_UserTenantEntity> get copyWith => __$UserTenantEntityCopyWithImpl<_UserTenantEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserTenantEntity&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.role, role) || other.role == role)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}


@override
int get hashCode => Object.hash(runtimeType,tenantId,tenantName,role,isDefault);

@override
String toString() {
  return 'UserTenantEntity(tenantId: $tenantId, tenantName: $tenantName, role: $role, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$UserTenantEntityCopyWith<$Res> implements $UserTenantEntityCopyWith<$Res> {
  factory _$UserTenantEntityCopyWith(_UserTenantEntity value, $Res Function(_UserTenantEntity) _then) = __$UserTenantEntityCopyWithImpl;
@override @useResult
$Res call({
 String tenantId, String tenantName, String role, bool isDefault
});




}
/// @nodoc
class __$UserTenantEntityCopyWithImpl<$Res>
    implements _$UserTenantEntityCopyWith<$Res> {
  __$UserTenantEntityCopyWithImpl(this._self, this._then);

  final _UserTenantEntity _self;
  final $Res Function(_UserTenantEntity) _then;

/// Create a copy of UserTenantEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = null,Object? tenantName = null,Object? role = null,Object? isDefault = null,}) {
  return _then(_UserTenantEntity(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
