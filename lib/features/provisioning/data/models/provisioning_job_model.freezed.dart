// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provisioning_job_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProvisioningJobModel {

 String? get id;@JsonKey(name: 'tenant_id') String? get tenantId;@JsonKey(name: 'job_type') String? get jobType; String? get status;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'started_at') DateTime? get startedAt;@JsonKey(name: 'completed_at') DateTime? get completedAt;@JsonKey(name: 'error_message') String? get errorMessage; Map<String, dynamic>? get metadata;
/// Create a copy of ProvisioningJobModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProvisioningJobModelCopyWith<ProvisioningJobModel> get copyWith => _$ProvisioningJobModelCopyWithImpl<ProvisioningJobModel>(this as ProvisioningJobModel, _$identity);

  /// Serializes this ProvisioningJobModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProvisioningJobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenantId,jobType,status,createdAt,startedAt,completedAt,errorMessage,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ProvisioningJobModel(id: $id, tenantId: $tenantId, jobType: $jobType, status: $status, createdAt: $createdAt, startedAt: $startedAt, completedAt: $completedAt, errorMessage: $errorMessage, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ProvisioningJobModelCopyWith<$Res>  {
  factory $ProvisioningJobModelCopyWith(ProvisioningJobModel value, $Res Function(ProvisioningJobModel) _then) = _$ProvisioningJobModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'job_type') String? jobType, String? status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'started_at') DateTime? startedAt,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'error_message') String? errorMessage, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$ProvisioningJobModelCopyWithImpl<$Res>
    implements $ProvisioningJobModelCopyWith<$Res> {
  _$ProvisioningJobModelCopyWithImpl(this._self, this._then);

  final ProvisioningJobModel _self;
  final $Res Function(ProvisioningJobModel) _then;

/// Create a copy of ProvisioningJobModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tenantId = freezed,Object? jobType = freezed,Object? status = freezed,Object? createdAt = freezed,Object? startedAt = freezed,Object? completedAt = freezed,Object? errorMessage = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProvisioningJobModel].
extension ProvisioningJobModelPatterns on ProvisioningJobModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProvisioningJobModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProvisioningJobModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProvisioningJobModel value)  $default,){
final _that = this;
switch (_that) {
case _ProvisioningJobModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProvisioningJobModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProvisioningJobModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'job_type')  String? jobType,  String? status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'error_message')  String? errorMessage,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProvisioningJobModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'job_type')  String? jobType,  String? status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'error_message')  String? errorMessage,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _ProvisioningJobModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'job_type')  String? jobType,  String? status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'error_message')  String? errorMessage,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _ProvisioningJobModel() when $default != null:
return $default(_that.id,_that.tenantId,_that.jobType,_that.status,_that.createdAt,_that.startedAt,_that.completedAt,_that.errorMessage,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProvisioningJobModel extends ProvisioningJobModel {
  const _ProvisioningJobModel({this.id, @JsonKey(name: 'tenant_id') this.tenantId, @JsonKey(name: 'job_type') this.jobType, this.status, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'started_at') this.startedAt, @JsonKey(name: 'completed_at') this.completedAt, @JsonKey(name: 'error_message') this.errorMessage, final  Map<String, dynamic>? metadata}): _metadata = metadata,super._();
  factory _ProvisioningJobModel.fromJson(Map<String, dynamic> json) => _$ProvisioningJobModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'tenant_id') final  String? tenantId;
@override@JsonKey(name: 'job_type') final  String? jobType;
@override final  String? status;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'started_at') final  DateTime? startedAt;
@override@JsonKey(name: 'completed_at') final  DateTime? completedAt;
@override@JsonKey(name: 'error_message') final  String? errorMessage;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ProvisioningJobModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProvisioningJobModelCopyWith<_ProvisioningJobModel> get copyWith => __$ProvisioningJobModelCopyWithImpl<_ProvisioningJobModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProvisioningJobModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProvisioningJobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenantId,jobType,status,createdAt,startedAt,completedAt,errorMessage,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ProvisioningJobModel(id: $id, tenantId: $tenantId, jobType: $jobType, status: $status, createdAt: $createdAt, startedAt: $startedAt, completedAt: $completedAt, errorMessage: $errorMessage, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ProvisioningJobModelCopyWith<$Res> implements $ProvisioningJobModelCopyWith<$Res> {
  factory _$ProvisioningJobModelCopyWith(_ProvisioningJobModel value, $Res Function(_ProvisioningJobModel) _then) = __$ProvisioningJobModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'job_type') String? jobType, String? status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'started_at') DateTime? startedAt,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'error_message') String? errorMessage, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$ProvisioningJobModelCopyWithImpl<$Res>
    implements _$ProvisioningJobModelCopyWith<$Res> {
  __$ProvisioningJobModelCopyWithImpl(this._self, this._then);

  final _ProvisioningJobModel _self;
  final $Res Function(_ProvisioningJobModel) _then;

/// Create a copy of ProvisioningJobModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tenantId = freezed,Object? jobType = freezed,Object? status = freezed,Object? createdAt = freezed,Object? startedAt = freezed,Object? completedAt = freezed,Object? errorMessage = freezed,Object? metadata = freezed,}) {
  return _then(_ProvisioningJobModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
