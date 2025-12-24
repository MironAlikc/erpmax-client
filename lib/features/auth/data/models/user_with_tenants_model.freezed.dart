// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_with_tenants_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserWithTenantsModel {

 UserModel get user; List<UserTenantModel> get tenants;
/// Create a copy of UserWithTenantsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserWithTenantsModelCopyWith<UserWithTenantsModel> get copyWith => _$UserWithTenantsModelCopyWithImpl<UserWithTenantsModel>(this as UserWithTenantsModel, _$identity);

  /// Serializes this UserWithTenantsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserWithTenantsModel&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.tenants, tenants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(tenants));

@override
String toString() {
  return 'UserWithTenantsModel(user: $user, tenants: $tenants)';
}


}

/// @nodoc
abstract mixin class $UserWithTenantsModelCopyWith<$Res>  {
  factory $UserWithTenantsModelCopyWith(UserWithTenantsModel value, $Res Function(UserWithTenantsModel) _then) = _$UserWithTenantsModelCopyWithImpl;
@useResult
$Res call({
 UserModel user, List<UserTenantModel> tenants
});


$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$UserWithTenantsModelCopyWithImpl<$Res>
    implements $UserWithTenantsModelCopyWith<$Res> {
  _$UserWithTenantsModelCopyWithImpl(this._self, this._then);

  final UserWithTenantsModel _self;
  final $Res Function(UserWithTenantsModel) _then;

/// Create a copy of UserWithTenantsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? tenants = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,tenants: null == tenants ? _self.tenants : tenants // ignore: cast_nullable_to_non_nullable
as List<UserTenantModel>,
  ));
}
/// Create a copy of UserWithTenantsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserWithTenantsModel].
extension UserWithTenantsModelPatterns on UserWithTenantsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserWithTenantsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserWithTenantsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserWithTenantsModel value)  $default,){
final _that = this;
switch (_that) {
case _UserWithTenantsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserWithTenantsModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserWithTenantsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserModel user,  List<UserTenantModel> tenants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserWithTenantsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserModel user,  List<UserTenantModel> tenants)  $default,) {final _that = this;
switch (_that) {
case _UserWithTenantsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserModel user,  List<UserTenantModel> tenants)?  $default,) {final _that = this;
switch (_that) {
case _UserWithTenantsModel() when $default != null:
return $default(_that.user,_that.tenants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserWithTenantsModel extends UserWithTenantsModel {
  const _UserWithTenantsModel({required this.user, required final  List<UserTenantModel> tenants}): _tenants = tenants,super._();
  factory _UserWithTenantsModel.fromJson(Map<String, dynamic> json) => _$UserWithTenantsModelFromJson(json);

@override final  UserModel user;
 final  List<UserTenantModel> _tenants;
@override List<UserTenantModel> get tenants {
  if (_tenants is EqualUnmodifiableListView) return _tenants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tenants);
}


/// Create a copy of UserWithTenantsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserWithTenantsModelCopyWith<_UserWithTenantsModel> get copyWith => __$UserWithTenantsModelCopyWithImpl<_UserWithTenantsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserWithTenantsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserWithTenantsModel&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._tenants, _tenants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_tenants));

@override
String toString() {
  return 'UserWithTenantsModel(user: $user, tenants: $tenants)';
}


}

/// @nodoc
abstract mixin class _$UserWithTenantsModelCopyWith<$Res> implements $UserWithTenantsModelCopyWith<$Res> {
  factory _$UserWithTenantsModelCopyWith(_UserWithTenantsModel value, $Res Function(_UserWithTenantsModel) _then) = __$UserWithTenantsModelCopyWithImpl;
@override @useResult
$Res call({
 UserModel user, List<UserTenantModel> tenants
});


@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$UserWithTenantsModelCopyWithImpl<$Res>
    implements _$UserWithTenantsModelCopyWith<$Res> {
  __$UserWithTenantsModelCopyWithImpl(this._self, this._then);

  final _UserWithTenantsModel _self;
  final $Res Function(_UserWithTenantsModel) _then;

/// Create a copy of UserWithTenantsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? tenants = null,}) {
  return _then(_UserWithTenantsModel(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,tenants: null == tenants ? _self._tenants : tenants // ignore: cast_nullable_to_non_nullable
as List<UserTenantModel>,
  ));
}

/// Create a copy of UserWithTenantsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
