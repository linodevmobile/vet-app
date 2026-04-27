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

 String get suggestedText; String? get transcription; Map<String, dynamic>? get aiSuggested;
/// Create a copy of ConsultationProcessResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationProcessResultCopyWith<ConsultationProcessResult> get copyWith => _$ConsultationProcessResultCopyWithImpl<ConsultationProcessResult>(this as ConsultationProcessResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationProcessResult&&(identical(other.suggestedText, suggestedText) || other.suggestedText == suggestedText)&&(identical(other.transcription, transcription) || other.transcription == transcription)&&const DeepCollectionEquality().equals(other.aiSuggested, aiSuggested));
}


@override
int get hashCode => Object.hash(runtimeType,suggestedText,transcription,const DeepCollectionEquality().hash(aiSuggested));

@override
String toString() {
  return 'ConsultationProcessResult(suggestedText: $suggestedText, transcription: $transcription, aiSuggested: $aiSuggested)';
}


}

/// @nodoc
abstract mixin class $ConsultationProcessResultCopyWith<$Res>  {
  factory $ConsultationProcessResultCopyWith(ConsultationProcessResult value, $Res Function(ConsultationProcessResult) _then) = _$ConsultationProcessResultCopyWithImpl;
@useResult
$Res call({
 String suggestedText, String? transcription, Map<String, dynamic>? aiSuggested
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
@pragma('vm:prefer-inline') @override $Res call({Object? suggestedText = null,Object? transcription = freezed,Object? aiSuggested = freezed,}) {
  return _then(_self.copyWith(
suggestedText: null == suggestedText ? _self.suggestedText : suggestedText // ignore: cast_nullable_to_non_nullable
as String,transcription: freezed == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String?,aiSuggested: freezed == aiSuggested ? _self.aiSuggested : aiSuggested // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String suggestedText,  String? transcription,  Map<String, dynamic>? aiSuggested)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationProcessResult() when $default != null:
return $default(_that.suggestedText,_that.transcription,_that.aiSuggested);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String suggestedText,  String? transcription,  Map<String, dynamic>? aiSuggested)  $default,) {final _that = this;
switch (_that) {
case _ConsultationProcessResult():
return $default(_that.suggestedText,_that.transcription,_that.aiSuggested);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String suggestedText,  String? transcription,  Map<String, dynamic>? aiSuggested)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationProcessResult() when $default != null:
return $default(_that.suggestedText,_that.transcription,_that.aiSuggested);case _:
  return null;

}
}

}

/// @nodoc


class _ConsultationProcessResult implements ConsultationProcessResult {
  const _ConsultationProcessResult({required this.suggestedText, this.transcription, final  Map<String, dynamic>? aiSuggested}): _aiSuggested = aiSuggested;
  

@override final  String suggestedText;
@override final  String? transcription;
 final  Map<String, dynamic>? _aiSuggested;
@override Map<String, dynamic>? get aiSuggested {
  final value = _aiSuggested;
  if (value == null) return null;
  if (_aiSuggested is EqualUnmodifiableMapView) return _aiSuggested;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ConsultationProcessResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationProcessResultCopyWith<_ConsultationProcessResult> get copyWith => __$ConsultationProcessResultCopyWithImpl<_ConsultationProcessResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationProcessResult&&(identical(other.suggestedText, suggestedText) || other.suggestedText == suggestedText)&&(identical(other.transcription, transcription) || other.transcription == transcription)&&const DeepCollectionEquality().equals(other._aiSuggested, _aiSuggested));
}


@override
int get hashCode => Object.hash(runtimeType,suggestedText,transcription,const DeepCollectionEquality().hash(_aiSuggested));

@override
String toString() {
  return 'ConsultationProcessResult(suggestedText: $suggestedText, transcription: $transcription, aiSuggested: $aiSuggested)';
}


}

/// @nodoc
abstract mixin class _$ConsultationProcessResultCopyWith<$Res> implements $ConsultationProcessResultCopyWith<$Res> {
  factory _$ConsultationProcessResultCopyWith(_ConsultationProcessResult value, $Res Function(_ConsultationProcessResult) _then) = __$ConsultationProcessResultCopyWithImpl;
@override @useResult
$Res call({
 String suggestedText, String? transcription, Map<String, dynamic>? aiSuggested
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
@override @pragma('vm:prefer-inline') $Res call({Object? suggestedText = null,Object? transcription = freezed,Object? aiSuggested = freezed,}) {
  return _then(_ConsultationProcessResult(
suggestedText: null == suggestedText ? _self.suggestedText : suggestedText // ignore: cast_nullable_to_non_nullable
as String,transcription: freezed == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String?,aiSuggested: freezed == aiSuggested ? _self._aiSuggested : aiSuggested // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
