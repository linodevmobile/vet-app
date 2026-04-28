// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Consultation {

 String get id; PatientSummary get patient; ConsultationStatus get status; DateTime get createdAt; List<ConsultationSectionContent> get sections; String? get chiefComplaint; String? get summary; String? get primaryDiagnosis; ConsultationResult? get result; ConsultationPauseReason? get pauseReason; String? get pauseNote; DateTime? get pausedAt; DateTime? get signedAt;
/// Create a copy of Consultation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationCopyWith<Consultation> get copyWith => _$ConsultationCopyWithImpl<Consultation>(this as Consultation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Consultation&&(identical(other.id, id) || other.id == id)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.sections, sections)&&(identical(other.chiefComplaint, chiefComplaint) || other.chiefComplaint == chiefComplaint)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.primaryDiagnosis, primaryDiagnosis) || other.primaryDiagnosis == primaryDiagnosis)&&(identical(other.result, result) || other.result == result)&&(identical(other.pauseReason, pauseReason) || other.pauseReason == pauseReason)&&(identical(other.pauseNote, pauseNote) || other.pauseNote == pauseNote)&&(identical(other.pausedAt, pausedAt) || other.pausedAt == pausedAt)&&(identical(other.signedAt, signedAt) || other.signedAt == signedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,patient,status,createdAt,const DeepCollectionEquality().hash(sections),chiefComplaint,summary,primaryDiagnosis,result,pauseReason,pauseNote,pausedAt,signedAt);

@override
String toString() {
  return 'Consultation(id: $id, patient: $patient, status: $status, createdAt: $createdAt, sections: $sections, chiefComplaint: $chiefComplaint, summary: $summary, primaryDiagnosis: $primaryDiagnosis, result: $result, pauseReason: $pauseReason, pauseNote: $pauseNote, pausedAt: $pausedAt, signedAt: $signedAt)';
}


}

