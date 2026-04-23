// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_section_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConsultationSectionContent {

 ConsultationSection get section; String? get text;
/// Create a copy of ConsultationSectionContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationSectionContentCopyWith<ConsultationSectionContent> get copyWith => _$ConsultationSectionContentCopyWithImpl<ConsultationSectionContent>(this as ConsultationSectionContent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationSectionContent&&(identical(other.section, section) || other.section == section)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,section,text);

@override
String toString() {
  return 'ConsultationSectionContent(section: $section, text: $text)';
}


}

/// @nodoc
abstract mixin class $ConsultationSectionContentCopyWith<$Res>  {
  factory $ConsultationSectionContentCopyWith(ConsultationSectionContent value, $Res Function(ConsultationSectionContent) _then) = _$ConsultationSectionContentCopyWithImpl;
@useResult
$Res call({
 ConsultationSection section, String? text
});




}
/// @nodoc
class _$ConsultationSectionContentCopyWithImpl<$Res>
    implements $ConsultationSectionContentCopyWith<$Res> {
  _$ConsultationSectionContentCopyWithImpl(this._self, this._then);

  final ConsultationSectionContent _self;
  final $Res Function(ConsultationSectionContent) _then;

/// Create a copy of ConsultationSectionContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? section = null,Object? text = freezed,}) {
  return _then(_self.copyWith(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as ConsultationSection,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsultationSectionContent].
extension ConsultationSectionContentPatterns on ConsultationSectionContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationSectionContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationSectionContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationSectionContent value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationSectionContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationSectionContent value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationSectionContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConsultationSection section,  String? text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationSectionContent() when $default != null:
return $default(_that.section,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConsultationSection section,  String? text)  $default,) {final _that = this;
switch (_that) {
case _ConsultationSectionContent():
return $default(_that.section,_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConsultationSection section,  String? text)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationSectionContent() when $default != null:
return $default(_that.section,_that.text);case _:
  return null;

}
}

}

/// @nodoc


class _ConsultationSectionContent implements ConsultationSectionContent {
  const _ConsultationSectionContent({required this.section, this.text});
  

@override final  ConsultationSection section;
@override final  String? text;

/// Create a copy of ConsultationSectionContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationSectionContentCopyWith<_ConsultationSectionContent> get copyWith => __$ConsultationSectionContentCopyWithImpl<_ConsultationSectionContent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationSectionContent&&(identical(other.section, section) || other.section == section)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,section,text);

@override
String toString() {
  return 'ConsultationSectionContent(section: $section, text: $text)';
}


}

/// @nodoc
abstract mixin class _$ConsultationSectionContentCopyWith<$Res> implements $ConsultationSectionContentCopyWith<$Res> {
  factory _$ConsultationSectionContentCopyWith(_ConsultationSectionContent value, $Res Function(_ConsultationSectionContent) _then) = __$ConsultationSectionContentCopyWithImpl;
@override @useResult
$Res call({
 ConsultationSection section, String? text
});




}
/// @nodoc
class __$ConsultationSectionContentCopyWithImpl<$Res>
    implements _$ConsultationSectionContentCopyWith<$Res> {
  __$ConsultationSectionContentCopyWithImpl(this._self, this._then);

  final _ConsultationSectionContent _self;
  final $Res Function(_ConsultationSectionContent) _then;

/// Create a copy of ConsultationSectionContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? section = null,Object? text = freezed,}) {
  return _then(_ConsultationSectionContent(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as ConsultationSection,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
