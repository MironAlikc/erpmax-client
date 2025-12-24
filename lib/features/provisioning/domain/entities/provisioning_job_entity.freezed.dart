// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provisioning_job_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProvisioningJobEntity {

 String get id; String get tenantId; String get jobType; String get status; DateTime get createdAt; DateTime? get startedAt; DateTime? get completedAt; String? get errorMessage; Map<String, dynamic>? get metadata;
/// Create a copy of ProvisioningJobEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProvisioningJobEntityCopyWith<ProvisioningJobEntity> get copyWith => _$ProvisioningJobEntityCopyWithImpl<ProvisioningJobEntity>(this as ProvisioningJobEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProvisioningJobEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}


@override
int get hashCode => Object.hash(runtimeType,id,tenantId,jobType,status,createdAt,startedAt,completedAt,errorMessage,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ProvisioningJobEntity(id: $id, tenantId: $tenantId, jobType: $jobType, status: $status, createdAt: $createdAt, startedAt: $startedAt, completedAt: $completedAt, errorMessage: $errorMessage, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ProvisioningJobEntityCopyWith<$Res>  {
  factory $ProvisioningJobEntityCopyWith(ProvisioningJobEntity value, $Res Function(ProvisioningJobEntity) _then) = _$ProvisioningJobEntityCopyWithImpl;
@useResult
$Res call({
 String id, String tenantId, String jobType, String status, DateTime createdAt, DateTime? startedAt, DateTime? completedAt, String? errorMessage, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$ProvisioningJobEntityCopyWithImpl<$Res>
    implements $ProvisioningJobEntityCopyWith<$Res> {
  _$ProvisioningJobEntityCopyWithImpl(this._self, this._then);

  final ProvisioningJobEntity _self;
  final $Res Function(ProvisioningJobEntity) _then;

/// Create a copy of ProvisioningJobEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tenantId = null,Object? jobType = null,Object? status = null,Object? createdAt = null,Object? startedAt = freezed,Object? completedAt = freezed,Object? errorMessage = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,jobType: null == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProvisioningJobEntity].
extension ProvisioningJobEntityPatterns on ProvisioningJobEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProvisioningJobEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProvisioningJobEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProvisioningJobEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProvisioningJobEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProvisioningJobEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProvisioningJobEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tenantId,  String jobType,  String status,  DateTime createdAt,  DateTime? startedAt,  DateTime? completedAt,  String? errorMessage,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProvisioningJobEntity() when $default != null:
return $default(_that.id,_that.tenantId,_that.jobType,_that.status,_that.createdAt,_that.startedAt,_that.completedAt,_that.errorMessage,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tenantId,  String jobType,  String status,  DateTime createdAt,  DateTime? startedAt,  DateTime? completedAt,  String? errorMessage,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _ProvisioningJobEntity():
return $default(_that.id,_that.tenantId,_that.jobType,_that.status,_that.createdAt,_that.startedAt,_that.completedAt,_that.errorMessage,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tenantId,  String jobType,  String status,  DateTime createdAt,  DateTime? startedAt,  DateTime? completedAt,  String? errorMessage,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _ProvisioningJobEntity() when $default != null:
return $default(_that.id,_that.tenantId,_that.jobType,_that.status,_that.createdAt,_that.startedAt,_that.completedAt,_that.errorMessage,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc


class _ProvisioningJobEntity implements ProvisioningJobEntity {
  const _ProvisioningJobEntity({required this.id, required this.tenantId, required this.jobType, required this.status, required this.createdAt, this.startedAt, this.completedAt, this.errorMessage, final  Map<String, dynamic>? metadata}): _metadata = metadata;
  

@override final  String id;
@override final  String tenantId;
@override final  String jobType;
@override final  String status;
@override final  DateTime createdAt;
@override final  DateTime? startedAt;
@override final  DateTime? completedAt;
@override final  String? errorMessage;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ProvisioningJobEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProvisioningJobEntityCopyWith<_ProvisioningJobEntity> get copyWith => __$ProvisioningJobEntityCopyWithImpl<_ProvisioningJobEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProvisioningJobEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}


@override
int get hashCode => Object.hash(runtimeType,id,tenantId,jobType,status,createdAt,startedAt,completedAt,errorMessage,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ProvisioningJobEntity(id: $id, tenantId: $tenantId, jobType: $jobType, status: $status, createdAt: $createdAt, startedAt: $startedAt, completedAt: $completedAt, errorMessage: $errorMessage, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ProvisioningJobEntityCopyWith<$Res> implements $ProvisioningJobEntityCopyWith<$Res> {
  factory _$ProvisioningJobEntityCopyWith(_ProvisioningJobEntity value, $Res Function(_ProvisioningJobEntity) _then) = __$ProvisioningJobEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String tenantId, String jobType, String status, DateTime createdAt, DateTime? startedAt, DateTime? completedAt, String? errorMessage, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$ProvisioningJobEntityCopyWithImpl<$Res>
    implements _$ProvisioningJobEntityCopyWith<$Res> {
  __$ProvisioningJobEntityCopyWithImpl(this._self, this._then);

  final _ProvisioningJobEntity _self;
  final $Res Function(_ProvisioningJobEntity) _then;

/// Create a copy of ProvisioningJobEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tenantId = null,Object? jobType = null,Object? status = null,Object? createdAt = null,Object? startedAt = freezed,Object? completedAt = freezed,Object? errorMessage = freezed,Object? metadata = freezed,}) {
  return _then(_ProvisioningJobEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tenantId: null == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String,jobType: null == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
