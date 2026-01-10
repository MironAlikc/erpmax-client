// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provisioning_jobs_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProvisioningJobsResponseModel {

 List<ProvisioningJobModel> get data;
/// Create a copy of ProvisioningJobsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProvisioningJobsResponseModelCopyWith<ProvisioningJobsResponseModel> get copyWith => _$ProvisioningJobsResponseModelCopyWithImpl<ProvisioningJobsResponseModel>(this as ProvisioningJobsResponseModel, _$identity);

  /// Serializes this ProvisioningJobsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProvisioningJobsResponseModel&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ProvisioningJobsResponseModel(data: $data)';
}


}

/// @nodoc
abstract mixin class $ProvisioningJobsResponseModelCopyWith<$Res>  {
  factory $ProvisioningJobsResponseModelCopyWith(ProvisioningJobsResponseModel value, $Res Function(ProvisioningJobsResponseModel) _then) = _$ProvisioningJobsResponseModelCopyWithImpl;
@useResult
$Res call({
 List<ProvisioningJobModel> data
});




}
/// @nodoc
class _$ProvisioningJobsResponseModelCopyWithImpl<$Res>
    implements $ProvisioningJobsResponseModelCopyWith<$Res> {
  _$ProvisioningJobsResponseModelCopyWithImpl(this._self, this._then);

  final ProvisioningJobsResponseModel _self;
  final $Res Function(ProvisioningJobsResponseModel) _then;

/// Create a copy of ProvisioningJobsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ProvisioningJobModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProvisioningJobsResponseModel].
extension ProvisioningJobsResponseModelPatterns on ProvisioningJobsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProvisioningJobsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProvisioningJobsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProvisioningJobsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ProvisioningJobsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProvisioningJobsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProvisioningJobsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProvisioningJobModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProvisioningJobsResponseModel() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProvisioningJobModel> data)  $default,) {final _that = this;
switch (_that) {
case _ProvisioningJobsResponseModel():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProvisioningJobModel> data)?  $default,) {final _that = this;
switch (_that) {
case _ProvisioningJobsResponseModel() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProvisioningJobsResponseModel extends ProvisioningJobsResponseModel {
  const _ProvisioningJobsResponseModel({required final  List<ProvisioningJobModel> data}): _data = data,super._();
  factory _ProvisioningJobsResponseModel.fromJson(Map<String, dynamic> json) => _$ProvisioningJobsResponseModelFromJson(json);

 final  List<ProvisioningJobModel> _data;
@override List<ProvisioningJobModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ProvisioningJobsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProvisioningJobsResponseModelCopyWith<_ProvisioningJobsResponseModel> get copyWith => __$ProvisioningJobsResponseModelCopyWithImpl<_ProvisioningJobsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProvisioningJobsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProvisioningJobsResponseModel&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ProvisioningJobsResponseModel(data: $data)';
}


}

/// @nodoc
abstract mixin class _$ProvisioningJobsResponseModelCopyWith<$Res> implements $ProvisioningJobsResponseModelCopyWith<$Res> {
  factory _$ProvisioningJobsResponseModelCopyWith(_ProvisioningJobsResponseModel value, $Res Function(_ProvisioningJobsResponseModel) _then) = __$ProvisioningJobsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<ProvisioningJobModel> data
});




}
/// @nodoc
class __$ProvisioningJobsResponseModelCopyWithImpl<$Res>
    implements _$ProvisioningJobsResponseModelCopyWith<$Res> {
  __$ProvisioningJobsResponseModelCopyWithImpl(this._self, this._then);

  final _ProvisioningJobsResponseModel _self;
  final $Res Function(_ProvisioningJobsResponseModel) _then;

/// Create a copy of ProvisioningJobsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_ProvisioningJobsResponseModel(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ProvisioningJobModel>,
  ));
}


}

// dart format on
