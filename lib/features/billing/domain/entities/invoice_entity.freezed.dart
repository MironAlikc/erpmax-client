// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InvoiceEntity {

 String get id; String get subscriptionId; double get amount; String get status; DateTime get createdAt; DateTime? get paidAt; String? get invoiceUrl;
/// Create a copy of InvoiceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceEntityCopyWith<InvoiceEntity> get copyWith => _$InvoiceEntityCopyWithImpl<InvoiceEntity>(this as InvoiceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.invoiceUrl, invoiceUrl) || other.invoiceUrl == invoiceUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,subscriptionId,amount,status,createdAt,paidAt,invoiceUrl);

@override
String toString() {
  return 'InvoiceEntity(id: $id, subscriptionId: $subscriptionId, amount: $amount, status: $status, createdAt: $createdAt, paidAt: $paidAt, invoiceUrl: $invoiceUrl)';
}


}

/// @nodoc
abstract mixin class $InvoiceEntityCopyWith<$Res>  {
  factory $InvoiceEntityCopyWith(InvoiceEntity value, $Res Function(InvoiceEntity) _then) = _$InvoiceEntityCopyWithImpl;
@useResult
$Res call({
 String id, String subscriptionId, double amount, String status, DateTime createdAt, DateTime? paidAt, String? invoiceUrl
});




}
/// @nodoc
class _$InvoiceEntityCopyWithImpl<$Res>
    implements $InvoiceEntityCopyWith<$Res> {
  _$InvoiceEntityCopyWithImpl(this._self, this._then);

  final InvoiceEntity _self;
  final $Res Function(InvoiceEntity) _then;

/// Create a copy of InvoiceEntity
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


/// Adds pattern-matching-related methods to [InvoiceEntity].
extension InvoiceEntityPatterns on InvoiceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceEntity value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String subscriptionId,  double amount,  String status,  DateTime createdAt,  DateTime? paidAt,  String? invoiceUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String subscriptionId,  double amount,  String status,  DateTime createdAt,  DateTime? paidAt,  String? invoiceUrl)  $default,) {final _that = this;
switch (_that) {
case _InvoiceEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String subscriptionId,  double amount,  String status,  DateTime createdAt,  DateTime? paidAt,  String? invoiceUrl)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceEntity() when $default != null:
return $default(_that.id,_that.subscriptionId,_that.amount,_that.status,_that.createdAt,_that.paidAt,_that.invoiceUrl);case _:
  return null;

}
}

}

/// @nodoc


class _InvoiceEntity implements InvoiceEntity {
  const _InvoiceEntity({required this.id, required this.subscriptionId, required this.amount, required this.status, required this.createdAt, this.paidAt, this.invoiceUrl});
  

@override final  String id;
@override final  String subscriptionId;
@override final  double amount;
@override final  String status;
@override final  DateTime createdAt;
@override final  DateTime? paidAt;
@override final  String? invoiceUrl;

/// Create a copy of InvoiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceEntityCopyWith<_InvoiceEntity> get copyWith => __$InvoiceEntityCopyWithImpl<_InvoiceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.invoiceUrl, invoiceUrl) || other.invoiceUrl == invoiceUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,subscriptionId,amount,status,createdAt,paidAt,invoiceUrl);

@override
String toString() {
  return 'InvoiceEntity(id: $id, subscriptionId: $subscriptionId, amount: $amount, status: $status, createdAt: $createdAt, paidAt: $paidAt, invoiceUrl: $invoiceUrl)';
}


}

/// @nodoc
abstract mixin class _$InvoiceEntityCopyWith<$Res> implements $InvoiceEntityCopyWith<$Res> {
  factory _$InvoiceEntityCopyWith(_InvoiceEntity value, $Res Function(_InvoiceEntity) _then) = __$InvoiceEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String subscriptionId, double amount, String status, DateTime createdAt, DateTime? paidAt, String? invoiceUrl
});




}
/// @nodoc
class __$InvoiceEntityCopyWithImpl<$Res>
    implements _$InvoiceEntityCopyWith<$Res> {
  __$InvoiceEntityCopyWithImpl(this._self, this._then);

  final _InvoiceEntity _self;
  final $Res Function(_InvoiceEntity) _then;

/// Create a copy of InvoiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? subscriptionId = null,Object? amount = null,Object? status = null,Object? createdAt = null,Object? paidAt = freezed,Object? invoiceUrl = freezed,}) {
  return _then(_InvoiceEntity(
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
