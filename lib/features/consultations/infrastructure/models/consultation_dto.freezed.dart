// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsultationDto {

 String get id; String get status; DateTime get createdAt; ConsultationPatientDto get patient; String? get type; String? get chiefComplaint; String? get result; String? get summary; String? get primaryDiagnosis; String? get pausedReason; String? get pausedNote; DateTime? get pausedAt; DateTime? get signedAt; List<ConsultationSectionDto> get sections;
/// Create a copy of ConsultationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationDtoCopyWith<ConsultationDto> get copyWith => _$ConsultationDtoCopyWithImpl<ConsultationDto>(this as ConsultationDto, _$identity);

  /// Serializes this ConsultationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.type, type) || other.type == type)&&(identical(other.chiefComplaint, chiefComplaint) || other.chiefComplaint == chiefComplaint)&&(identical(other.result, result) || other.result == result)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.primaryDiagnosis, primaryDiagnosis) || other.primaryDiagnosis == primaryDiagnosis)&&(identical(other.pausedReason, pausedReason) || other.pausedReason == pausedReason)&&(identical(other.pausedNote, pausedNote) || other.pausedNote == pausedNote)&&(identical(other.pausedAt, pausedAt) || other.pausedAt == pausedAt)&&(identical(other.signedAt, signedAt) || other.signedAt == signedAt)&&const DeepCollectionEquality().equals(other.sections, sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,createdAt,patient,type,chiefComplaint,result,summary,primaryDiagnosis,pausedReason,pausedNote,pausedAt,signedAt,const DeepCollectionEquality().hash(sections));

@override
String toString() {
  return 'ConsultationDto(id: $id, status: $status, createdAt: $createdAt, patient: $patient, type: $type, chiefComplaint: $chiefComplaint, result: $result, summary: $summary, primaryDiagnosis: $primaryDiagnosis, pausedReason: $pausedReason, pausedNote: $pausedNote, pausedAt: $pausedAt, signedAt: $signedAt, sections: $sections)';
}


}

/// @nodoc
abstract mixin class $ConsultationDtoCopyWith<$Res>  {
  factory $ConsultationDtoCopyWith(ConsultationDto value, $Res Function(ConsultationDto) _then) = _$ConsultationDtoCopyWithImpl;
@useResult
$Res call({
 String id, String status, DateTime createdAt, ConsultationPatientDto patient, String? type, String? chiefComplaint, String? result, String? summary, String? primaryDiagnosis, String? pausedReason, String? pausedNote, DateTime? pausedAt, DateTime? signedAt, List<ConsultationSectionDto> sections
});


$ConsultationPatientDtoCopyWith<$Res> get patient;

}
/// @nodoc
class _$ConsultationDtoCopyWithImpl<$Res>
    implements $ConsultationDtoCopyWith<$Res> {
  _$ConsultationDtoCopyWithImpl(this._self, this._then);

  final ConsultationDto _self;
  final $Res Function(ConsultationDto) _then;

/// Create a copy of ConsultationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? createdAt = null,Object? patient = null,Object? type = freezed,Object? chiefComplaint = freezed,Object? result = freezed,Object? summary = freezed,Object? primaryDiagnosis = freezed,Object? pausedReason = freezed,Object? pausedNote = freezed,Object? pausedAt = freezed,Object? signedAt = freezed,Object? sections = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as ConsultationPatientDto,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,chiefComplaint: freezed == chiefComplaint ? _self.chiefComplaint : chiefComplaint // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,primaryDiagnosis: freezed == primaryDiagnosis ? _self.primaryDiagnosis : primaryDiagnosis // ignore: cast_nullable_to_non_nullable
as String?,pausedReason: freezed == pausedReason ? _self.pausedReason : pausedReason // ignore: cast_nullable_to_non_nullable
as String?,pausedNote: freezed == pausedNote ? _self.pausedNote : pausedNote // ignore: cast_nullable_to_non_nullable
as String?,pausedAt: freezed == pausedAt ? _self.pausedAt : pausedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,signedAt: freezed == signedAt ? _self.signedAt : signedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<ConsultationSectionDto>,
  ));
}
/// Create a copy of ConsultationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsultationPatientDtoCopyWith<$Res> get patient {
  
  return $ConsultationPatientDtoCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConsultationDto].
