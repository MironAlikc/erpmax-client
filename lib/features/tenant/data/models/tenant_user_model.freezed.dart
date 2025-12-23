// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TenantUserModel {

@JsonKey(name: 'user_id') String get userId; String get email;@JsonKey(name: 'full_name') String get fullName; String get role;@JsonKey(name: 'is_default') bool get isDefault;@JsonKey(name: 'joined_at') DateTime get joinedAt;
/// Create a copy of TenantUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantUserModelCopyWith<TenantUserModel> get copyWith => _$TenantUserModelCopyWithImpl<TenantUserModel>(this as TenantUserModel, _$identity);

  /// Serializes this TenantUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantUserModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,email,fullName,role,isDefault,joinedAt);

@override
String toString() {
  return 'TenantUserModel(userId: $userId, email: $email, fullName: $fullName, role: $role, isDefault: $isDefault, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class $TenantUserModelCopyWith<$Res>  {
  factory $TenantUserModelCopyWith(TenantUserModel value, $Res Function(TenantUserModel) _then) = _$TenantUserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId, String email,@JsonKey(name: 'full_name') String fullName, String role,@JsonKey(name: 'is_default') bool isDefault,@JsonKey(name: 'joined_at') DateTime joinedAt
});




}
/// @nodoc
class _$TenantUserModelCopyWithImpl<$Res>
    implements $TenantUserModelCopyWith<$Res> {
  _$TenantUserModelCopyWithImpl(this._self, this._then);

  final TenantUserModel _self;
  final $Res Function(TenantUserModel) _then;

/// Create a copy of TenantUserModel
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


/// Adds pattern-matching-related methods to [TenantUserModel].
extension TenantUserModelPatterns on TenantUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantUserModel value)  $default,){
final _that = this;
switch (_that) {
case _TenantUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _TenantUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  String email, @JsonKey(name: 'full_name')  String fullName,  String role, @JsonKey(name: 'is_default')  bool isDefault, @JsonKey(name: 'joined_at')  DateTime joinedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantUserModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  String email, @JsonKey(name: 'full_name')  String fullName,  String role, @JsonKey(name: 'is_default')  bool isDefault, @JsonKey(name: 'joined_at')  DateTime joinedAt)  $default,) {final _that = this;
switch (_that) {
case _TenantUserModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId,  String email, @JsonKey(name: 'full_name')  String fullName,  String role, @JsonKey(name: 'is_default')  bool isDefault, @JsonKey(name: 'joined_at')  DateTime joinedAt)?  $default,) {final _that = this;
switch (_that) {
case _TenantUserModel() when $default != null:
return $default(_that.userId,_that.email,_that.fullName,_that.role,_that.isDefault,_that.joinedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenantUserModel extends TenantUserModel {
  const _TenantUserModel({@JsonKey(name: 'user_id') required this.userId, required this.email, @JsonKey(name: 'full_name') required this.fullName, required this.role, @JsonKey(name: 'is_default') required this.isDefault, @JsonKey(name: 'joined_at') required this.joinedAt}): super._();
  factory _TenantUserModel.fromJson(Map<String, dynamic> json) => _$TenantUserModelFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override final  String email;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String role;
@override@JsonKey(name: 'is_default') final  bool isDefault;
@override@JsonKey(name: 'joined_at') final  DateTime joinedAt;

/// Create a copy of TenantUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantUserModelCopyWith<_TenantUserModel> get copyWith => __$TenantUserModelCopyWithImpl<_TenantUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantUserModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,email,fullName,role,isDefault,joinedAt);

@override
String toString() {
  return 'TenantUserModel(userId: $userId, email: $email, fullName: $fullName, role: $role, isDefault: $isDefault, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class _$TenantUserModelCopyWith<$Res> implements $TenantUserModelCopyWith<$Res> {
  factory _$TenantUserModelCopyWith(_TenantUserModel value, $Res Function(_TenantUserModel) _then) = __$TenantUserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId, String email,@JsonKey(name: 'full_name') String fullName, String role,@JsonKey(name: 'is_default') bool isDefault,@JsonKey(name: 'joined_at') DateTime joinedAt
});




}
/// @nodoc
class __$TenantUserModelCopyWithImpl<$Res>
    implements _$TenantUserModelCopyWith<$Res> {
  __$TenantUserModelCopyWithImpl(this._self, this._then);

  final _TenantUserModel _self;
  final $Res Function(_TenantUserModel) _then;

/// Create a copy of TenantUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? email = null,Object? fullName = null,Object? role = null,Object? isDefault = null,Object? joinedAt = null,}) {
  return _then(_TenantUserModel(
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
