// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoices_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoicesResponseModel {

 List<InvoiceModel> get data;
/// Create a copy of InvoicesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoicesResponseModelCopyWith<InvoicesResponseModel> get copyWith => _$InvoicesResponseModelCopyWithImpl<InvoicesResponseModel>(this as InvoicesResponseModel, _$identity);

  /// Serializes this InvoicesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoicesResponseModel&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'InvoicesResponseModel(data: $data)';
}


}

/// @nodoc
abstract mixin class $InvoicesResponseModelCopyWith<$Res>  {
  factory $InvoicesResponseModelCopyWith(InvoicesResponseModel value, $Res Function(InvoicesResponseModel) _then) = _$InvoicesResponseModelCopyWithImpl;
@useResult
$Res call({
 List<InvoiceModel> data
});




}
/// @nodoc
class _$InvoicesResponseModelCopyWithImpl<$Res>
    implements $InvoicesResponseModelCopyWith<$Res> {
  _$InvoicesResponseModelCopyWithImpl(this._self, this._then);

  final InvoicesResponseModel _self;
  final $Res Function(InvoicesResponseModel) _then;

/// Create a copy of InvoicesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoicesResponseModel].
extension InvoicesResponseModelPatterns on InvoicesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoicesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoicesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoicesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _InvoicesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoicesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _InvoicesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<InvoiceModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoicesResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<InvoiceModel> data)  $default,) {final _that = this;
switch (_that) {
case _InvoicesResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<InvoiceModel> data)?  $default,) {final _that = this;
switch (_that) {
case _InvoicesResponseModel() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoicesResponseModel extends InvoicesResponseModel {
  const _InvoicesResponseModel({required final  List<InvoiceModel> data}): _data = data,super._();
  factory _InvoicesResponseModel.fromJson(Map<String, dynamic> json) => _$InvoicesResponseModelFromJson(json);

 final  List<InvoiceModel> _data;
@override List<InvoiceModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of InvoicesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoicesResponseModelCopyWith<_InvoicesResponseModel> get copyWith => __$InvoicesResponseModelCopyWithImpl<_InvoicesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoicesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoicesResponseModel&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'InvoicesResponseModel(data: $data)';
}


}

/// @nodoc
abstract mixin class _$InvoicesResponseModelCopyWith<$Res> implements $InvoicesResponseModelCopyWith<$Res> {
  factory _$InvoicesResponseModelCopyWith(_InvoicesResponseModel value, $Res Function(_InvoicesResponseModel) _then) = __$InvoicesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<InvoiceModel> data
});




}
/// @nodoc
class __$InvoicesResponseModelCopyWithImpl<$Res>
    implements _$InvoicesResponseModelCopyWith<$Res> {
  __$InvoicesResponseModelCopyWithImpl(this._self, this._then);

  final _InvoicesResponseModel _self;
  final $Res Function(_InvoicesResponseModel) _then;

/// Create a copy of InvoicesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_InvoicesResponseModel(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel>,
  ));
}


}

// dart format on