/// @nodoc
abstract mixin class $ConsultationCopyWith<$Res>  {
  factory $ConsultationCopyWith(Consultation value, $Res Function(Consultation) _then) = _$ConsultationCopyWithImpl;
@useResult
$Res call({
 String id, PatientSummary patient, ConsultationStatus status, DateTime createdAt, List<ConsultationSectionContent> sections, String? chiefComplaint, String? summary, String? primaryDiagnosis, ConsultationResult? result, ConsultationPauseReason? pauseReason, String? pauseNote, DateTime? pausedAt, DateTime? signedAt
});


$PatientSummaryCopyWith<$Res> get patient;

}
/// @nodoc
class _$ConsultationCopyWithImpl<$Res>
    implements $ConsultationCopyWith<$Res> {
  _$ConsultationCopyWithImpl(this._self, this._then);

  final Consultation _self;
  final $Res Function(Consultation) _then;

/// Create a copy of Consultation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patient = null,Object? status = null,Object? createdAt = null,Object? sections = null,Object? chiefComplaint = freezed,Object? summary = freezed,Object? primaryDiagnosis = freezed,Object? result = freezed,Object? pauseReason = freezed,Object? pauseNote = freezed,Object? pausedAt = freezed,Object? signedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientSummary,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConsultationStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<ConsultationSectionContent>,chiefComplaint: freezed == chiefComplaint ? _self.chiefComplaint : chiefComplaint // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,primaryDiagnosis: freezed == primaryDiagnosis ? _self.primaryDiagnosis : primaryDiagnosis // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as ConsultationResult?,pauseReason: freezed == pauseReason ? _self.pauseReason : pauseReason // ignore: cast_nullable_to_non_nullable
as ConsultationPauseReason?,pauseNote: freezed == pauseNote ? _self.pauseNote : pauseNote // ignore: cast_nullable_to_non_nullable
as String?,pausedAt: freezed == pausedAt ? _self.pausedAt : pausedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,signedAt: freezed == signedAt ? _self.signedAt : signedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Consultation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientSummaryCopyWith<$Res> get patient {
  
  return $PatientSummaryCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}


/// Adds pattern-matching-related methods to [Consultation].
extension ConsultationPatterns on Consultation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Consultation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Consultation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Consultation value)  $default,){
final _that = this;
switch (_that) {
case _Consultation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Consultation value)?  $default,){
final _that = this;
switch (_that) {
case _Consultation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  PatientSummary patient,  ConsultationStatus status,  DateTime createdAt,  List<ConsultationSectionContent> sections,  String? chiefComplaint,  String? summary,  String? primaryDiagnosis,  ConsultationResult? result,  ConsultationPauseReason? pauseReason,  String? pauseNote,  DateTime? pausedAt,  DateTime? signedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Consultation() when $default != null:
return $default(_that.id,_that.patient,_that.status,_that.createdAt,_that.sections,_that.chiefComplaint,_that.summary,_that.primaryDiagnosis,_that.result,_that.pauseReason,_that.pauseNote,_that.pausedAt,_that.signedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  PatientSummary patient,  ConsultationStatus status,  DateTime createdAt,  List<ConsultationSectionContent> sections,  String? chiefComplaint,  String? summary,  String? primaryDiagnosis,  ConsultationResult? result,  ConsultationPauseReason? pauseReason,  String? pauseNote,  DateTime? pausedAt,  DateTime? signedAt)  $default,) {final _that = this;
switch (_that) {
case _Consultation():
return $default(_that.id,_that.patient,_that.status,_that.createdAt,_that.sections,_that.chiefComplaint,_that.summary,_that.primaryDiagnosis,_that.result,_that.pauseReason,_that.pauseNote,_that.pausedAt,_that.signedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  PatientSummary patient,  ConsultationStatus status,  DateTime createdAt,  List<ConsultationSectionContent> sections,  String? chiefComplaint,  String? summary,  String? primaryDiagnosis,  ConsultationResult? result,  ConsultationPauseReason? pauseReason,  String? pauseNote,  DateTime? pausedAt,  DateTime? signedAt)?  $default,) {final _that = this;
switch (_that) {
case _Consultation() when $default != null:
return $default(_that.id,_that.patient,_that.status,_that.createdAt,_that.sections,_that.chiefComplaint,_that.summary,_that.primaryDiagnosis,_that.result,_that.pauseReason,_that.pauseNote,_that.pausedAt,_that.signedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Consultation implements Consultation {
  const _Consultation({required this.id, required this.patient, required this.status, required this.createdAt, required final  List<ConsultationSectionContent> sections, this.chiefComplaint, this.summary, this.primaryDiagnosis, this.result, this.pauseReason, this.pauseNote, this.pausedAt, this.signedAt}): _sections = sections;
  

@override final  String id;
@override final  PatientSummary patient;
@override final  ConsultationStatus status;
@override final  DateTime createdAt;
 final  List<ConsultationSectionContent> _sections;
@override List<ConsultationSectionContent> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

@override final  String? chiefComplaint;
@override final  String? summary;
@override final  String? primaryDiagnosis;
@override final  ConsultationResult? result;
@override final  ConsultationPauseReason? pauseReason;
@override final  String? pauseNote;
@override final  DateTime? pausedAt;
@override final  DateTime? signedAt;

/// Create a copy of Consultation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationCopyWith<_Consultation> get copyWith => __$ConsultationCopyWithImpl<_Consultation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Consultation&&(identical(other.id, id) || other.id == id)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._sections, _sections)&&(identical(other.chiefComplaint, chiefComplaint) || other.chiefComplaint == chiefComplaint)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.primaryDiagnosis, primaryDiagnosis) || other.primaryDiagnosis == primaryDiagnosis)&&(identical(other.result, result) || other.result == result)&&(identical(other.pauseReason, pauseReason) || other.pauseReason == pauseReason)&&(identical(other.pauseNote, pauseNote) || other.pauseNote == pauseNote)&&(identical(other.pausedAt, pausedAt) || other.pausedAt == pausedAt)&&(identical(other.signedAt, signedAt) || other.signedAt == signedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,patient,status,createdAt,const DeepCollectionEquality().hash(_sections),chiefComplaint,summary,primaryDiagnosis,result,pauseReason,pauseNote,pausedAt,signedAt);

@override
String toString() {
  return 'Consultation(id: $id, patient: $patient, status: $status, createdAt: $createdAt, sections: $sections, chiefComplaint: $chiefComplaint, summary: $summary, primaryDiagnosis: $primaryDiagnosis, result: $result, pauseReason: $pauseReason, pauseNote: $pauseNote, pausedAt: $pausedAt, signedAt: $signedAt)';
}


}

/// @nodoc
abstract mixin class _$ConsultationCopyWith<$Res> implements $ConsultationCopyWith<$Res> {
  factory _$ConsultationCopyWith(_Consultation value, $Res Function(_Consultation) _then) = __$ConsultationCopyWithImpl;
@override @useResult
$Res call({
 String id, PatientSummary patient, ConsultationStatus status, DateTime createdAt, List<ConsultationSectionContent> sections, String? chiefComplaint, String? summary, String? primaryDiagnosis, ConsultationResult? result, ConsultationPauseReason? pauseReason, String? pauseNote, DateTime? pausedAt, DateTime? signedAt
});


@override $PatientSummaryCopyWith<$Res> get patient;

}
/// @nodoc
class __$ConsultationCopyWithImpl<$Res>
    implements _$ConsultationCopyWith<$Res> {
  __$ConsultationCopyWithImpl(this._self, this._then);

  final _Consultation _self;
  final $Res Function(_Consultation) _then;

/// Create a copy of Consultation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patient = null,Object? status = null,Object? createdAt = null,Object? sections = null,Object? chiefComplaint = freezed,Object? summary = freezed,Object? primaryDiagnosis = freezed,Object? result = freezed,Object? pauseReason = freezed,Object? pauseNote = freezed,Object? pausedAt = freezed,Object? signedAt = freezed,}) {
  return _then(_Consultation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientSummary,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConsultationStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<ConsultationSectionContent>,chiefComplaint: freezed == chiefComplaint ? _self.chiefComplaint : chiefComplaint // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,primaryDiagnosis: freezed == primaryDiagnosis ? _self.primaryDiagnosis : primaryDiagnosis // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as ConsultationResult?,pauseReason: freezed == pauseReason ? _self.pauseReason : pauseReason // ignore: cast_nullable_to_non_nullable
as ConsultationPauseReason?,pauseNote: freezed == pauseNote ? _self.pauseNote : pauseNote // ignore: cast_nullable_to_non_nullable
as String?,pausedAt: freezed == pausedAt ? _self.pausedAt : pausedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,signedAt: freezed == signedAt ? _self.signedAt : signedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Consultation
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
