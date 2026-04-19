// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PatientSummary {

 String get id; String get name; Species get species;
/// Create a copy of PatientSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientSummaryCopyWith<PatientSummary> get copyWith => _$PatientSummaryCopyWithImpl<PatientSummary>(this as PatientSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,species);

@override
String toString() {
  return 'PatientSummary(id: $id, name: $name, species: $species)';
}


}

/// @nodoc
abstract mixin class $PatientSummaryCopyWith<$Res>  {
  factory $PatientSummaryCopyWith(PatientSummary value, $Res Function(PatientSummary) _then) = _$PatientSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String name, Species species
});




}
/// @nodoc
class _$PatientSummaryCopyWithImpl<$Res>
    implements $PatientSummaryCopyWith<$Res> {
  _$PatientSummaryCopyWithImpl(this._self, this._then);

  final PatientSummary _self;
  final $Res Function(PatientSummary) _then;

/// Create a copy of PatientSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? species = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as Species,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientSummary].
extension PatientSummaryPatterns on PatientSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientSummary value)  $default,){
final _that = this;
switch (_that) {
case _PatientSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientSummary value)?  $default,){
final _that = this;
switch (_that) {
case _PatientSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  Species species)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientSummary() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  Species species)  $default,) {final _that = this;
switch (_that) {
case _PatientSummary():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  Species species)?  $default,) {final _that = this;
switch (_that) {
case _PatientSummary() when $default != null:
return $default(_that.id,_that.name,_that.species);case _:
  return null;

}
}

}

/// @nodoc


class _PatientSummary implements PatientSummary {
  const _PatientSummary({required this.id, required this.name, required this.species});
  

@override final  String id;
@override final  String name;
@override final  Species species;

/// Create a copy of PatientSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientSummaryCopyWith<_PatientSummary> get copyWith => __$PatientSummaryCopyWithImpl<_PatientSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,species);

@override
String toString() {
  return 'PatientSummary(id: $id, name: $name, species: $species)';
}


}

/// @nodoc
abstract mixin class _$PatientSummaryCopyWith<$Res> implements $PatientSummaryCopyWith<$Res> {
  factory _$PatientSummaryCopyWith(_PatientSummary value, $Res Function(_PatientSummary) _then) = __$PatientSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, Species species
});




}
/// @nodoc
class __$PatientSummaryCopyWithImpl<$Res>
    implements _$PatientSummaryCopyWith<$Res> {
  __$PatientSummaryCopyWithImpl(this._self, this._then);

  final _PatientSummary _self;
  final $Res Function(_PatientSummary) _then;

/// Create a copy of PatientSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? species = null,}) {
  return _then(_PatientSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as Species,
  ));
}


}

// dart format on
