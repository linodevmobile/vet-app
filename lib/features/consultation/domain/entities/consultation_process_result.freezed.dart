// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_process_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConsultationProcessResult {

 String get consultationId; String get section; String get suggestedText; String get transcription;
/// Create a copy of ConsultationProcessResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationProcessResultCopyWith<ConsultationProcessResult> get copyWith => _$ConsultationProcessResultCopyWithImpl<ConsultationProcessResult>(this as ConsultationProcessResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationProcessResult&&(identical(other.consultationId, consultationId) || other.consultationId == consultationId)&&(identical(other.section, section) || other.section == section)&&(identical(other.suggestedText, suggestedText) || other.suggestedText == suggestedText)&&(identical(other.transcription, transcription) || other.transcription == transcription));
}


@override
int get hashCode => Object.hash(runtimeType,consultationId,section,suggestedText,transcription);

@override
String toString() {
  return 'ConsultationProcessResult(consultationId: $consultationId, section: $section, suggestedText: $suggestedText, transcription: $transcription)';
}


}

/// @nodoc
abstract mixin class $ConsultationProcessResultCopyWith<$Res>  {
  factory $ConsultationProcessResultCopyWith(ConsultationProcessResult value, $Res Function(ConsultationProcessResult) _then) = _$ConsultationProcessResultCopyWithImpl;
@useResult
$Res call({
 String consultationId, String section, String suggestedText, String transcription
});




}
/// @nodoc
class _$ConsultationProcessResultCopyWithImpl<$Res>
    implements $ConsultationProcessResultCopyWith<$Res> {
  _$ConsultationProcessResultCopyWithImpl(this._self, this._then);

  final ConsultationProcessResult _self;
  final $Res Function(ConsultationProcessResult) _then;

/// Create a copy of ConsultationProcessResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? consultationId = null,Object? section = null,Object? suggestedText = null,Object? transcription = null,}) {
  return _then(_self.copyWith(
consultationId: null == consultationId ? _self.consultationId : consultationId // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,suggestedText: null == suggestedText ? _self.suggestedText : suggestedText // ignore: cast_nullable_to_non_nullable
as String,transcription: null == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsultationProcessResult].
extension ConsultationProcessResultPatterns on ConsultationProcessResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationProcessResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationProcessResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationProcessResult value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationProcessResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationProcessResult value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationProcessResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String consultationId,  String section,  String suggestedText,  String transcription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationProcessResult() when $default != null:
return $default(_that.consultationId,_that.section,_that.suggestedText,_that.transcription);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String consultationId,  String section,  String suggestedText,  String transcription)  $default,) {final _that = this;
switch (_that) {
case _ConsultationProcessResult():
return $default(_that.consultationId,_that.section,_that.suggestedText,_that.transcription);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String consultationId,  String section,  String suggestedText,  String transcription)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationProcessResult() when $default != null:
return $default(_that.consultationId,_that.section,_that.suggestedText,_that.transcription);case _:
  return null;

}
}

}

/// @nodoc


class _ConsultationProcessResult implements ConsultationProcessResult {
  const _ConsultationProcessResult({required this.consultationId, required this.section, required this.suggestedText, required this.transcription});
  

@override final  String consultationId;
@override final  String section;
@override final  String suggestedText;
@override final  String transcription;

/// Create a copy of ConsultationProcessResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationProcessResultCopyWith<_ConsultationProcessResult> get copyWith => __$ConsultationProcessResultCopyWithImpl<_ConsultationProcessResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationProcessResult&&(identical(other.consultationId, consultationId) || other.consultationId == consultationId)&&(identical(other.section, section) || other.section == section)&&(identical(other.suggestedText, suggestedText) || other.suggestedText == suggestedText)&&(identical(other.transcription, transcription) || other.transcription == transcription));
}


@override
int get hashCode => Object.hash(runtimeType,consultationId,section,suggestedText,transcription);

@override
String toString() {
  return 'ConsultationProcessResult(consultationId: $consultationId, section: $section, suggestedText: $suggestedText, transcription: $transcription)';
}


}

/// @nodoc
abstract mixin class _$ConsultationProcessResultCopyWith<$Res> implements $ConsultationProcessResultCopyWith<$Res> {
  factory _$ConsultationProcessResultCopyWith(_ConsultationProcessResult value, $Res Function(_ConsultationProcessResult) _then) = __$ConsultationProcessResultCopyWithImpl;
@override @useResult
$Res call({
 String consultationId, String section, String suggestedText, String transcription
});




}
/// @nodoc
class __$ConsultationProcessResultCopyWithImpl<$Res>
    implements _$ConsultationProcessResultCopyWith<$Res> {
  __$ConsultationProcessResultCopyWithImpl(this._self, this._then);

  final _ConsultationProcessResult _self;
  final $Res Function(_ConsultationProcessResult) _then;

/// Create a copy of ConsultationProcessResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? consultationId = null,Object? section = null,Object? suggestedText = null,Object? transcription = null,}) {
  return _then(_ConsultationProcessResult(
consultationId: null == consultationId ? _self.consultationId : consultationId // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,suggestedText: null == suggestedText ? _self.suggestedText : suggestedText // ignore: cast_nullable_to_non_nullable
as String,transcription: null == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
