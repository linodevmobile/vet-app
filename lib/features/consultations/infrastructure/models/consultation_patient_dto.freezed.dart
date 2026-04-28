// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_patient_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsultationPatientDto {

 String get id; String get name; String get species;
/// Create a copy of ConsultationPatientDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationPatientDtoCopyWith<ConsultationPatientDto> get copyWith => _$ConsultationPatientDtoCopyWithImpl<ConsultationPatientDto>(this as ConsultationPatientDto, _$identity);

  /// Serializes this ConsultationPatientDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationPatientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,species);

@override
String toString() {
  return 'ConsultationPatientDto(id: $id, name: $name, species: $species)';
}


}

/// @nodoc
abstract mixin class $ConsultationPatientDtoCopyWith<$Res>  {
  factory $ConsultationPatientDtoCopyWith(ConsultationPatientDto value, $Res Function(ConsultationPatientDto) _then) = _$ConsultationPatientDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String species
});




}
/// @nodoc
class _$ConsultationPatientDtoCopyWithImpl<$Res>
    implements $ConsultationPatientDtoCopyWith<$Res> {
  _$ConsultationPatientDtoCopyWithImpl(this._self, this._then);

  final ConsultationPatientDto _self;
  final $Res Function(ConsultationPatientDto) _then;

/// Create a copy of ConsultationPatientDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? species = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsultationPatientDto].
extension ConsultationPatientDtoPatterns on ConsultationPatientDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationPatientDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationPatientDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationPatientDto value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationPatientDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationPatientDto value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationPatientDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String species)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationPatientDto() when $default != null:
return $default(_that.id,_that.name,_that.species);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String species)  $default,) {final _that = this;
switch (_that) {
case _ConsultationPatientDto():
return $default(_that.id,_that.name,_that.species);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String species)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationPatientDto() when $default != null:
return $default(_that.id,_that.name,_that.species);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsultationPatientDto implements ConsultationPatientDto {
  const _ConsultationPatientDto({required this.id, required this.name, required this.species});
  factory _ConsultationPatientDto.fromJson(Map<String, dynamic> json) => _$ConsultationPatientDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String species;

/// Create a copy of ConsultationPatientDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationPatientDtoCopyWith<_ConsultationPatientDto> get copyWith => __$ConsultationPatientDtoCopyWithImpl<_ConsultationPatientDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsultationPatientDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationPatientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,species);

@override
String toString() {
  return 'ConsultationPatientDto(id: $id, name: $name, species: $species)';
}


}

/// @nodoc
abstract mixin class _$ConsultationPatientDtoCopyWith<$Res> implements $ConsultationPatientDtoCopyWith<$Res> {
  factory _$ConsultationPatientDtoCopyWith(_ConsultationPatientDto value, $Res Function(_ConsultationPatientDto) _then) = __$ConsultationPatientDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String species
});




}
/// @nodoc
class __$ConsultationPatientDtoCopyWithImpl<$Res>
    implements _$ConsultationPatientDtoCopyWith<$Res> {
  __$ConsultationPatientDtoCopyWithImpl(this._self, this._then);

  final _ConsultationPatientDto _self;
  final $Res Function(_ConsultationPatientDto) _then;

/// Create a copy of ConsultationPatientDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? species = null,}) {
  return _then(_ConsultationPatientDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
