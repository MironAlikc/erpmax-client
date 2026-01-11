// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionModel {

 String? get id;@JsonKey(name: 'tenant_id') String? get tenantId;@JsonKey(name: 'plan_id') String? get planId;@JsonKey(name: 'plan_name') String? get planName; String? get status;@JsonKey(name: 'billing_period') String? get billingPeriod;@JsonKey(defaultValue: 0.0) double? get amount;@JsonKey(name: 'current_period_start') DateTime? get currentPeriodStart;@JsonKey(name: 'current_period_end') DateTime? get currentPeriodEnd;@JsonKey(name: 'cancel_at_period_end', defaultValue: false) bool? get cancelAtPeriodEnd;@JsonKey(name: 'canceled_at') DateTime? get canceledAt;@JsonKey(name: 'trial_end') DateTime? get trialEnd;
/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionModelCopyWith<SubscriptionModel> get copyWith => _$SubscriptionModelCopyWithImpl<SubscriptionModel>(this as SubscriptionModel, _$identity);

  /// Serializes this SubscriptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.status, status) || other.status == status)&&(identical(other.billingPeriod, billingPeriod) || other.billingPeriod == billingPeriod)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currentPeriodStart, currentPeriodStart) || other.currentPeriodStart == currentPeriodStart)&&(identical(other.currentPeriodEnd, currentPeriodEnd) || other.currentPeriodEnd == currentPeriodEnd)&&(identical(other.cancelAtPeriodEnd, cancelAtPeriodEnd) || other.cancelAtPeriodEnd == cancelAtPeriodEnd)&&(identical(other.canceledAt, canceledAt) || other.canceledAt == canceledAt)&&(identical(other.trialEnd, trialEnd) || other.trialEnd == trialEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenantId,planId,planName,status,billingPeriod,amount,currentPeriodStart,currentPeriodEnd,cancelAtPeriodEnd,canceledAt,trialEnd);

@override
String toString() {
  return 'SubscriptionModel(id: $id, tenantId: $tenantId, planId: $planId, planName: $planName, status: $status, billingPeriod: $billingPeriod, amount: $amount, currentPeriodStart: $currentPeriodStart, currentPeriodEnd: $currentPeriodEnd, cancelAtPeriodEnd: $cancelAtPeriodEnd, canceledAt: $canceledAt, trialEnd: $trialEnd)';
}


}

/// @nodoc
abstract mixin class $SubscriptionModelCopyWith<$Res>  {
  factory $SubscriptionModelCopyWith(SubscriptionModel value, $Res Function(SubscriptionModel) _then) = _$SubscriptionModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'plan_id') String? planId,@JsonKey(name: 'plan_name') String? planName, String? status,@JsonKey(name: 'billing_period') String? billingPeriod,@JsonKey(defaultValue: 0.0) double? amount,@JsonKey(name: 'current_period_start') DateTime? currentPeriodStart,@JsonKey(name: 'current_period_end') DateTime? currentPeriodEnd,@JsonKey(name: 'cancel_at_period_end', defaultValue: false) bool? cancelAtPeriodEnd,@JsonKey(name: 'canceled_at') DateTime? canceledAt,@JsonKey(name: 'trial_end') DateTime? trialEnd
});




}
/// @nodoc
class _$SubscriptionModelCopyWithImpl<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  _$SubscriptionModelCopyWithImpl(this._self, this._then);

  final SubscriptionModel _self;
  final $Res Function(SubscriptionModel) _then;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tenantId = freezed,Object? planId = freezed,Object? planName = freezed,Object? status = freezed,Object? billingPeriod = freezed,Object? amount = freezed,Object? currentPeriodStart = freezed,Object? currentPeriodEnd = freezed,Object? cancelAtPeriodEnd = freezed,Object? canceledAt = freezed,Object? trialEnd = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,planId: freezed == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String?,planName: freezed == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,billingPeriod: freezed == billingPeriod ? _self.billingPeriod : billingPeriod // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,currentPeriodStart: freezed == currentPeriodStart ? _self.currentPeriodStart : currentPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,currentPeriodEnd: freezed == currentPeriodEnd ? _self.currentPeriodEnd : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelAtPeriodEnd: freezed == cancelAtPeriodEnd ? _self.cancelAtPeriodEnd : cancelAtPeriodEnd // ignore: cast_nullable_to_non_nullable
