// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceModel {

 String get id;@JsonKey(name: 'subscription_id') String get subscriptionId; double get amount; String get status;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'paid_at') DateTime? get paidAt;@JsonKey(name: 'invoice_url') String? get invoiceUrl;
/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceModelCopyWith<InvoiceModel> get copyWith => _$InvoiceModelCopyWithImpl<InvoiceModel>(this as InvoiceModel, _$identity);

  /// Serializes this InvoiceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.invoiceUrl, invoiceUrl) || other.invoiceUrl == invoiceUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,subscriptionId,amount,status,createdAt,paidAt,invoiceUrl);

@override
String toString() {
  return 'InvoiceModel(id: $id, subscriptionId: $subscriptionId, amount: $amount, status: $status, createdAt: $createdAt, paidAt: $paidAt, invoiceUrl: $invoiceUrl)';
}


}

/// @nodoc
abstract mixin class $InvoiceModelCopyWith<$Res>  {
  factory $InvoiceModelCopyWith(InvoiceModel value, $Res Function(InvoiceModel) _then) = _$InvoiceModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'subscription_id') String subscriptionId, double amount, String status,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'paid_at') DateTime? paidAt,@JsonKey(name: 'invoice_url') String? invoiceUrl
});




}
/// @nodoc
class _$InvoiceModelCopyWithImpl<$Res>
    implements $InvoiceModelCopyWith<$Res> {
  _$InvoiceModelCopyWithImpl(this._self, this._then);

  final InvoiceModel _self;
  final $Res Function(InvoiceModel) _then;

/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? subscriptionId = null,Object? amount = null,Object? status = null,Object? createdAt = null,Object? paidAt = freezed,Object? invoiceUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,subscriptionId: null == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,invoiceUrl: freezed == invoiceUrl ? _self.invoiceUrl : invoiceUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceModel].
extension InvoiceModelPatterns on InvoiceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceModel value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceModel value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'subscription_id')  String subscriptionId,  double amount,  String status, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'paid_at')  DateTime? paidAt, @JsonKey(name: 'invoice_url')  String? invoiceUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceModel() when $default != null:
return $default(_that.id,_that.subscriptionId,_that.amount,_that.status,_that.createdAt,_that.paidAt,_that.invoiceUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'subscription_id')  String subscriptionId,  double amount,  String status, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'paid_at')  DateTime? paidAt, @JsonKey(name: 'invoice_url')  String? invoiceUrl)  $default,) {final _that = this;
switch (_that) {
case _InvoiceModel():
return $default(_that.id,_that.subscriptionId,_that.amount,_that.status,_that.createdAt,_that.paidAt,_that.invoiceUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'subscription_id')  String subscriptionId,  double amount,  String status, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'paid_at')  DateTime? paidAt, @JsonKey(name: 'invoice_url')  String? invoiceUrl)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceModel() when $default != null:
return $default(_that.id,_that.subscriptionId,_that.amount,_that.status,_that.createdAt,_that.paidAt,_that.invoiceUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceModel extends InvoiceModel {
  const _InvoiceModel({required this.id, @JsonKey(name: 'subscription_id') required this.subscriptionId, required this.amount, required this.status, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'paid_at') this.paidAt, @JsonKey(name: 'invoice_url') this.invoiceUrl}): super._();
  factory _InvoiceModel.fromJson(Map<String, dynamic> json) => _$InvoiceModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'subscription_id') final  String subscriptionId;
@override final  double amount;
@override final  String status;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'paid_at') final  DateTime? paidAt;
@override@JsonKey(name: 'invoice_url') final  String? invoiceUrl;

/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceModelCopyWith<_InvoiceModel> get copyWith => __$InvoiceModelCopyWithImpl<_InvoiceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.invoiceUrl, invoiceUrl) || other.invoiceUrl == invoiceUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,subscriptionId,amount,status,createdAt,paidAt,invoiceUrl);

@override
String toString() {
  return 'InvoiceModel(id: $id, subscriptionId: $subscriptionId, amount: $amount, status: $status, createdAt: $createdAt, paidAt: $paidAt, invoiceUrl: $invoiceUrl)';
}


}

/// @nodoc
abstract mixin class _$InvoiceModelCopyWith<$Res> implements $InvoiceModelCopyWith<$Res> {
  factory _$InvoiceModelCopyWith(_InvoiceModel value, $Res Function(_InvoiceModel) _then) = __$InvoiceModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'subscription_id') String subscriptionId, double amount, String status,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'paid_at') DateTime? paidAt,@JsonKey(name: 'invoice_url') String? invoiceUrl
});




}
/// @nodoc
class __$InvoiceModelCopyWithImpl<$Res>
    implements _$InvoiceModelCopyWith<$Res> {
  __$InvoiceModelCopyWithImpl(this._self, this._then);

  final _InvoiceModel _self;
  final $Res Function(_InvoiceModel) _then;

/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? subscriptionId = null,Object? amount = null,Object? status = null,Object? createdAt = null,Object? paidAt = freezed,Object? invoiceUrl = freezed,}) {
  return _then(_InvoiceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,subscriptionId: null == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,invoiceUrl: freezed == invoiceUrl ? _self.invoiceUrl : invoiceUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
