// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubscriptionEntity {

 String get id; String get tenantId; String get planId; String get planName; String get status; String get billingPeriod; double get amount; DateTime get currentPeriodStart; DateTime get currentPeriodEnd; bool get cancelAtPeriodEnd; DateTime? get canceledAt; DateTime? get trialEnd;
/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionEntityCopyWith<SubscriptionEntity> get copyWith => _$SubscriptionEntityCopyWithImpl<SubscriptionEntity>(this as SubscriptionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.status, status) || other.status == status)&&(identical(other.billingPeriod, billingPeriod) || other.billingPeriod == billingPeriod)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currentPeriodStart, currentPeriodStart) || other.currentPeriodStart == currentPeriodStart)&&(identical(other.currentPeriodEnd, currentPeriodEnd) || other.currentPeriodEnd == currentPeriodEnd)&&(identical(other.cancelAtPeriodEnd, cancelAtPeriodEnd) || other.cancelAtPeriodEnd == cancelAtPeriodEnd)&&(identical(other.canceledAt, canceledAt) || other.canceledAt == canceledAt)&&(identical(other.trialEnd, trialEnd) || other.trialEnd == trialEnd));
}


@override
int get hashCode => Object.hash(runtimeType,id,tenantId,planId,planName,status,billingPeriod,amount,currentPeriodStart,currentPeriodEnd,cancelAtPeriodEnd,canceledAt,trialEnd);

@override
String toString() {
  return 'SubscriptionEntity(id: $id, tenantId: $tenantId, planId: $planId, planName: $planName, status: $status, billingPeriod: $billingPeriod, amount: $amount, currentPeriodStart: $currentPeriodStart, currentPeriodEnd: $currentPeriodEnd, cancelAtPeriodEnd: $cancelAtPeriodEnd, canceledAt: $canceledAt, trialEnd: $trialEnd)';
}


}

/// @nodoc
abstract mixin class $SubscriptionEntityCopyWith<$Res>  {
  factory $SubscriptionEntityCopyWith(SubscriptionEntity value, $Res Function(SubscriptionEntity) _then) = _$SubscriptionEntityCopyWithImpl;
@useResult
$Res call({
 String id, String tenantId, String planId, String planName, String status, String billingPeriod, double amount, DateTime currentPeriodStart, DateTime currentPeriodEnd, bool cancelAtPeriodEnd, DateTime? canceledAt, DateTime? trialEnd
});




}
/// @nodoc
class _$SubscriptionEntityCopyWithImpl<$Res>
    implements $SubscriptionEntityCopyWith<$Res> {
  _$SubscriptionEntityCopyWithImpl(this._self, this._then);

  final SubscriptionEntity _self;
  final $Res Function(SubscriptionEntity) _then;

/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tenantId = null,Object? planId = null,Object? planName = null,Object? status = null,Object? billingPeriod = null,Object? amount = null,Object? currentPeriodStart = null,Object? currentPeriodEnd = null,Object? cancelAtPeriodEnd = null,Object? canceledAt = freezed,Object? trialEnd = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,billingPeriod: null == billingPeriod ? _self.billingPeriod : billingPeriod // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currentPeriodStart: null == currentPeriodStart ? _self.currentPeriodStart : currentPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime,currentPeriodEnd: null == currentPeriodEnd ? _self.currentPeriodEnd : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime,cancelAtPeriodEnd: null == cancelAtPeriodEnd ? _self.cancelAtPeriodEnd : cancelAtPeriodEnd // ignore: cast_nullable_to_non_nullable
as bool,canceledAt: freezed == canceledAt ? _self.canceledAt : canceledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,trialEnd: freezed == trialEnd ? _self.trialEnd : trialEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionEntity].
extension SubscriptionEntityPatterns on SubscriptionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionEntity value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tenantId,  String planId,  String planName,  String status,  String billingPeriod,  double amount,  DateTime currentPeriodStart,  DateTime currentPeriodEnd,  bool cancelAtPeriodEnd,  DateTime? canceledAt,  DateTime? trialEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionEntity() when $default != null:
return $default(_that.id,_that.tenantId,_that.planId,_that.planName,_that.status,_that.billingPeriod,_that.amount,_that.currentPeriodStart,_that.currentPeriodEnd,_that.cancelAtPeriodEnd,_that.canceledAt,_that.trialEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tenantId,  String planId,  String planName,  String status,  String billingPeriod,  double amount,  DateTime currentPeriodStart,  DateTime currentPeriodEnd,  bool cancelAtPeriodEnd,  DateTime? canceledAt,  DateTime? trialEnd)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionEntity():
return $default(_that.id,_that.tenantId,_that.planId,_that.planName,_that.status,_that.billingPeriod,_that.amount,_that.currentPeriodStart,_that.currentPeriodEnd,_that.cancelAtPeriodEnd,_that.canceledAt,_that.trialEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tenantId,  String planId,  String planName,  String status,  String billingPeriod,  double amount,  DateTime currentPeriodStart,  DateTime currentPeriodEnd,  bool cancelAtPeriodEnd,  DateTime? canceledAt,  DateTime? trialEnd)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionEntity() when $default != null:
return $default(_that.id,_that.tenantId,_that.planId,_that.planName,_that.status,_that.billingPeriod,_that.amount,_that.currentPeriodStart,_that.currentPeriodEnd,_that.cancelAtPeriodEnd,_that.canceledAt,_that.trialEnd);case _:
  return null;

}
}

}

