// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Appointment {

 String get id; DateTime get scheduledAt; PatientSummary get patient; String get reason; bool get urgent; AppointmentStatus get status; String? get consultationId;
/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentCopyWith<Appointment> get copyWith => _$AppointmentCopyWithImpl<Appointment>(this as Appointment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Appointment&&(identical(other.id, id) || other.id == id)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.urgent, urgent) || other.urgent == urgent)&&(identical(other.status, status) || other.status == status)&&(identical(other.consultationId, consultationId) || other.consultationId == consultationId));
}


@override
int get hashCode => Object.hash(runtimeType,id,scheduledAt,patient,reason,urgent,status,consultationId);

@override
String toString() {
  return 'Appointment(id: $id, scheduledAt: $scheduledAt, patient: $patient, reason: $reason, urgent: $urgent, status: $status, consultationId: $consultationId)';
}


}

/// @nodoc
abstract mixin class $AppointmentCopyWith<$Res>  {
  factory $AppointmentCopyWith(Appointment value, $Res Function(Appointment) _then) = _$AppointmentCopyWithImpl;
@useResult
$Res call({
 String id, DateTime scheduledAt, PatientSummary patient, String reason, bool urgent, AppointmentStatus status, String? consultationId
});


$PatientSummaryCopyWith<$Res> get patient;

}
/// @nodoc
class _$AppointmentCopyWithImpl<$Res>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._self, this._then);

  final Appointment _self;
  final $Res Function(Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? scheduledAt = null,Object? patient = null,Object? reason = null,Object? urgent = null,Object? status = null,Object? consultationId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientSummary,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,urgent: null == urgent ? _self.urgent : urgent // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,consultationId: freezed == consultationId ? _self.consultationId : consultationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientSummaryCopyWith<$Res> get patient {
  
  return $PatientSummaryCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}


/// Adds pattern-matching-related methods to [Appointment].
extension AppointmentPatterns on Appointment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Appointment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Appointment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Appointment value)  $default,){
final _that = this;
switch (_that) {
case _Appointment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Appointment value)?  $default,){
final _that = this;
switch (_that) {
case _Appointment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime scheduledAt,  PatientSummary patient,  String reason,  bool urgent,  AppointmentStatus status,  String? consultationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Appointment() when $default != null:
return $default(_that.id,_that.scheduledAt,_that.patient,_that.reason,_that.urgent,_that.status,_that.consultationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime scheduledAt,  PatientSummary patient,  String reason,  bool urgent,  AppointmentStatus status,  String? consultationId)  $default,) {final _that = this;
switch (_that) {
case _Appointment():
return $default(_that.id,_that.scheduledAt,_that.patient,_that.reason,_that.urgent,_that.status,_that.consultationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime scheduledAt,  PatientSummary patient,  String reason,  bool urgent,  AppointmentStatus status,  String? consultationId)?  $default,) {final _that = this;
switch (_that) {
case _Appointment() when $default != null:
return $default(_that.id,_that.scheduledAt,_that.patient,_that.reason,_that.urgent,_that.status,_that.consultationId);case _:
  return null;

}
}

}

/// @nodoc


class _Appointment implements Appointment {
  const _Appointment({required this.id, required this.scheduledAt, required this.patient, required this.reason, this.urgent = false, this.status = AppointmentStatus.scheduled, this.consultationId});
  

@override final  String id;
@override final  DateTime scheduledAt;
@override final  PatientSummary patient;
@override final  String reason;
@override@JsonKey() final  bool urgent;
@override@JsonKey() final  AppointmentStatus status;
@override final  String? consultationId;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentCopyWith<_Appointment> get copyWith => __$AppointmentCopyWithImpl<_Appointment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Appointment&&(identical(other.id, id) || other.id == id)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.urgent, urgent) || other.urgent == urgent)&&(identical(other.status, status) || other.status == status)&&(identical(other.consultationId, consultationId) || other.consultationId == consultationId));
}


@override
int get hashCode => Object.hash(runtimeType,id,scheduledAt,patient,reason,urgent,status,consultationId);

@override
String toString() {
  return 'Appointment(id: $id, scheduledAt: $scheduledAt, patient: $patient, reason: $reason, urgent: $urgent, status: $status, consultationId: $consultationId)';
}


}

/// @nodoc
abstract mixin class _$AppointmentCopyWith<$Res> implements $AppointmentCopyWith<$Res> {
  factory _$AppointmentCopyWith(_Appointment value, $Res Function(_Appointment) _then) = __$AppointmentCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime scheduledAt, PatientSummary patient, String reason, bool urgent, AppointmentStatus status, String? consultationId
});


@override $PatientSummaryCopyWith<$Res> get patient;

}
/// @nodoc
class __$AppointmentCopyWithImpl<$Res>
    implements _$AppointmentCopyWith<$Res> {
  __$AppointmentCopyWithImpl(this._self, this._then);

  final _Appointment _self;
  final $Res Function(_Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? scheduledAt = null,Object? patient = null,Object? reason = null,Object? urgent = null,Object? status = null,Object? consultationId = freezed,}) {
  return _then(_Appointment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientSummary,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,urgent: null == urgent ? _self.urgent : urgent // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,consultationId: freezed == consultationId ? _self.consultationId : consultationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientSummaryCopyWith<$Res> get patient {
  
  return $PatientSummaryCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}

// dart format on
