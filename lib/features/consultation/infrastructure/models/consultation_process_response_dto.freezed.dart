// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_process_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsultationProcessResponseDto {

@JsonKey(name: 'consultation_id') String get consultationId; String get section; String? get transcription;@JsonKey(name: 'suggested_text') String? get suggestedText;@JsonKey(name: 'ai_suggested') Map<String, dynamic>? get aiSuggested;@JsonKey(name: 'audio_path') String? get audioPath;
/// Create a copy of ConsultationProcessResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationProcessResponseDtoCopyWith<ConsultationProcessResponseDto> get copyWith => _$ConsultationProcessResponseDtoCopyWithImpl<ConsultationProcessResponseDto>(this as ConsultationProcessResponseDto, _$identity);

  /// Serializes this ConsultationProcessResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationProcessResponseDto&&(identical(other.consultationId, consultationId) || other.consultationId == consultationId)&&(identical(other.section, section) || other.section == section)&&(identical(other.transcription, transcription) || other.transcription == transcription)&&(identical(other.suggestedText, suggestedText) || other.suggestedText == suggestedText)&&const DeepCollectionEquality().equals(other.aiSuggested, aiSuggested)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consultationId,section,transcription,suggestedText,const DeepCollectionEquality().hash(aiSuggested),audioPath);

@override
String toString() {
  return 'ConsultationProcessResponseDto(consultationId: $consultationId, section: $section, transcription: $transcription, suggestedText: $suggestedText, aiSuggested: $aiSuggested, audioPath: $audioPath)';
}


}