as bool?,canceledAt: freezed == canceledAt ? _self.canceledAt : canceledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,trialEnd: freezed == trialEnd ? _self.trialEnd : trialEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionModel].
extension SubscriptionModelPatterns on SubscriptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionModel value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'plan_id')  String? planId, @JsonKey(name: 'plan_name')  String? planName,  String? status, @JsonKey(name: 'billing_period')  String? billingPeriod, @JsonKey(defaultValue: 0.0)  double? amount, @JsonKey(name: 'current_period_start')  DateTime? currentPeriodStart, @JsonKey(name: 'current_period_end')  DateTime? currentPeriodEnd, @JsonKey(name: 'cancel_at_period_end', defaultValue: false)  bool? cancelAtPeriodEnd, @JsonKey(name: 'canceled_at')  DateTime? canceledAt, @JsonKey(name: 'trial_end')  DateTime? trialEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'plan_id')  String? planId, @JsonKey(name: 'plan_name')  String? planName,  String? status, @JsonKey(name: 'billing_period')  String? billingPeriod, @JsonKey(defaultValue: 0.0)  double? amount, @JsonKey(name: 'current_period_start')  DateTime? currentPeriodStart, @JsonKey(name: 'current_period_end')  DateTime? currentPeriodEnd, @JsonKey(name: 'cancel_at_period_end', defaultValue: false)  bool? cancelAtPeriodEnd, @JsonKey(name: 'canceled_at')  DateTime? canceledAt, @JsonKey(name: 'trial_end')  DateTime? trialEnd)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'plan_id')  String? planId, @JsonKey(name: 'plan_name')  String? planName,  String? status, @JsonKey(name: 'billing_period')  String? billingPeriod, @JsonKey(defaultValue: 0.0)  double? amount, @JsonKey(name: 'current_period_start')  DateTime? currentPeriodStart, @JsonKey(name: 'current_period_end')  DateTime? currentPeriodEnd, @JsonKey(name: 'cancel_at_period_end', defaultValue: false)  bool? cancelAtPeriodEnd, @JsonKey(name: 'canceled_at')  DateTime? canceledAt, @JsonKey(name: 'trial_end')  DateTime? trialEnd)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
return $default(_that.id,_that.tenantId,_that.planId,_that.planName,_that.status,_that.billingPeriod,_that.amount,_that.currentPeriodStart,_that.currentPeriodEnd,_that.cancelAtPeriodEnd,_that.canceledAt,_that.trialEnd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionModel extends SubscriptionModel {
  const _SubscriptionModel({this.id, @JsonKey(name: 'tenant_id') this.tenantId, @JsonKey(name: 'plan_id') this.planId, @JsonKey(name: 'plan_name') this.planName, this.status, @JsonKey(name: 'billing_period') this.billingPeriod, @JsonKey(defaultValue: 0.0) this.amount, @JsonKey(name: 'current_period_start') this.currentPeriodStart, @JsonKey(name: 'current_period_end') this.currentPeriodEnd, @JsonKey(name: 'cancel_at_period_end', defaultValue: false) this.cancelAtPeriodEnd, @JsonKey(name: 'canceled_at') this.canceledAt, @JsonKey(name: 'trial_end') this.trialEnd}): super._();
  factory _SubscriptionModel.fromJson(Map<String, dynamic> json) => _$SubscriptionModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'tenant_id') final  String? tenantId;
@override@JsonKey(name: 'plan_id') final  String? planId;
@override@JsonKey(name: 'plan_name') final  String? planName;
@override final  String? status;
@override@JsonKey(name: 'billing_period') final  String? billingPeriod;
@override@JsonKey(defaultValue: 0.0) final  double? amount;
@override@JsonKey(name: 'current_period_start') final  DateTime? currentPeriodStart;
@override@JsonKey(name: 'current_period_end') final  DateTime? currentPeriodEnd;
@override@JsonKey(name: 'cancel_at_period_end', defaultValue: false) final  bool? cancelAtPeriodEnd;
@override@JsonKey(name: 'canceled_at') final  DateTime? canceledAt;
@override@JsonKey(name: 'trial_end') final  DateTime? trialEnd;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionModelCopyWith<_SubscriptionModel> get copyWith => __$SubscriptionModelCopyWithImpl<_SubscriptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.status, status) || other.status == status)&&(identical(other.billingPeriod, billingPeriod) || other.billingPeriod == billingPeriod)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currentPeriodStart, currentPeriodStart) || other.currentPeriodStart == currentPeriodStart)&&(identical(other.currentPeriodEnd, currentPeriodEnd) || other.currentPeriodEnd == currentPeriodEnd)&&(identical(other.cancelAtPeriodEnd, cancelAtPeriodEnd) || other.cancelAtPeriodEnd == cancelAtPeriodEnd)&&(identical(other.canceledAt, canceledAt) || other.canceledAt == canceledAt)&&(identical(other.trialEnd, trialEnd) || other.trialEnd == trialEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenantId,planId,planName,status,billingPeriod,amount,currentPeriodStart,currentPeriodEnd,cancelAtPeriodEnd,canceledAt,trialEnd);

