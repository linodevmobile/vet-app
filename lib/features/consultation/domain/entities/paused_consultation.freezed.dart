// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paused_consultation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PausedConsultation {

 String get id; PatientSummary get patient; ConsultationPauseReason get reason; DateTime get pausedAt; int get sectionsCompleted; int get sectionsTotal; String? get note;
/// Create a copy of PausedConsultation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PausedConsultationCopyWith<PausedConsultation> get copyWith => _$PausedConsultationCopyWithImpl<PausedConsultation>(this as PausedConsultation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PausedConsultation&&(identical(other.id, id) || other.id == id)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.pausedAt, pausedAt) || other.pausedAt == pausedAt)&&(identical(other.sectionsCompleted, sectionsCompleted) || other.sectionsCompleted == sectionsCompleted)&&(identical(other.sectionsTotal, sectionsTotal) || other.sectionsTotal == sectionsTotal)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,id,patient,reason,pausedAt,sectionsCompleted,sectionsTotal,note);

@override
String toString() {
  return 'PausedConsultation(id: $id, patient: $patient, reason: $reason, pausedAt: $pausedAt, sectionsCompleted: $sectionsCompleted, sectionsTotal: $sectionsTotal, note: $note)';
}


}

/// @nodoc
abstract mixin class $PausedConsultationCopyWith<$Res>  {
  factory $PausedConsultationCopyWith(PausedConsultation value, $Res Function(PausedConsultation) _then) = _$PausedConsultationCopyWithImpl;
@useResult
$Res call({
 String id, PatientSummary patient, ConsultationPauseReason reason, DateTime pausedAt, int sectionsCompleted, int sectionsTotal, String? note
});


$PatientSummaryCopyWith<$Res> get patient;

}
/// @nodoc
class _$PausedConsultationCopyWithImpl<$Res>
    implements $PausedConsultationCopyWith<$Res> {
  _$PausedConsultationCopyWithImpl(this._self, this._then);

  final PausedConsultation _self;
  final $Res Function(PausedConsultation) _then;

/// Create a copy of PausedConsultation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patient = null,Object? reason = null,Object? pausedAt = null,Object? sectionsCompleted = null,Object? sectionsTotal = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientSummary,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ConsultationPauseReason,pausedAt: null == pausedAt ? _self.pausedAt : pausedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sectionsCompleted: null == sectionsCompleted ? _self.sectionsCompleted : sectionsCompleted // ignore: cast_nullable_to_non_nullable
as int,sectionsTotal: null == sectionsTotal ? _self.sectionsTotal : sectionsTotal // ignore: cast_nullable_to_non_nullable
as int,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PausedConsultation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientSummaryCopyWith<$Res> get patient {
  
  return $PatientSummaryCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}


/// Adds pattern-matching-related methods to [PausedConsultation].
extension PausedConsultationPatterns on PausedConsultation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PausedConsultation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PausedConsultation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PausedConsultation value)  $default,){
final _that = this;
switch (_that) {
case _PausedConsultation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PausedConsultation value)?  $default,){
final _that = this;
switch (_that) {
case _PausedConsultation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  PatientSummary patient,  ConsultationPauseReason reason,  DateTime pausedAt,  int sectionsCompleted,  int sectionsTotal,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PausedConsultation() when $default != null:
return $default(_that.id,_that.patient,_that.reason,_that.pausedAt,_that.sectionsCompleted,_that.sectionsTotal,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  PatientSummary patient,  ConsultationPauseReason reason,  DateTime pausedAt,  int sectionsCompleted,  int sectionsTotal,  String? note)  $default,) {final _that = this;
switch (_that) {
case _PausedConsultation():
return $default(_that.id,_that.patient,_that.reason,_that.pausedAt,_that.sectionsCompleted,_that.sectionsTotal,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  PatientSummary patient,  ConsultationPauseReason reason,  DateTime pausedAt,  int sectionsCompleted,  int sectionsTotal,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _PausedConsultation() when $default != null:
return $default(_that.id,_that.patient,_that.reason,_that.pausedAt,_that.sectionsCompleted,_that.sectionsTotal,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _PausedConsultation implements PausedConsultation {
  const _PausedConsultation({required this.id, required this.patient, required this.reason, required this.pausedAt, required this.sectionsCompleted, required this.sectionsTotal, this.note});
  

@override final  String id;
@override final  PatientSummary patient;
@override final  ConsultationPauseReason reason;
@override final  DateTime pausedAt;
@override final  int sectionsCompleted;
@override final  int sectionsTotal;
@override final  String? note;

/// Create a copy of PausedConsultation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PausedConsultationCopyWith<_PausedConsultation> get copyWith => __$PausedConsultationCopyWithImpl<_PausedConsultation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PausedConsultation&&(identical(other.id, id) || other.id == id)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.pausedAt, pausedAt) || other.pausedAt == pausedAt)&&(identical(other.sectionsCompleted, sectionsCompleted) || other.sectionsCompleted == sectionsCompleted)&&(identical(other.sectionsTotal, sectionsTotal) || other.sectionsTotal == sectionsTotal)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,id,patient,reason,pausedAt,sectionsCompleted,sectionsTotal,note);

@override
String toString() {
  return 'PausedConsultation(id: $id, patient: $patient, reason: $reason, pausedAt: $pausedAt, sectionsCompleted: $sectionsCompleted, sectionsTotal: $sectionsTotal, note: $note)';
}


}

/// @nodoc
abstract mixin class _$PausedConsultationCopyWith<$Res> implements $PausedConsultationCopyWith<$Res> {
  factory _$PausedConsultationCopyWith(_PausedConsultation value, $Res Function(_PausedConsultation) _then) = __$PausedConsultationCopyWithImpl;
@override @useResult
$Res call({
 String id, PatientSummary patient, ConsultationPauseReason reason, DateTime pausedAt, int sectionsCompleted, int sectionsTotal, String? note
});


@override $PatientSummaryCopyWith<$Res> get patient;

}
/// @nodoc
class __$PausedConsultationCopyWithImpl<$Res>
    implements _$PausedConsultationCopyWith<$Res> {
  __$PausedConsultationCopyWithImpl(this._self, this._then);

  final _PausedConsultation _self;
  final $Res Function(_PausedConsultation) _then;

/// Create a copy of PausedConsultation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patient = null,Object? reason = null,Object? pausedAt = null,Object? sectionsCompleted = null,Object? sectionsTotal = null,Object? note = freezed,}) {
  return _then(_PausedConsultation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientSummary,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ConsultationPauseReason,pausedAt: null == pausedAt ? _self.pausedAt : pausedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sectionsCompleted: null == sectionsCompleted ? _self.sectionsCompleted : sectionsCompleted // ignore: cast_nullable_to_non_nullable
as int,sectionsTotal: null == sectionsTotal ? _self.sectionsTotal : sectionsTotal // ignore: cast_nullable_to_non_nullable
as int,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PausedConsultation
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
