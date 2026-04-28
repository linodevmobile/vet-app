// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppointmentDto {

 String get id; String get patientId; DateTime get scheduledAt; String get status; String? get reason; bool get urgent; String? get consultationId; AppointmentPatientDto? get patient;
/// Create a copy of AppointmentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentDtoCopyWith<AppointmentDto> get copyWith => _$AppointmentDtoCopyWithImpl<AppointmentDto>(this as AppointmentDto, _$identity);

  /// Serializes this AppointmentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.urgent, urgent) || other.urgent == urgent)&&(identical(other.consultationId, consultationId) || other.consultationId == consultationId)&&(identical(other.patient, patient) || other.patient == patient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,scheduledAt,status,reason,urgent,consultationId,patient);

@override
String toString() {
  return 'AppointmentDto(id: $id, patientId: $patientId, scheduledAt: $scheduledAt, status: $status, reason: $reason, urgent: $urgent, consultationId: $consultationId, patient: $patient)';
}


}

/// @nodoc
abstract mixin class $AppointmentDtoCopyWith<$Res>  {
  factory $AppointmentDtoCopyWith(AppointmentDto value, $Res Function(AppointmentDto) _then) = _$AppointmentDtoCopyWithImpl;
@useResult
$Res call({
 String id, String patientId, DateTime scheduledAt, String status, String? reason, bool urgent, String? consultationId, AppointmentPatientDto? patient
});


$AppointmentPatientDtoCopyWith<$Res>? get patient;

}
/// @nodoc
class _$AppointmentDtoCopyWithImpl<$Res>
    implements $AppointmentDtoCopyWith<$Res> {
  _$AppointmentDtoCopyWithImpl(this._self, this._then);

  final AppointmentDto _self;
  final $Res Function(AppointmentDto) _then;

/// Create a copy of AppointmentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? scheduledAt = null,Object? status = null,Object? reason = freezed,Object? urgent = null,Object? consultationId = freezed,Object? patient = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,urgent: null == urgent ? _self.urgent : urgent // ignore: cast_nullable_to_non_nullable
as bool,consultationId: freezed == consultationId ? _self.consultationId : consultationId // ignore: cast_nullable_to_non_nullable
as String?,patient: freezed == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as AppointmentPatientDto?,
  ));
}
/// Create a copy of AppointmentDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentPatientDtoCopyWith<$Res>? get patient {
    if (_self.patient == null) {
    return null;
  }

  return $AppointmentPatientDtoCopyWith<$Res>(_self.patient!, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppointmentDto].
extension AppointmentDtoPatterns on AppointmentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentDto value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentDto value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String patientId,  DateTime scheduledAt,  String status,  String? reason,  bool urgent,  String? consultationId,  AppointmentPatientDto? patient)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentDto() when $default != null:
return $default(_that.id,_that.patientId,_that.scheduledAt,_that.status,_that.reason,_that.urgent,_that.consultationId,_that.patient);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String patientId,  DateTime scheduledAt,  String status,  String? reason,  bool urgent,  String? consultationId,  AppointmentPatientDto? patient)  $default,) {final _that = this;
switch (_that) {
case _AppointmentDto():
return $default(_that.id,_that.patientId,_that.scheduledAt,_that.status,_that.reason,_that.urgent,_that.consultationId,_that.patient);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String patientId,  DateTime scheduledAt,  String status,  String? reason,  bool urgent,  String? consultationId,  AppointmentPatientDto? patient)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentDto() when $default != null:
return $default(_that.id,_that.patientId,_that.scheduledAt,_that.status,_that.reason,_that.urgent,_that.consultationId,_that.patient);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentDto implements AppointmentDto {
  const _AppointmentDto({required this.id, required this.patientId, required this.scheduledAt, required this.status, this.reason, this.urgent = false, this.consultationId, this.patient});
  factory _AppointmentDto.fromJson(Map<String, dynamic> json) => _$AppointmentDtoFromJson(json);

@override final  String id;
@override final  String patientId;
@override final  DateTime scheduledAt;
@override final  String status;
@override final  String? reason;
@override@JsonKey() final  bool urgent;
@override final  String? consultationId;
@override final  AppointmentPatientDto? patient;

/// Create a copy of AppointmentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentDtoCopyWith<_AppointmentDto> get copyWith => __$AppointmentDtoCopyWithImpl<_AppointmentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.urgent, urgent) || other.urgent == urgent)&&(identical(other.consultationId, consultationId) || other.consultationId == consultationId)&&(identical(other.patient, patient) || other.patient == patient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,scheduledAt,status,reason,urgent,consultationId,patient);

@override
String toString() {
  return 'AppointmentDto(id: $id, patientId: $patientId, scheduledAt: $scheduledAt, status: $status, reason: $reason, urgent: $urgent, consultationId: $consultationId, patient: $patient)';
}


}

/// @nodoc
abstract mixin class _$AppointmentDtoCopyWith<$Res> implements $AppointmentDtoCopyWith<$Res> {
  factory _$AppointmentDtoCopyWith(_AppointmentDto value, $Res Function(_AppointmentDto) _then) = __$AppointmentDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String patientId, DateTime scheduledAt, String status, String? reason, bool urgent, String? consultationId, AppointmentPatientDto? patient
});


@override $AppointmentPatientDtoCopyWith<$Res>? get patient;

}
/// @nodoc
class __$AppointmentDtoCopyWithImpl<$Res>
    implements _$AppointmentDtoCopyWith<$Res> {
  __$AppointmentDtoCopyWithImpl(this._self, this._then);

  final _AppointmentDto _self;
  final $Res Function(_AppointmentDto) _then;

/// Create a copy of AppointmentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? scheduledAt = null,Object? status = null,Object? reason = freezed,Object? urgent = null,Object? consultationId = freezed,Object? patient = freezed,}) {
  return _then(_AppointmentDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,urgent: null == urgent ? _self.urgent : urgent // ignore: cast_nullable_to_non_nullable
as bool,consultationId: freezed == consultationId ? _self.consultationId : consultationId // ignore: cast_nullable_to_non_nullable
as String?,patient: freezed == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as AppointmentPatientDto?,
  ));
}

/// Create a copy of AppointmentDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentPatientDtoCopyWith<$Res>? get patient {
    if (_self.patient == null) {
    return null;
  }

  return $AppointmentPatientDtoCopyWith<$Res>(_self.patient!, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}

// dart format on