/// @nodoc
abstract mixin class $ConsultationProcessResponseDtoCopyWith<$Res>  {
  factory $ConsultationProcessResponseDtoCopyWith(ConsultationProcessResponseDto value, $Res Function(ConsultationProcessResponseDto) _then) = _$ConsultationProcessResponseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'consultation_id') String consultationId, String section, String? transcription,@JsonKey(name: 'suggested_text') String? suggestedText,@JsonKey(name: 'ai_suggested') Map<String, dynamic>? aiSuggested,@JsonKey(name: 'audio_path') String? audioPath
});




}
/// @nodoc
class _$ConsultationProcessResponseDtoCopyWithImpl<$Res>
    implements $ConsultationProcessResponseDtoCopyWith<$Res> {
  _$ConsultationProcessResponseDtoCopyWithImpl(this._self, this._then);

  final ConsultationProcessResponseDto _self;
  final $Res Function(ConsultationProcessResponseDto) _then;

/// Create a copy of ConsultationProcessResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? consultationId = null,Object? section = null,Object? transcription = freezed,Object? suggestedText = freezed,Object? aiSuggested = freezed,Object? audioPath = freezed,}) {
  return _then(_self.copyWith(
consultationId: null == consultationId ? _self.consultationId : consultationId // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,transcription: freezed == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String?,suggestedText: freezed == suggestedText ? _self.suggestedText : suggestedText // ignore: cast_nullable_to_non_nullable
as String?,aiSuggested: freezed == aiSuggested ? _self.aiSuggested : aiSuggested // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,audioPath: freezed == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsultationProcessResponseDto].
extension ConsultationProcessResponseDtoPatterns on ConsultationProcessResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationProcessResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationProcessResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationProcessResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationProcessResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationProcessResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationProcessResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'consultation_id')  String consultationId,  String section,  String? transcription, @JsonKey(name: 'suggested_text')  String? suggestedText, @JsonKey(name: 'ai_suggested')  Map<String, dynamic>? aiSuggested, @JsonKey(name: 'audio_path')  String? audioPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationProcessResponseDto() when $default != null:
return $default(_that.consultationId,_that.section,_that.transcription,_that.suggestedText,_that.aiSuggested,_that.audioPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'consultation_id')  String consultationId,  String section,  String? transcription, @JsonKey(name: 'suggested_text')  String? suggestedText, @JsonKey(name: 'ai_suggested')  Map<String, dynamic>? aiSuggested, @JsonKey(name: 'audio_path')  String? audioPath)  $default,) {final _that = this;
switch (_that) {
case _ConsultationProcessResponseDto():
return $default(_that.consultationId,_that.section,_that.transcription,_that.suggestedText,_that.aiSuggested,_that.audioPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'consultation_id')  String consultationId,  String section,  String? transcription, @JsonKey(name: 'suggested_text')  String? suggestedText, @JsonKey(name: 'ai_suggested')  Map<String, dynamic>? aiSuggested, @JsonKey(name: 'audio_path')  String? audioPath)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationProcessResponseDto() when $default != null:
return $default(_that.consultationId,_that.section,_that.transcription,_that.suggestedText,_that.aiSuggested,_that.audioPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsultationProcessResponseDto extends ConsultationProcessResponseDto {
  const _ConsultationProcessResponseDto({@JsonKey(name: 'consultation_id') required this.consultationId, required this.section, this.transcription, @JsonKey(name: 'suggested_text') this.suggestedText, @JsonKey(name: 'ai_suggested') final  Map<String, dynamic>? aiSuggested, @JsonKey(name: 'audio_path') this.audioPath}): _aiSuggested = aiSuggested,super._();
  factory _ConsultationProcessResponseDto.fromJson(Map<String, dynamic> json) => _$ConsultationProcessResponseDtoFromJson(json);

@override@JsonKey(name: 'consultation_id') final  String consultationId;
@override final  String section;
@override final  String? transcription;
@override@JsonKey(name: 'suggested_text') final  String? suggestedText;
 final  Map<String, dynamic>? _aiSuggested;
@override@JsonKey(name: 'ai_suggested') Map<String, dynamic>? get aiSuggested {
  final value = _aiSuggested;
  if (value == null) return null;
  if (_aiSuggested is EqualUnmodifiableMapView) return _aiSuggested;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'audio_path') final  String? audioPath;

/// Create a copy of ConsultationProcessResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationProcessResponseDtoCopyWith<_ConsultationProcessResponseDto> get copyWith => __$ConsultationProcessResponseDtoCopyWithImpl<_ConsultationProcessResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsultationProcessResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationProcessResponseDto&&(identical(other.consultationId, consultationId) || other.consultationId == consultationId)&&(identical(other.section, section) || other.section == section)&&(identical(other.transcription, transcription) || other.transcription == transcription)&&(identical(other.suggestedText, suggestedText) || other.suggestedText == suggestedText)&&const DeepCollectionEquality().equals(other._aiSuggested, _aiSuggested)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consultationId,section,transcription,suggestedText,const DeepCollectionEquality().hash(_aiSuggested),audioPath);

@override
String toString() {
  return 'ConsultationProcessResponseDto(consultationId: $consultationId, section: $section, transcription: $transcription, suggestedText: $suggestedText, aiSuggested: $aiSuggested, audioPath: $audioPath)';
}


}

/// @nodoc
abstract mixin class _$ConsultationProcessResponseDtoCopyWith<$Res> implements $ConsultationProcessResponseDtoCopyWith<$Res> {
  factory _$ConsultationProcessResponseDtoCopyWith(_ConsultationProcessResponseDto value, $Res Function(_ConsultationProcessResponseDto) _then) = __$ConsultationProcessResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'consultation_id') String consultationId, String section, String? transcription,@JsonKey(name: 'suggested_text') String? suggestedText,@JsonKey(name: 'ai_suggested') Map<String, dynamic>? aiSuggested,@JsonKey(name: 'audio_path') String? audioPath
});




}
/// @nodoc
class __$ConsultationProcessResponseDtoCopyWithImpl<$Res>
    implements _$ConsultationProcessResponseDtoCopyWith<$Res> {
  __$ConsultationProcessResponseDtoCopyWithImpl(this._self, this._then);

  final _ConsultationProcessResponseDto _self;
  final $Res Function(_ConsultationProcessResponseDto) _then;

/// Create a copy of ConsultationProcessResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? consultationId = null,Object? section = null,Object? transcription = freezed,Object? suggestedText = freezed,Object? aiSuggested = freezed,Object? audioPath = freezed,}) {
  return _then(_ConsultationProcessResponseDto(
consultationId: null == consultationId ? _self.consultationId : consultationId // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,transcription: freezed == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String?,suggestedText: freezed == suggestedText ? _self.suggestedText : suggestedText // ignore: cast_nullable_to_non_nullable
as String?,aiSuggested: freezed == aiSuggested ? _self._aiSuggested : aiSuggested // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,audioPath: freezed == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
