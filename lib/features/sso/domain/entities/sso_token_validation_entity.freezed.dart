// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sso_token_validation_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SSOTokenValidationEntity {

 bool get valid; String get userId; String get tenantId; DateTime get createdAt;
/// Create a copy of SSOTokenValidationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SSOTokenValidationEntityCopyWith<SSOTokenValidationEntity> get copyWith => _$SSOTokenValidationEntityCopyWithImpl<SSOTokenValidationEntity>(this as SSOTokenValidationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SSOTokenValidationEntity&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,valid,userId,tenantId,createdAt);

@override
String toString() {
  return 'SSOTokenValidationEntity(valid: $valid, userId: $userId, tenantId: $tenantId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SSOTokenValidationEntityCopyWith<$Res>  {
  factory $SSOTokenValidationEntityCopyWith(SSOTokenValidationEntity value, $Res Function(SSOTokenValidationEntity) _then) = _$SSOTokenValidationEntityCopyWithImpl;
@useResult
$Res call({
 bool valid, String userId, String tenantId, DateTime createdAt
});




}
/// @nodoc
class _$SSOTokenValidationEntityCopyWithImpl<$Res>
    implements $SSOTokenValidationEntityCopyWith<$Res> {
  _$SSOTokenValidationEntityCopyWithImpl(this._self, this._then);

  final SSOTokenValidationEntity _self;
  final $Res Function(SSOTokenValidationEntity) _then;

/// Create a copy of SSOTokenValidationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? valid = null,Object? userId = null,Object? tenantId = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SSOTokenValidationEntity].
extension SSOTokenValidationEntityPatterns on SSOTokenValidationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SSOTokenValidationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SSOTokenValidationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SSOTokenValidationEntity value)  $default,){
final _that = this;
switch (_that) {
case _SSOTokenValidationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SSOTokenValidationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SSOTokenValidationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool valid,  String userId,  String tenantId,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SSOTokenValidationEntity() when $default != null:
return $default(_that.valid,_that.userId,_that.tenantId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool valid,  String userId,  String tenantId,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SSOTokenValidationEntity():
return $default(_that.valid,_that.userId,_that.tenantId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool valid,  String userId,  String tenantId,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SSOTokenValidationEntity() when $default != null:
return $default(_that.valid,_that.userId,_that.tenantId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _SSOTokenValidationEntity implements SSOTokenValidationEntity {
  const _SSOTokenValidationEntity({required this.valid, required this.userId, required this.tenantId, required this.createdAt});
  

@override final  bool valid;
@override final  String userId;
@override final  String tenantId;
@override final  DateTime createdAt;

/// Create a copy of SSOTokenValidationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SSOTokenValidationEntityCopyWith<_SSOTokenValidationEntity> get copyWith => __$SSOTokenValidationEntityCopyWithImpl<_SSOTokenValidationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SSOTokenValidationEntity&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,valid,userId,tenantId,createdAt);

@override
String toString() {
  return 'SSOTokenValidationEntity(valid: $valid, userId: $userId, tenantId: $tenantId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SSOTokenValidationEntityCopyWith<$Res> implements $SSOTokenValidationEntityCopyWith<$Res> {
  factory _$SSOTokenValidationEntityCopyWith(_SSOTokenValidationEntity value, $Res Function(_SSOTokenValidationEntity) _then) = __$SSOTokenValidationEntityCopyWithImpl;
@override @useResult
$Res call({
 bool valid, String userId, String tenantId, DateTime createdAt
});




}
/// @nodoc
class __$SSOTokenValidationEntityCopyWithImpl<$Res>
    implements _$SSOTokenValidationEntityCopyWith<$Res> {
  __$SSOTokenValidationEntityCopyWithImpl(this._self, this._then);

  final _SSOTokenValidationEntity _self;
  final $Res Function(_SSOTokenValidationEntity) _then;

/// Create a copy of SSOTokenValidationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? valid = null,Object? userId = null,Object? tenantId = null,Object? createdAt = null,}) {
  return _then(_SSOTokenValidationEntity(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
