// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_tenant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserTenantModel {

@JsonKey(name: 'tenant_id') String get tenantId;@JsonKey(name: 'tenant_name') String get tenantName; String get role;@JsonKey(name: 'is_default') bool get isDefault;
/// Create a copy of UserTenantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserTenantModelCopyWith<UserTenantModel> get copyWith => _$UserTenantModelCopyWithImpl<UserTenantModel>(this as UserTenantModel, _$identity);

  /// Serializes this UserTenantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserTenantModel&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.role, role) || other.role == role)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,tenantName,role,isDefault);

@override
String toString() {
  return 'UserTenantModel(tenantId: $tenantId, tenantName: $tenantName, role: $role, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $UserTenantModelCopyWith<$Res>  {
  factory $UserTenantModelCopyWith(UserTenantModel value, $Res Function(UserTenantModel) _then) = _$UserTenantModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'tenant_id') String tenantId,@JsonKey(name: 'tenant_name') String tenantName, String role,@JsonKey(name: 'is_default') bool isDefault
});




}
/// @nodoc
class _$UserTenantModelCopyWithImpl<$Res>
    implements $UserTenantModelCopyWith<$Res> {
  _$UserTenantModelCopyWithImpl(this._self, this._then);

  final UserTenantModel _self;
  final $Res Function(UserTenantModel) _then;

/// Create a copy of UserTenantModel
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


/// Adds pattern-matching-related methods to [UserTenantModel].
extension UserTenantModelPatterns on UserTenantModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserTenantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserTenantModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserTenantModel value)  $default,){
final _that = this;
switch (_that) {
case _UserTenantModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserTenantModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserTenantModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'tenant_id')  String tenantId, @JsonKey(name: 'tenant_name')  String tenantName,  String role, @JsonKey(name: 'is_default')  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserTenantModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'tenant_id')  String tenantId, @JsonKey(name: 'tenant_name')  String tenantName,  String role, @JsonKey(name: 'is_default')  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _UserTenantModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'tenant_id')  String tenantId, @JsonKey(name: 'tenant_name')  String tenantName,  String role, @JsonKey(name: 'is_default')  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _UserTenantModel() when $default != null:
return $default(_that.tenantId,_that.tenantName,_that.role,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserTenantModel extends UserTenantModel {
  const _UserTenantModel({@JsonKey(name: 'tenant_id') required this.tenantId, @JsonKey(name: 'tenant_name') required this.tenantName, required this.role, @JsonKey(name: 'is_default') required this.isDefault}): super._();
  factory _UserTenantModel.fromJson(Map<String, dynamic> json) => _$UserTenantModelFromJson(json);

@override@JsonKey(name: 'tenant_id') final  String tenantId;
@override@JsonKey(name: 'tenant_name') final  String tenantName;
@override final  String role;
@override@JsonKey(name: 'is_default') final  bool isDefault;

/// Create a copy of UserTenantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserTenantModelCopyWith<_UserTenantModel> get copyWith => __$UserTenantModelCopyWithImpl<_UserTenantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserTenantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserTenantModel&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.role, role) || other.role == role)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenantId,tenantName,role,isDefault);

@override
String toString() {
  return 'UserTenantModel(tenantId: $tenantId, tenantName: $tenantName, role: $role, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$UserTenantModelCopyWith<$Res> implements $UserTenantModelCopyWith<$Res> {
  factory _$UserTenantModelCopyWith(_UserTenantModel value, $Res Function(_UserTenantModel) _then) = __$UserTenantModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'tenant_id') String tenantId,@JsonKey(name: 'tenant_name') String tenantName, String role,@JsonKey(name: 'is_default') bool isDefault
});




}
/// @nodoc
class __$UserTenantModelCopyWithImpl<$Res>
    implements _$UserTenantModelCopyWith<$Res> {
  __$UserTenantModelCopyWithImpl(this._self, this._then);

  final _UserTenantModel _self;
  final $Res Function(_UserTenantModel) _then;

/// Create a copy of UserTenantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenantId = null,Object? tenantName = null,Object? role = null,Object? isDefault = null,}) {
  return _then(_UserTenantModel(
tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
