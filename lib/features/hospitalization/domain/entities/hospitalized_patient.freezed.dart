// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hospitalized_patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HospitalizedPatient {

 String get id; PatientSummary get patient; int get day; String get note; List<bool> get tasks; bool get critical;
/// Create a copy of HospitalizedPatient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HospitalizedPatientCopyWith<HospitalizedPatient> get copyWith => _$HospitalizedPatientCopyWithImpl<HospitalizedPatient>(this as HospitalizedPatient, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HospitalizedPatient&&(identical(other.id, id) || other.id == id)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.day, day) || other.day == day)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.tasks, tasks)&&(identical(other.critical, critical) || other.critical == critical));
}


@override
int get hashCode => Object.hash(runtimeType,id,patient,day,note,const DeepCollectionEquality().hash(tasks),critical);

@override
String toString() {
  return 'HospitalizedPatient(id: $id, patient: $patient, day: $day, note: $note, tasks: $tasks, critical: $critical)';
}


}

/// @nodoc
abstract mixin class $HospitalizedPatientCopyWith<$Res>  {
  factory $HospitalizedPatientCopyWith(HospitalizedPatient value, $Res Function(HospitalizedPatient) _then) = _$HospitalizedPatientCopyWithImpl;
@useResult
$Res call({
 String id, PatientSummary patient, int day, String note, List<bool> tasks, bool critical
});


$PatientSummaryCopyWith<$Res> get patient;

}
/// @nodoc
class _$HospitalizedPatientCopyWithImpl<$Res>
    implements $HospitalizedPatientCopyWith<$Res> {
  _$HospitalizedPatientCopyWithImpl(this._self, this._then);

  final HospitalizedPatient _self;
  final $Res Function(HospitalizedPatient) _then;

/// Create a copy of HospitalizedPatient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patient = null,Object? day = null,Object? note = null,Object? tasks = null,Object? critical = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientSummary,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<bool>,critical: null == critical ? _self.critical : critical // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of HospitalizedPatient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientSummaryCopyWith<$Res> get patient {
  
  return $PatientSummaryCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}


/// Adds pattern-matching-related methods to [HospitalizedPatient].
extension HospitalizedPatientPatterns on HospitalizedPatient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HospitalizedPatient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HospitalizedPatient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HospitalizedPatient value)  $default,){
final _that = this;
switch (_that) {
case _HospitalizedPatient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HospitalizedPatient value)?  $default,){
final _that = this;
switch (_that) {
case _HospitalizedPatient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  PatientSummary patient,  int day,  String note,  List<bool> tasks,  bool critical)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HospitalizedPatient() when $default != null:
return $default(_that.id,_that.patient,_that.day,_that.note,_that.tasks,_that.critical);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  PatientSummary patient,  int day,  String note,  List<bool> tasks,  bool critical)  $default,) {final _that = this;
switch (_that) {
case _HospitalizedPatient():
return $default(_that.id,_that.patient,_that.day,_that.note,_that.tasks,_that.critical);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  PatientSummary patient,  int day,  String note,  List<bool> tasks,  bool critical)?  $default,) {final _that = this;
switch (_that) {
case _HospitalizedPatient() when $default != null:
return $default(_that.id,_that.patient,_that.day,_that.note,_that.tasks,_that.critical);case _:
  return null;

}
}

}

/// @nodoc


class _HospitalizedPatient implements HospitalizedPatient {
  const _HospitalizedPatient({required this.id, required this.patient, required this.day, required this.note, required final  List<bool> tasks, this.critical = false}): _tasks = tasks;
  

@override final  String id;
@override final  PatientSummary patient;
@override final  int day;
@override final  String note;
 final  List<bool> _tasks;
@override List<bool> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

@override@JsonKey() final  bool critical;

/// Create a copy of HospitalizedPatient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HospitalizedPatientCopyWith<_HospitalizedPatient> get copyWith => __$HospitalizedPatientCopyWithImpl<_HospitalizedPatient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HospitalizedPatient&&(identical(other.id, id) || other.id == id)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.day, day) || other.day == day)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&(identical(other.critical, critical) || other.critical == critical));
}


@override
int get hashCode => Object.hash(runtimeType,id,patient,day,note,const DeepCollectionEquality().hash(_tasks),critical);

@override
String toString() {
  return 'HospitalizedPatient(id: $id, patient: $patient, day: $day, note: $note, tasks: $tasks, critical: $critical)';
}


}

/// @nodoc
abstract mixin class _$HospitalizedPatientCopyWith<$Res> implements $HospitalizedPatientCopyWith<$Res> {
  factory _$HospitalizedPatientCopyWith(_HospitalizedPatient value, $Res Function(_HospitalizedPatient) _then) = __$HospitalizedPatientCopyWithImpl;
@override @useResult
$Res call({
 String id, PatientSummary patient, int day, String note, List<bool> tasks, bool critical
});


@override $PatientSummaryCopyWith<$Res> get patient;

}
/// @nodoc
class __$HospitalizedPatientCopyWithImpl<$Res>
    implements _$HospitalizedPatientCopyWith<$Res> {
  __$HospitalizedPatientCopyWithImpl(this._self, this._then);

  final _HospitalizedPatient _self;
  final $Res Function(_HospitalizedPatient) _then;

/// Create a copy of HospitalizedPatient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patient = null,Object? day = null,Object? note = null,Object? tasks = null,Object? critical = null,}) {
  return _then(_HospitalizedPatient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientSummary,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<bool>,critical: null == critical ? _self.critical : critical // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of HospitalizedPatient
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
