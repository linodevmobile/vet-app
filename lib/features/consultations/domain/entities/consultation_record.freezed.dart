// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConsultationRecord {

 String get id; PatientSummary get patient; String get summary; DateTime get performedAt; ConsultationType get type;
/// Create a copy of ConsultationRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationRecordCopyWith<ConsultationRecord> get copyWith => _$ConsultationRecordCopyWithImpl<ConsultationRecord>(this as ConsultationRecord, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.performedAt, performedAt) || other.performedAt == performedAt)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,patient,summary,performedAt,type);

@override
String toString() {
  return 'ConsultationRecord(id: $id, patient: $patient, summary: $summary, performedAt: $performedAt, type: $type)';
}


}

/// @nodoc
abstract mixin class $ConsultationRecordCopyWith<$Res>  {
  factory $ConsultationRecordCopyWith(ConsultationRecord value, $Res Function(ConsultationRecord) _then) = _$ConsultationRecordCopyWithImpl;
@useResult
$Res call({
 String id, PatientSummary patient, String summary, DateTime performedAt, ConsultationType type
});


$PatientSummaryCopyWith<$Res> get patient;

}
/// @nodoc
class _$ConsultationRecordCopyWithImpl<$Res>
    implements $ConsultationRecordCopyWith<$Res> {
  _$ConsultationRecordCopyWithImpl(this._self, this._then);

  final ConsultationRecord _self;
  final $Res Function(ConsultationRecord) _then;

/// Create a copy of ConsultationRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patient = null,Object? summary = null,Object? performedAt = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientSummary,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,performedAt: null == performedAt ? _self.performedAt : performedAt // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ConsultationType,
  ));
}
/// Create a copy of ConsultationRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientSummaryCopyWith<$Res> get patient {
  
  return $PatientSummaryCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConsultationRecord].
extension ConsultationRecordPatterns on ConsultationRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationRecord value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationRecord value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  PatientSummary patient,  String summary,  DateTime performedAt,  ConsultationType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationRecord() when $default != null:
return $default(_that.id,_that.patient,_that.summary,_that.performedAt,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  PatientSummary patient,  String summary,  DateTime performedAt,  ConsultationType type)  $default,) {final _that = this;
switch (_that) {
case _ConsultationRecord():
return $default(_that.id,_that.patient,_that.summary,_that.performedAt,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  PatientSummary patient,  String summary,  DateTime performedAt,  ConsultationType type)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationRecord() when $default != null:
return $default(_that.id,_that.patient,_that.summary,_that.performedAt,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _ConsultationRecord implements ConsultationRecord {
  const _ConsultationRecord({required this.id, required this.patient, required this.summary, required this.performedAt, required this.type});
  

@override final  String id;
@override final  PatientSummary patient;
@override final  String summary;
@override final  DateTime performedAt;
@override final  ConsultationType type;

/// Create a copy of ConsultationRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationRecordCopyWith<_ConsultationRecord> get copyWith => __$ConsultationRecordCopyWithImpl<_ConsultationRecord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.performedAt, performedAt) || other.performedAt == performedAt)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,patient,summary,performedAt,type);

@override
String toString() {
  return 'ConsultationRecord(id: $id, patient: $patient, summary: $summary, performedAt: $performedAt, type: $type)';
}


}

/// @nodoc
abstract mixin class _$ConsultationRecordCopyWith<$Res> implements $ConsultationRecordCopyWith<$Res> {
  factory _$ConsultationRecordCopyWith(_ConsultationRecord value, $Res Function(_ConsultationRecord) _then) = __$ConsultationRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, PatientSummary patient, String summary, DateTime performedAt, ConsultationType type
});


@override $PatientSummaryCopyWith<$Res> get patient;

}
/// @nodoc
class __$ConsultationRecordCopyWithImpl<$Res>
    implements _$ConsultationRecordCopyWith<$Res> {
  __$ConsultationRecordCopyWithImpl(this._self, this._then);

  final _ConsultationRecord _self;
  final $Res Function(_ConsultationRecord) _then;

/// Create a copy of ConsultationRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patient = null,Object? summary = null,Object? performedAt = null,Object? type = null,}) {
  return _then(_ConsultationRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientSummary,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,performedAt: null == performedAt ? _self.performedAt : performedAt // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ConsultationType,
  ));
}

/// Create a copy of ConsultationRecord
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