/// @nodoc


class _SubscriptionEntity implements SubscriptionEntity {
  const _SubscriptionEntity({required this.id, required this.tenantId, required this.planId, required this.planName, required this.status, required this.billingPeriod, required this.amount, required this.currentPeriodStart, required this.currentPeriodEnd, required this.cancelAtPeriodEnd, this.canceledAt, this.trialEnd});
  

@override final  String id;
@override final  String tenantId;
@override final  String planId;
@override final  String planName;
@override final  String status;
@override final  String billingPeriod;
@override final  double amount;
@override final  DateTime currentPeriodStart;
@override final  DateTime currentPeriodEnd;
@override final  bool cancelAtPeriodEnd;
@override final  DateTime? canceledAt;
@override final  DateTime? trialEnd;

/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionEntityCopyWith<_SubscriptionEntity> get copyWith => __$SubscriptionEntityCopyWithImpl<_SubscriptionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.status, status) || other.status == status)&&(identical(other.billingPeriod, billingPeriod) || other.billingPeriod == billingPeriod)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currentPeriodStart, currentPeriodStart) || other.currentPeriodStart == currentPeriodStart)&&(identical(other.currentPeriodEnd, currentPeriodEnd) || other.currentPeriodEnd == currentPeriodEnd)&&(identical(other.cancelAtPeriodEnd, cancelAtPeriodEnd) || other.cancelAtPeriodEnd == cancelAtPeriodEnd)&&(identical(other.canceledAt, canceledAt) || other.canceledAt == canceledAt)&&(identical(other.trialEnd, trialEnd) || other.trialEnd == trialEnd));
}


@override
int get hashCode => Object.hash(runtimeType,id,tenantId,planId,planName,status,billingPeriod,amount,currentPeriodStart,currentPeriodEnd,cancelAtPeriodEnd,canceledAt,trialEnd);

@override
String toString() {
  return 'SubscriptionEntity(id: $id, tenantId: $tenantId, planId: $planId, planName: $planName, status: $status, billingPeriod: $billingPeriod, amount: $amount, currentPeriodStart: $currentPeriodStart, currentPeriodEnd: $currentPeriodEnd, cancelAtPeriodEnd: $cancelAtPeriodEnd, canceledAt: $canceledAt, trialEnd: $trialEnd)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionEntityCopyWith<$Res> implements $SubscriptionEntityCopyWith<$Res> {
  factory _$SubscriptionEntityCopyWith(_SubscriptionEntity value, $Res Function(_SubscriptionEntity) _then) = __$SubscriptionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String tenantId, String planId, String planName, String status, String billingPeriod, double amount, DateTime currentPeriodStart, DateTime currentPeriodEnd, bool cancelAtPeriodEnd, DateTime? canceledAt, DateTime? trialEnd
});




}
/// @nodoc
class __$SubscriptionEntityCopyWithImpl<$Res>
    implements _$SubscriptionEntityCopyWith<$Res> {
  __$SubscriptionEntityCopyWithImpl(this._self, this._then);

  final _SubscriptionEntity _self;
  final $Res Function(_SubscriptionEntity) _then;

/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tenantId = null,Object? planId = null,Object? planName = null,Object? status = null,Object? billingPeriod = null,Object? amount = null,Object? currentPeriodStart = null,Object? currentPeriodEnd = null,Object? cancelAtPeriodEnd = null,Object? canceledAt = freezed,Object? trialEnd = freezed,}) {
  return _then(_SubscriptionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,billingPeriod: null == billingPeriod ? _self.billingPeriod : billingPeriod // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currentPeriodStart: null == currentPeriodStart ? _self.currentPeriodStart : currentPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime,currentPeriodEnd: null == currentPeriodEnd ? _self.currentPeriodEnd : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime,cancelAtPeriodEnd: null == cancelAtPeriodEnd ? _self.cancelAtPeriodEnd : cancelAtPeriodEnd // ignore: cast_nullable_to_non_nullable
as bool,canceledAt: freezed == canceledAt ? _self.canceledAt : canceledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,trialEnd: freezed == trialEnd ? _self.trialEnd : trialEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
