// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanModel {

 String get id; String get name; String get description;@JsonKey(name: 'monthly_price') double get monthlyPrice;@JsonKey(name: 'yearly_price') double get yearlyPrice; Map<String, dynamic> get features;@JsonKey(name: 'max_users') int get maxUsers;@JsonKey(name: 'max_storage') int get maxStorage;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of PlanModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanModelCopyWith<PlanModel> get copyWith => _$PlanModelCopyWithImpl<PlanModel>(this as PlanModel, _$identity);

  /// Serializes this PlanModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.monthlyPrice, monthlyPrice) || other.monthlyPrice == monthlyPrice)&&(identical(other.yearlyPrice, yearlyPrice) || other.yearlyPrice == yearlyPrice)&&const DeepCollectionEquality().equals(other.features, features)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.maxStorage, maxStorage) || other.maxStorage == maxStorage)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,monthlyPrice,yearlyPrice,const DeepCollectionEquality().hash(features),maxUsers,maxStorage,isActive);

@override
String toString() {
  return 'PlanModel(id: $id, name: $name, description: $description, monthlyPrice: $monthlyPrice, yearlyPrice: $yearlyPrice, features: $features, maxUsers: $maxUsers, maxStorage: $maxStorage, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PlanModelCopyWith<$Res>  {
  factory $PlanModelCopyWith(PlanModel value, $Res Function(PlanModel) _then) = _$PlanModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description,@JsonKey(name: 'monthly_price') double monthlyPrice,@JsonKey(name: 'yearly_price') double yearlyPrice, Map<String, dynamic> features,@JsonKey(name: 'max_users') int maxUsers,@JsonKey(name: 'max_storage') int maxStorage,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class _$PlanModelCopyWithImpl<$Res>
    implements $PlanModelCopyWith<$Res> {
  _$PlanModelCopyWithImpl(this._self, this._then);

  final PlanModel _self;
  final $Res Function(PlanModel) _then;

/// Create a copy of PlanModel
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


/// Adds pattern-matching-related methods to [PlanModel].
extension PlanModelPatterns on PlanModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanModel value)  $default,){
final _that = this;
switch (_that) {
case _PlanModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlanModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description, @JsonKey(name: 'monthly_price')  double monthlyPrice, @JsonKey(name: 'yearly_price')  double yearlyPrice,  Map<String, dynamic> features, @JsonKey(name: 'max_users')  int maxUsers, @JsonKey(name: 'max_storage')  int maxStorage, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description, @JsonKey(name: 'monthly_price')  double monthlyPrice, @JsonKey(name: 'yearly_price')  double yearlyPrice,  Map<String, dynamic> features, @JsonKey(name: 'max_users')  int maxUsers, @JsonKey(name: 'max_storage')  int maxStorage, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _PlanModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description, @JsonKey(name: 'monthly_price')  double monthlyPrice, @JsonKey(name: 'yearly_price')  double yearlyPrice,  Map<String, dynamic> features, @JsonKey(name: 'max_users')  int maxUsers, @JsonKey(name: 'max_storage')  int maxStorage, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _PlanModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.monthlyPrice,_that.yearlyPrice,_that.features,_that.maxUsers,_that.maxStorage,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanModel extends PlanModel {
  const _PlanModel({required this.id, required this.name, required this.description, @JsonKey(name: 'monthly_price') required this.monthlyPrice, @JsonKey(name: 'yearly_price') required this.yearlyPrice, required final  Map<String, dynamic> features, @JsonKey(name: 'max_users') required this.maxUsers, @JsonKey(name: 'max_storage') required this.maxStorage, @JsonKey(name: 'is_active') required this.isActive}): _features = features,super._();
  factory _PlanModel.fromJson(Map<String, dynamic> json) => _$PlanModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override@JsonKey(name: 'monthly_price') final  double monthlyPrice;
@override@JsonKey(name: 'yearly_price') final  double yearlyPrice;
 final  Map<String, dynamic> _features;
@override Map<String, dynamic> get features {
  if (_features is EqualUnmodifiableMapView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_features);
}

@override@JsonKey(name: 'max_users') final  int maxUsers;
@override@JsonKey(name: 'max_storage') final  int maxStorage;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of PlanModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanModelCopyWith<_PlanModel> get copyWith => __$PlanModelCopyWithImpl<_PlanModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.monthlyPrice, monthlyPrice) || other.monthlyPrice == monthlyPrice)&&(identical(other.yearlyPrice, yearlyPrice) || other.yearlyPrice == yearlyPrice)&&const DeepCollectionEquality().equals(other._features, _features)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.maxStorage, maxStorage) || other.maxStorage == maxStorage)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,monthlyPrice,yearlyPrice,const DeepCollectionEquality().hash(_features),maxUsers,maxStorage,isActive);

@override
String toString() {
  return 'PlanModel(id: $id, name: $name, description: $description, monthlyPrice: $monthlyPrice, yearlyPrice: $yearlyPrice, features: $features, maxUsers: $maxUsers, maxStorage: $maxStorage, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$PlanModelCopyWith<$Res> implements $PlanModelCopyWith<$Res> {
  factory _$PlanModelCopyWith(_PlanModel value, $Res Function(_PlanModel) _then) = __$PlanModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description,@JsonKey(name: 'monthly_price') double monthlyPrice,@JsonKey(name: 'yearly_price') double yearlyPrice, Map<String, dynamic> features,@JsonKey(name: 'max_users') int maxUsers,@JsonKey(name: 'max_storage') int maxStorage,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class __$PlanModelCopyWithImpl<$Res>
    implements _$PlanModelCopyWith<$Res> {
  __$PlanModelCopyWithImpl(this._self, this._then);

  final _PlanModel _self;
  final $Res Function(_PlanModel) _then;

/// Create a copy of PlanModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? monthlyPrice = null,Object? yearlyPrice = null,Object? features = null,Object? maxUsers = null,Object? maxStorage = null,Object? isActive = null,}) {
  return _then(_PlanModel(
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