extension ConsultationDtoPatterns on ConsultationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationDto value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationDto value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status,  DateTime createdAt,  ConsultationPatientDto patient,  String? type,  String? chiefComplaint,  String? result,  String? summary,  String? primaryDiagnosis,  String? pausedReason,  String? pausedNote,  DateTime? pausedAt,  DateTime? signedAt,  List<ConsultationSectionDto> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationDto() when $default != null:
return $default(_that.id,_that.status,_that.createdAt,_that.patient,_that.type,_that.chiefComplaint,_that.result,_that.summary,_that.primaryDiagnosis,_that.pausedReason,_that.pausedNote,_that.pausedAt,_that.signedAt,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status,  DateTime createdAt,  ConsultationPatientDto patient,  String? type,  String? chiefComplaint,  String? result,  String? summary,  String? primaryDiagnosis,  String? pausedReason,  String? pausedNote,  DateTime? pausedAt,  DateTime? signedAt,  List<ConsultationSectionDto> sections)  $default,) {final _that = this;
switch (_that) {
case _ConsultationDto():
return $default(_that.id,_that.status,_that.createdAt,_that.patient,_that.type,_that.chiefComplaint,_that.result,_that.summary,_that.primaryDiagnosis,_that.pausedReason,_that.pausedNote,_that.pausedAt,_that.signedAt,_that.sections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status,  DateTime createdAt,  ConsultationPatientDto patient,  String? type,  String? chiefComplaint,  String? result,  String? summary,  String? primaryDiagnosis,  String? pausedReason,  String? pausedNote,  DateTime? pausedAt,  DateTime? signedAt,  List<ConsultationSectionDto> sections)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationDto() when $default != null:
return $default(_that.id,_that.status,_that.createdAt,_that.patient,_that.type,_that.chiefComplaint,_that.result,_that.summary,_that.primaryDiagnosis,_that.pausedReason,_that.pausedNote,_that.pausedAt,_that.signedAt,_that.sections);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsultationDto implements ConsultationDto {
  const _ConsultationDto({required this.id, required this.status, required this.createdAt, required this.patient, this.type, this.chiefComplaint, this.result, this.summary, this.primaryDiagnosis, this.pausedReason, this.pausedNote, this.pausedAt, this.signedAt, final  List<ConsultationSectionDto> sections = const <ConsultationSectionDto>[]}): _sections = sections;
  factory _ConsultationDto.fromJson(Map<String, dynamic> json) => _$ConsultationDtoFromJson(json);

@override final  String id;
@override final  String status;
@override final  DateTime createdAt;
@override final  ConsultationPatientDto patient;
@override final  String? type;
@override final  String? chiefComplaint;
@override final  String? result;
@override final  String? summary;
@override final  String? primaryDiagnosis;
@override final  String? pausedReason;
@override final  String? pausedNote;
@override final  DateTime? pausedAt;
@override final  DateTime? signedAt;
 final  List<ConsultationSectionDto> _sections;
@override@JsonKey() List<ConsultationSectionDto> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of ConsultationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationDtoCopyWith<_ConsultationDto> get copyWith => __$ConsultationDtoCopyWithImpl<_ConsultationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsultationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.type, type) || other.type == type)&&(identical(other.chiefComplaint, chiefComplaint) || other.chiefComplaint == chiefComplaint)&&(identical(other.result, result) || other.result == result)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.primaryDiagnosis, primaryDiagnosis) || other.primaryDiagnosis == primaryDiagnosis)&&(identical(other.pausedReason, pausedReason) || other.pausedReason == pausedReason)&&(identical(other.pausedNote, pausedNote) || other.pausedNote == pausedNote)&&(identical(other.pausedAt, pausedAt) || other.pausedAt == pausedAt)&&(identical(other.signedAt, signedAt) || other.signedAt == signedAt)&&const DeepCollectionEquality().equals(other._sections, _sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,createdAt,patient,type,chiefComplaint,result,summary,primaryDiagnosis,pausedReason,pausedNote,pausedAt,signedAt,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'ConsultationDto(id: $id, status: $status, createdAt: $createdAt, patient: $patient, type: $type, chiefComplaint: $chiefComplaint, result: $result, summary: $summary, primaryDiagnosis: $primaryDiagnosis, pausedReason: $pausedReason, pausedNote: $pausedNote, pausedAt: $pausedAt, signedAt: $signedAt, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$ConsultationDtoCopyWith<$Res> implements $ConsultationDtoCopyWith<$Res> {
  factory _$ConsultationDtoCopyWith(_ConsultationDto value, $Res Function(_ConsultationDto) _then) = __$ConsultationDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String status, DateTime createdAt, ConsultationPatientDto patient, String? type, String? chiefComplaint, String? result, String? summary, String? primaryDiagnosis, String? pausedReason, String? pausedNote, DateTime? pausedAt, DateTime? signedAt, List<ConsultationSectionDto> sections
});


@override $ConsultationPatientDtoCopyWith<$Res> get patient;

}
/// @nodoc
class __$ConsultationDtoCopyWithImpl<$Res>
    implements _$ConsultationDtoCopyWith<$Res> {
  __$ConsultationDtoCopyWithImpl(this._self, this._then);

  final _ConsultationDto _self;
  final $Res Function(_ConsultationDto) _then;

/// Create a copy of ConsultationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? createdAt = null,Object? patient = null,Object? type = freezed,Object? chiefComplaint = freezed,Object? result = freezed,Object? summary = freezed,Object? primaryDiagnosis = freezed,Object? pausedReason = freezed,Object? pausedNote = freezed,Object? pausedAt = freezed,Object? signedAt = freezed,Object? sections = null,}) {
  return _then(_ConsultationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as ConsultationPatientDto,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,chiefComplaint: freezed == chiefComplaint ? _self.chiefComplaint : chiefComplaint // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,primaryDiagnosis: freezed == primaryDiagnosis ? _self.primaryDiagnosis : primaryDiagnosis // ignore: cast_nullable_to_non_nullable
as String?,pausedReason: freezed == pausedReason ? _self.pausedReason : pausedReason // ignore: cast_nullable_to_non_nullable
as String?,pausedNote: freezed == pausedNote ? _self.pausedNote : pausedNote // ignore: cast_nullable_to_non_nullable
as String?,pausedAt: freezed == pausedAt ? _self.pausedAt : pausedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,signedAt: freezed == signedAt ? _self.signedAt : signedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<ConsultationSectionDto>,
  ));
}

/// Create a copy of ConsultationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsultationPatientDtoCopyWith<$Res> get patient {
  
  return $ConsultationPatientDtoCopyWith<$Res>(_self.patient, (value) {
    return _then(_self.copyWith(patient: value));
  });
}
}

// dart format on
