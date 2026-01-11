// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sso_token_validation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SSOTokenValidationModel {

 bool get valid;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'tenant_id') String get tenantId;@JsonKey(name: 'created_at', fromJson: _parseUtcDateTime) DateTime get createdAt;
/// Create a copy of SSOTokenValidationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SSOTokenValidationModelCopyWith<SSOTokenValidationModel> get copyWith => _$SSOTokenValidationModelCopyWithImpl<SSOTokenValidationModel>(this as SSOTokenValidationModel, _$identity);

  /// Serializes this SSOTokenValidationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SSOTokenValidationModel&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,userId,tenantId,createdAt);

@override
String toString() {
  return 'SSOTokenValidationModel(valid: $valid, userId: $userId, tenantId: $tenantId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SSOTokenValidationModelCopyWith<$Res>  {
  factory $SSOTokenValidationModelCopyWith(SSOTokenValidationModel value, $Res Function(SSOTokenValidationModel) _then) = _$SSOTokenValidationModelCopyWithImpl;
@useResult
$Res call({
 bool valid,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'tenant_id') String tenantId,@JsonKey(name: 'created_at', fromJson: _parseUtcDateTime) DateTime createdAt
});




}
/// @nodoc
class _$SSOTokenValidationModelCopyWithImpl<$Res>
    implements $SSOTokenValidationModelCopyWith<$Res> {
  _$SSOTokenValidationModelCopyWithImpl(this._self, this._then);

  final SSOTokenValidationModel _self;
  final $Res Function(SSOTokenValidationModel) _then;

/// Create a copy of SSOTokenValidationModel
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


/// Adds pattern-matching-related methods to [SSOTokenValidationModel].
extension SSOTokenValidationModelPatterns on SSOTokenValidationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SSOTokenValidationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SSOTokenValidationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SSOTokenValidationModel value)  $default,){
final _that = this;
switch (_that) {
case _SSOTokenValidationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SSOTokenValidationModel value)?  $default,){
final _that = this;
switch (_that) {
case _SSOTokenValidationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool valid, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'tenant_id')  String tenantId, @JsonKey(name: 'created_at', fromJson: _parseUtcDateTime)  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SSOTokenValidationModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool valid, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'tenant_id')  String tenantId, @JsonKey(name: 'created_at', fromJson: _parseUtcDateTime)  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SSOTokenValidationModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool valid, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'tenant_id')  String tenantId, @JsonKey(name: 'created_at', fromJson: _parseUtcDateTime)  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SSOTokenValidationModel() when $default != null:
return $default(_that.valid,_that.userId,_that.tenantId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SSOTokenValidationModel extends SSOTokenValidationModel {
  const _SSOTokenValidationModel({required this.valid, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'tenant_id') required this.tenantId, @JsonKey(name: 'created_at', fromJson: _parseUtcDateTime) required this.createdAt}): super._();
  factory _SSOTokenValidationModel.fromJson(Map<String, dynamic> json) => _$SSOTokenValidationModelFromJson(json);

@override final  bool valid;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'tenant_id') final  String tenantId;
@override@JsonKey(name: 'created_at', fromJson: _parseUtcDateTime) final  DateTime createdAt;

/// Create a copy of SSOTokenValidationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SSOTokenValidationModelCopyWith<_SSOTokenValidationModel> get copyWith => __$SSOTokenValidationModelCopyWithImpl<_SSOTokenValidationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SSOTokenValidationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SSOTokenValidationModel&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,userId,tenantId,createdAt);

@override
String toString() {
  return 'SSOTokenValidationModel(valid: $valid, userId: $userId, tenantId: $tenantId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SSOTokenValidationModelCopyWith<$Res> implements $SSOTokenValidationModelCopyWith<$Res> {
  factory _$SSOTokenValidationModelCopyWith(_SSOTokenValidationModel value, $Res Function(_SSOTokenValidationModel) _then) = __$SSOTokenValidationModelCopyWithImpl;
@override @useResult
$Res call({
 bool valid,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'tenant_id') String tenantId,@JsonKey(name: 'created_at', fromJson: _parseUtcDateTime) DateTime createdAt
});




}
/// @nodoc
class __$SSOTokenValidationModelCopyWithImpl<$Res>
    implements _$SSOTokenValidationModelCopyWith<$Res> {
  __$SSOTokenValidationModelCopyWithImpl(this._self, this._then);

  final _SSOTokenValidationModel _self;
  final $Res Function(_SSOTokenValidationModel) _then;

/// Create a copy of SSOTokenValidationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? valid = null,Object? userId = null,Object? tenantId = null,Object? createdAt = null,}) {
  return _then(_SSOTokenValidationModel(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
