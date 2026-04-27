// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_section_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsultationSectionDto {

 String get section; String? get text; Map<String, dynamic>? get content; Map<String, dynamic>? get aiSuggested;
/// Create a copy of ConsultationSectionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationSectionDtoCopyWith<ConsultationSectionDto> get copyWith => _$ConsultationSectionDtoCopyWithImpl<ConsultationSectionDto>(this as ConsultationSectionDto, _$identity);

  /// Serializes this ConsultationSectionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationSectionDto&&(identical(other.section, section) || other.section == section)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.content, content)&&const DeepCollectionEquality().equals(other.aiSuggested, aiSuggested));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,section,text,const DeepCollectionEquality().hash(content),const DeepCollectionEquality().hash(aiSuggested));

@override
String toString() {
  return 'ConsultationSectionDto(section: $section, text: $text, content: $content, aiSuggested: $aiSuggested)';
}


}

/// @nodoc
abstract mixin class $ConsultationSectionDtoCopyWith<$Res>  {
  factory $ConsultationSectionDtoCopyWith(ConsultationSectionDto value, $Res Function(ConsultationSectionDto) _then) = _$ConsultationSectionDtoCopyWithImpl;
@useResult
$Res call({
 String section, String? text, Map<String, dynamic>? content, Map<String, dynamic>? aiSuggested
});




}
/// @nodoc
class _$ConsultationSectionDtoCopyWithImpl<$Res>
    implements $ConsultationSectionDtoCopyWith<$Res> {
  _$ConsultationSectionDtoCopyWithImpl(this._self, this._then);

  final ConsultationSectionDto _self;
  final $Res Function(ConsultationSectionDto) _then;

/// Create a copy of ConsultationSectionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? section = null,Object? text = freezed,Object? content = freezed,Object? aiSuggested = freezed,}) {
  return _then(_self.copyWith(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,aiSuggested: freezed == aiSuggested ? _self.aiSuggested : aiSuggested // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsultationSectionDto].
extension ConsultationSectionDtoPatterns on ConsultationSectionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationSectionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationSectionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationSectionDto value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationSectionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationSectionDto value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationSectionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String section,  String? text,  Map<String, dynamic>? content,  Map<String, dynamic>? aiSuggested)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationSectionDto() when $default != null:
return $default(_that.section,_that.text,_that.content,_that.aiSuggested);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String section,  String? text,  Map<String, dynamic>? content,  Map<String, dynamic>? aiSuggested)  $default,) {final _that = this;
switch (_that) {
case _ConsultationSectionDto():
return $default(_that.section,_that.text,_that.content,_that.aiSuggested);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String section,  String? text,  Map<String, dynamic>? content,  Map<String, dynamic>? aiSuggested)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationSectionDto() when $default != null:
return $default(_that.section,_that.text,_that.content,_that.aiSuggested);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsultationSectionDto implements ConsultationSectionDto {
  const _ConsultationSectionDto({required this.section, this.text, final  Map<String, dynamic>? content, final  Map<String, dynamic>? aiSuggested}): _content = content,_aiSuggested = aiSuggested;
  factory _ConsultationSectionDto.fromJson(Map<String, dynamic> json) => _$ConsultationSectionDtoFromJson(json);

@override final  String section;
@override final  String? text;
 final  Map<String, dynamic>? _content;
@override Map<String, dynamic>? get content {
  final value = _content;
  if (value == null) return null;
  if (_content is EqualUnmodifiableMapView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _aiSuggested;
@override Map<String, dynamic>? get aiSuggested {
  final value = _aiSuggested;
  if (value == null) return null;
  if (_aiSuggested is EqualUnmodifiableMapView) return _aiSuggested;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ConsultationSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationSectionDtoCopyWith<_ConsultationSectionDto> get copyWith => __$ConsultationSectionDtoCopyWithImpl<_ConsultationSectionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsultationSectionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationSectionDto&&(identical(other.section, section) || other.section == section)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._content, _content)&&const DeepCollectionEquality().equals(other._aiSuggested, _aiSuggested));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,section,text,const DeepCollectionEquality().hash(_content),const DeepCollectionEquality().hash(_aiSuggested));

@override
String toString() {
  return 'ConsultationSectionDto(section: $section, text: $text, content: $content, aiSuggested: $aiSuggested)';
}


}

/// @nodoc
abstract mixin class _$ConsultationSectionDtoCopyWith<$Res> implements $ConsultationSectionDtoCopyWith<$Res> {
  factory _$ConsultationSectionDtoCopyWith(_ConsultationSectionDto value, $Res Function(_ConsultationSectionDto) _then) = __$ConsultationSectionDtoCopyWithImpl;
@override @useResult
$Res call({
 String section, String? text, Map<String, dynamic>? content, Map<String, dynamic>? aiSuggested
});




}
/// @nodoc
class __$ConsultationSectionDtoCopyWithImpl<$Res>
    implements _$ConsultationSectionDtoCopyWith<$Res> {
  __$ConsultationSectionDtoCopyWithImpl(this._self, this._then);

  final _ConsultationSectionDto _self;
  final $Res Function(_ConsultationSectionDto) _then;

/// Create a copy of ConsultationSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? section = null,Object? text = freezed,Object? content = freezed,Object? aiSuggested = freezed,}) {
  return _then(_ConsultationSectionDto(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,aiSuggested: freezed == aiSuggested ? _self._aiSuggested : aiSuggested // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