@override
String toString() {
  return 'SubscriptionModel(id: $id, tenantId: $tenantId, planId: $planId, planName: $planName, status: $status, billingPeriod: $billingPeriod, amount: $amount, currentPeriodStart: $currentPeriodStart, currentPeriodEnd: $currentPeriodEnd, cancelAtPeriodEnd: $cancelAtPeriodEnd, canceledAt: $canceledAt, trialEnd: $trialEnd)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionModelCopyWith<$Res> implements $SubscriptionModelCopyWith<$Res> {
  factory _$SubscriptionModelCopyWith(_SubscriptionModel value, $Res Function(_SubscriptionModel) _then) = __$SubscriptionModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'plan_id') String? planId,@JsonKey(name: 'plan_name') String? planName, String? status,@JsonKey(name: 'billing_period') String? billingPeriod,@JsonKey(defaultValue: 0.0) double? amount,@JsonKey(name: 'current_period_start') DateTime? currentPeriodStart,@JsonKey(name: 'current_period_end') DateTime? currentPeriodEnd,@JsonKey(name: 'cancel_at_period_end', defaultValue: false) bool? cancelAtPeriodEnd,@JsonKey(name: 'canceled_at') DateTime? canceledAt,@JsonKey(name: 'trial_end') DateTime? trialEnd
});




}
/// @nodoc
class __$SubscriptionModelCopyWithImpl<$Res>
    implements _$SubscriptionModelCopyWith<$Res> {
  __$SubscriptionModelCopyWithImpl(this._self, this._then);

  final _SubscriptionModel _self;
  final $Res Function(_SubscriptionModel) _then;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tenantId = freezed,Object? planId = freezed,Object? planName = freezed,Object? status = freezed,Object? billingPeriod = freezed,Object? amount = freezed,Object? currentPeriodStart = freezed,Object? currentPeriodEnd = freezed,Object? cancelAtPeriodEnd = freezed,Object? canceledAt = freezed,Object? trialEnd = freezed,}) {
  return _then(_SubscriptionModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,planId: freezed == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as String?,planName: freezed == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,billingPeriod: freezed == billingPeriod ? _self.billingPeriod : billingPeriod // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,currentPeriodStart: freezed == currentPeriodStart ? _self.currentPeriodStart : currentPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,currentPeriodEnd: freezed == currentPeriodEnd ? _self.currentPeriodEnd : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelAtPeriodEnd: freezed == cancelAtPeriodEnd ? _self.cancelAtPeriodEnd : cancelAtPeriodEnd // ignore: cast_nullable_to_non_nullable
as bool?,canceledAt: freezed == canceledAt ? _self.canceledAt : canceledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,trialEnd: freezed == trialEnd ? _self.trialEnd : trialEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
