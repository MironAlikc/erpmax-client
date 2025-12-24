// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlanEntity {

 String get id; String get name; String get description; double get monthlyPrice; double get yearlyPrice; Map<String, dynamic> get features; int get maxUsers; int get maxStorage; bool get isActive;
/// Create a copy of PlanEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanEntityCopyWith<PlanEntity> get copyWith => _$PlanEntityCopyWithImpl<PlanEntity>(this as PlanEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.monthlyPrice, monthlyPrice) || other.monthlyPrice == monthlyPrice)&&(identical(other.yearlyPrice, yearlyPrice) || other.yearlyPrice == yearlyPrice)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.maxStorage, maxStorage) || other.maxStorage == maxStorage)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,monthlyPrice,yearlyPrice,const DeepCollectionEquality().hash(features),maxUsers,maxStorage,isActive);

@override
String toString() {
  return 'PlanEntity(id: $id, name: $name, description: $description, monthlyPrice: $monthlyPrice, yearlyPrice: $yearlyPrice, features: $features, maxUsers: $maxUsers, maxStorage: $maxStorage, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PlanEntityCopyWith<$Res>  {
  factory $PlanEntityCopyWith(PlanEntity value, $Res Function(PlanEntity) _then) = _$PlanEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, double monthlyPrice, double yearlyPrice, Map<String, dynamic> features, int maxUsers, int maxStorage, bool isActive
});




}
/// @nodoc
class _$PlanEntityCopyWithImpl<$Res>
    implements $PlanEntityCopyWith<$Res> {
  _$PlanEntityCopyWithImpl(this._self, this._then);

  final PlanEntity _self;
  final $Res Function(PlanEntity) _then;

/// Create a copy of PlanEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? monthlyPrice = null,Object? yearlyPrice = null,Object? features = null,Object? maxUsers = null,Object? maxStorage = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,monthlyPrice: null == monthlyPrice ? _self.monthlyPrice : monthlyPrice // ignore: cast_nullable_to_non_nullable
as double,yearlyPrice: null == yearlyPrice ? _self.yearlyPrice : yearlyPrice // ignore: cast_nullable_to_non_nullable
as double,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,maxUsers: null == maxUsers ? _self.maxUsers : maxUsers // ignore: cast_nullable_to_non_nullable
as int,maxStorage: null == maxStorage ? _self.maxStorage : maxStorage // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanEntity].
extension PlanEntityPatterns on PlanEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanEntity value)  $default,){
final _that = this;
switch (_that) {
case _PlanEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PlanEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double monthlyPrice,  double yearlyPrice,  Map<String, dynamic> features,  int maxUsers,  int maxStorage,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.monthlyPrice,_that.yearlyPrice,_that.features,_that.maxUsers,_that.maxStorage,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double monthlyPrice,  double yearlyPrice,  Map<String, dynamic> features,  int maxUsers,  int maxStorage,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _PlanEntity():
return $default(_that.id,_that.name,_that.description,_that.monthlyPrice,_that.yearlyPrice,_that.features,_that.maxUsers,_that.maxStorage,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  double monthlyPrice,  double yearlyPrice,  Map<String, dynamic> features,  int maxUsers,  int maxStorage,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _PlanEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.monthlyPrice,_that.yearlyPrice,_that.features,_that.maxUsers,_that.maxStorage,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc


class _PlanEntity implements PlanEntity {
  const _PlanEntity({required this.id, required this.name, required this.description, required this.monthlyPrice, required this.yearlyPrice, required final  Map<String, dynamic> features, required this.maxUsers, required this.maxStorage, required this.isActive}): _features = features;
  

@override final  String id;
@override final  String name;
@override final  String description;
@override final  double monthlyPrice;
@override final  double yearlyPrice;
 final  Map<String, dynamic> _features;
@override Map<String, dynamic> get features {
  if (_features is EqualUnmodifiableMapView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_features);
}

@override final  int maxUsers;
@override final  int maxStorage;
@override final  bool isActive;

/// Create a copy of PlanEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanEntityCopyWith<_PlanEntity> get copyWith => __$PlanEntityCopyWithImpl<_PlanEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.monthlyPrice, monthlyPrice) || other.monthlyPrice == monthlyPrice)&&(identical(other.yearlyPrice, yearlyPrice) || other.yearlyPrice == yearlyPrice)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.maxStorage, maxStorage) || other.maxStorage == maxStorage)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,monthlyPrice,yearlyPrice,const DeepCollectionEquality().hash(_features),maxUsers,maxStorage,isActive);

@override
String toString() {
  return 'PlanEntity(id: $id, name: $name, description: $description, monthlyPrice: $monthlyPrice, yearlyPrice: $yearlyPrice, features: $features, maxUsers: $maxUsers, maxStorage: $maxStorage, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$PlanEntityCopyWith<$Res> implements $PlanEntityCopyWith<$Res> {
  factory _$PlanEntityCopyWith(_PlanEntity value, $Res Function(_PlanEntity) _then) = __$PlanEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, double monthlyPrice, double yearlyPrice, Map<String, dynamic> features, int maxUsers, int maxStorage, bool isActive
});




}
/// @nodoc
class __$PlanEntityCopyWithImpl<$Res>
    implements _$PlanEntityCopyWith<$Res> {
  __$PlanEntityCopyWithImpl(this._self, this._then);

  final _PlanEntity _self;
  final $Res Function(_PlanEntity) _then;

/// Create a copy of PlanEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? monthlyPrice = null,Object? yearlyPrice = null,Object? features = null,Object? maxUsers = null,Object? maxStorage = null,Object? isActive = null,}) {
  return _then(_PlanEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,monthlyPrice: null == monthlyPrice ? _self.monthlyPrice : monthlyPrice // ignore: cast_nullable_to_non_nullable
as double,yearlyPrice: null == yearlyPrice ? _self.yearlyPrice : yearlyPrice // ignore: cast_nullable_to_non_nullable
as double,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,maxUsers: null == maxUsers ? _self.maxUsers : maxUsers // ignore: cast_nullable_to_non_nullable
as int,maxStorage: null == maxStorage ? _self.maxStorage : maxStorage // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
