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

 String get id; String get email;@JsonKey(name: 'full_name') String? get fullName;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'is_superuser') bool get isSuperuser;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; List<UserTenantModel> get tenants;
/// Create a copy of UserWithTenantsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserWithTenantsModelCopyWith<UserWithTenantsModel> get copyWith => _$UserWithTenantsModelCopyWithImpl<UserWithTenantsModel>(this as UserWithTenantsModel, _$identity);

  /// Serializes this UserWithTenantsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserWithTenantsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isSuperuser, isSuperuser) || other.isSuperuser == isSuperuser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.tenants, tenants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName,isActive,isSuperuser,createdAt,updatedAt,const DeepCollectionEquality().hash(tenants));

@override
String toString() {
  return 'UserWithTenantsModel(id: $id, email: $email, fullName: $fullName, isActive: $isActive, isSuperuser: $isSuperuser, createdAt: $createdAt, updatedAt: $updatedAt, tenants: $tenants)';
}


}

/// @nodoc
abstract mixin class $UserWithTenantsModelCopyWith<$Res>  {
  factory $UserWithTenantsModelCopyWith(UserWithTenantsModel value, $Res Function(UserWithTenantsModel) _then) = _$UserWithTenantsModelCopyWithImpl;
@useResult
$Res call({
 String id, String email,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_superuser') bool isSuperuser,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, List<UserTenantModel> tenants
});




}
/// @nodoc
class _$UserWithTenantsModelCopyWithImpl<$Res>
    implements $UserWithTenantsModelCopyWith<$Res> {
  _$UserWithTenantsModelCopyWithImpl(this._self, this._then);

  final UserWithTenantsModel _self;
  final $Res Function(UserWithTenantsModel) _then;

/// Create a copy of UserWithTenantsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? fullName = freezed,Object? isActive = null,Object? isSuperuser = null,Object? createdAt = null,Object? updatedAt = null,Object? tenants = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isSuperuser: null == isSuperuser ? _self.isSuperuser : isSuperuser // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,tenants: null == tenants ? _self.tenants : tenants // ignore: cast_nullable_to_non_nullable
as List<UserTenantModel>,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_superuser')  bool isSuperuser, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  List<UserTenantModel> tenants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserWithTenantsModel() when $default != null:
return $default(_that.id,_that.email,_that.fullName,_that.isActive,_that.isSuperuser,_that.createdAt,_that.updatedAt,_that.tenants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_superuser')  bool isSuperuser, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  List<UserTenantModel> tenants)  $default,) {final _that = this;
switch (_that) {
case _UserWithTenantsModel():
return $default(_that.id,_that.email,_that.fullName,_that.isActive,_that.isSuperuser,_that.createdAt,_that.updatedAt,_that.tenants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_superuser')  bool isSuperuser, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  List<UserTenantModel> tenants)?  $default,) {final _that = this;
switch (_that) {
case _UserWithTenantsModel() when $default != null:
return $default(_that.id,_that.email,_that.fullName,_that.isActive,_that.isSuperuser,_that.createdAt,_that.updatedAt,_that.tenants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserWithTenantsModel extends UserWithTenantsModel {
  const _UserWithTenantsModel({required this.id, required this.email, @JsonKey(name: 'full_name') this.fullName, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'is_superuser') required this.isSuperuser, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required final  List<UserTenantModel> tenants}): _tenants = tenants,super._();
  factory _UserWithTenantsModel.fromJson(Map<String, dynamic> json) => _$UserWithTenantsModelFromJson(json);

@override final  String id;
@override final  String email;
@override@JsonKey(name: 'full_name') final  String? fullName;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'is_superuser') final  bool isSuperuser;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserWithTenantsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isSuperuser, isSuperuser) || other.isSuperuser == isSuperuser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._tenants, _tenants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName,isActive,isSuperuser,createdAt,updatedAt,const DeepCollectionEquality().hash(_tenants));

@override
String toString() {
  return 'UserWithTenantsModel(id: $id, email: $email, fullName: $fullName, isActive: $isActive, isSuperuser: $isSuperuser, createdAt: $createdAt, updatedAt: $updatedAt, tenants: $tenants)';
}


}

/// @nodoc
abstract mixin class _$UserWithTenantsModelCopyWith<$Res> implements $UserWithTenantsModelCopyWith<$Res> {
  factory _$UserWithTenantsModelCopyWith(_UserWithTenantsModel value, $Res Function(_UserWithTenantsModel) _then) = __$UserWithTenantsModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String email,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_superuser') bool isSuperuser,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, List<UserTenantModel> tenants
});




}
/// @nodoc
class __$UserWithTenantsModelCopyWithImpl<$Res>
    implements _$UserWithTenantsModelCopyWith<$Res> {
  __$UserWithTenantsModelCopyWithImpl(this._self, this._then);

  final _UserWithTenantsModel _self;
  final $Res Function(_UserWithTenantsModel) _then;

/// Create a copy of UserWithTenantsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? fullName = freezed,Object? isActive = null,Object? isSuperuser = null,Object? createdAt = null,Object? updatedAt = null,Object? tenants = null,}) {
  return _then(_UserWithTenantsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isSuperuser: null == isSuperuser ? _self.isSuperuser : isSuperuser // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,tenants: null == tenants ? _self._tenants : tenants // ignore: cast_nullable_to_non_nullable
as List<UserTenantModel>,
  ));
}


}

// dart format on
