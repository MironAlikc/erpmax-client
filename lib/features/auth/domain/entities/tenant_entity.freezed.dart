// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TenantEntity {

 String get id; String get name; String get slug; TenantStatus get status; String? get erpnextSiteUrl; Map<String, dynamic>? get settings; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TenantEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantEntityCopyWith<TenantEntity> get copyWith => _$TenantEntityCopyWithImpl<TenantEntity>(this as TenantEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.status, status) || other.status == status)&&(identical(other.erpnextSiteUrl, erpnextSiteUrl) || other.erpnextSiteUrl == erpnextSiteUrl)&&const DeepCollectionEquality().equals(other.settings, settings)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,status,erpnextSiteUrl,const DeepCollectionEquality().hash(settings),createdAt,updatedAt);

@override
String toString() {
  return 'TenantEntity(id: $id, name: $name, slug: $slug, status: $status, erpnextSiteUrl: $erpnextSiteUrl, settings: $settings, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TenantEntityCopyWith<$Res>  {
  factory $TenantEntityCopyWith(TenantEntity value, $Res Function(TenantEntity) _then) = _$TenantEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, TenantStatus status, String? erpnextSiteUrl, Map<String, dynamic>? settings, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TenantEntityCopyWithImpl<$Res>
    implements $TenantEntityCopyWith<$Res> {
  _$TenantEntityCopyWithImpl(this._self, this._then);

  final TenantEntity _self;
  final $Res Function(TenantEntity) _then;

/// Create a copy of TenantEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? status = null,Object? erpnextSiteUrl = freezed,Object? settings = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TenantStatus,erpnextSiteUrl: freezed == erpnextSiteUrl ? _self.erpnextSiteUrl : erpnextSiteUrl // ignore: cast_nullable_to_non_nullable
as String?,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TenantEntity].
extension TenantEntityPatterns on TenantEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantEntity value)  $default,){
final _that = this;
switch (_that) {
case _TenantEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TenantEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  TenantStatus status,  String? erpnextSiteUrl,  Map<String, dynamic>? settings,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.status,_that.erpnextSiteUrl,_that.settings,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  TenantStatus status,  String? erpnextSiteUrl,  Map<String, dynamic>? settings,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TenantEntity():
return $default(_that.id,_that.name,_that.slug,_that.status,_that.erpnextSiteUrl,_that.settings,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  TenantStatus status,  String? erpnextSiteUrl,  Map<String, dynamic>? settings,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TenantEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.status,_that.erpnextSiteUrl,_that.settings,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TenantEntity implements TenantEntity {
  const _TenantEntity({required this.id, required this.name, required this.slug, required this.status, this.erpnextSiteUrl, final  Map<String, dynamic>? settings, required this.createdAt, required this.updatedAt}): _settings = settings;
  

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  TenantStatus status;
@override final  String? erpnextSiteUrl;
 final  Map<String, dynamic>? _settings;
@override Map<String, dynamic>? get settings {
  final value = _settings;
  if (value == null) return null;
  if (_settings is EqualUnmodifiableMapView) return _settings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TenantEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantEntityCopyWith<_TenantEntity> get copyWith => __$TenantEntityCopyWithImpl<_TenantEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.status, status) || other.status == status)&&(identical(other.erpnextSiteUrl, erpnextSiteUrl) || other.erpnextSiteUrl == erpnextSiteUrl)&&const DeepCollectionEquality().equals(other._settings, _settings)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,status,erpnextSiteUrl,const DeepCollectionEquality().hash(_settings),createdAt,updatedAt);

@override
String toString() {
  return 'TenantEntity(id: $id, name: $name, slug: $slug, status: $status, erpnextSiteUrl: $erpnextSiteUrl, settings: $settings, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TenantEntityCopyWith<$Res> implements $TenantEntityCopyWith<$Res> {
  factory _$TenantEntityCopyWith(_TenantEntity value, $Res Function(_TenantEntity) _then) = __$TenantEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, TenantStatus status, String? erpnextSiteUrl, Map<String, dynamic>? settings, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TenantEntityCopyWithImpl<$Res>
    implements _$TenantEntityCopyWith<$Res> {
  __$TenantEntityCopyWithImpl(this._self, this._then);

  final _TenantEntity _self;
  final $Res Function(_TenantEntity) _then;

/// Create a copy of TenantEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? status = null,Object? erpnextSiteUrl = freezed,Object? settings = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TenantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TenantStatus,erpnextSiteUrl: freezed == erpnextSiteUrl ? _self.erpnextSiteUrl : erpnextSiteUrl // ignore: cast_nullable_to_non_nullable
as String?,settings: freezed == settings ? _self._settings : settings // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
