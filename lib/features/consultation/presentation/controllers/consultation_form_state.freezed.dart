// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConsultationFormState {

 String? get food; String? get mucosa; String? get bcs; String? get attitudeOwner; String? get attitudeVet; String? get pulse; String? get treatment; double get dehydration;
/// Create a copy of ConsultationFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationFormStateCopyWith<ConsultationFormState> get copyWith => _$ConsultationFormStateCopyWithImpl<ConsultationFormState>(this as ConsultationFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationFormState&&(identical(other.food, food) || other.food == food)&&(identical(other.mucosa, mucosa) || other.mucosa == mucosa)&&(identical(other.bcs, bcs) || other.bcs == bcs)&&(identical(other.attitudeOwner, attitudeOwner) || other.attitudeOwner == attitudeOwner)&&(identical(other.attitudeVet, attitudeVet) || other.attitudeVet == attitudeVet)&&(identical(other.pulse, pulse) || other.pulse == pulse)&&(identical(other.treatment, treatment) || other.treatment == treatment)&&(identical(other.dehydration, dehydration) || other.dehydration == dehydration));
}


@override
int get hashCode => Object.hash(runtimeType,food,mucosa,bcs,attitudeOwner,attitudeVet,pulse,treatment,dehydration);

@override
String toString() {
  return 'ConsultationFormState(food: $food, mucosa: $mucosa, bcs: $bcs, attitudeOwner: $attitudeOwner, attitudeVet: $attitudeVet, pulse: $pulse, treatment: $treatment, dehydration: $dehydration)';
}


}

/// @nodoc
abstract mixin class $ConsultationFormStateCopyWith<$Res>  {
  factory $ConsultationFormStateCopyWith(ConsultationFormState value, $Res Function(ConsultationFormState) _then) = _$ConsultationFormStateCopyWithImpl;
@useResult
$Res call({
 String? food, String? mucosa, String? bcs, String? attitudeOwner, String? attitudeVet, String? pulse, String? treatment, double dehydration
});




}
/// @nodoc
class _$ConsultationFormStateCopyWithImpl<$Res>
    implements $ConsultationFormStateCopyWith<$Res> {
  _$ConsultationFormStateCopyWithImpl(this._self, this._then);

  final ConsultationFormState _self;
  final $Res Function(ConsultationFormState) _then;

/// Create a copy of ConsultationFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? food = freezed,Object? mucosa = freezed,Object? bcs = freezed,Object? attitudeOwner = freezed,Object? attitudeVet = freezed,Object? pulse = freezed,Object? treatment = freezed,Object? dehydration = null,}) {
  return _then(_self.copyWith(
food: freezed == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as String?,mucosa: freezed == mucosa ? _self.mucosa : mucosa // ignore: cast_nullable_to_non_nullable
as String?,bcs: freezed == bcs ? _self.bcs : bcs // ignore: cast_nullable_to_non_nullable
as String?,attitudeOwner: freezed == attitudeOwner ? _self.attitudeOwner : attitudeOwner // ignore: cast_nullable_to_non_nullable
as String?,attitudeVet: freezed == attitudeVet ? _self.attitudeVet : attitudeVet // ignore: cast_nullable_to_non_nullable
as String?,pulse: freezed == pulse ? _self.pulse : pulse // ignore: cast_nullable_to_non_nullable
as String?,treatment: freezed == treatment ? _self.treatment : treatment // ignore: cast_nullable_to_non_nullable
as String?,dehydration: null == dehydration ? _self.dehydration : dehydration // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsultationFormState].
extension ConsultationFormStatePatterns on ConsultationFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationFormState value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? food,  String? mucosa,  String? bcs,  String? attitudeOwner,  String? attitudeVet,  String? pulse,  String? treatment,  double dehydration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationFormState() when $default != null:
return $default(_that.food,_that.mucosa,_that.bcs,_that.attitudeOwner,_that.attitudeVet,_that.pulse,_that.treatment,_that.dehydration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? food,  String? mucosa,  String? bcs,  String? attitudeOwner,  String? attitudeVet,  String? pulse,  String? treatment,  double dehydration)  $default,) {final _that = this;
switch (_that) {
case _ConsultationFormState():
return $default(_that.food,_that.mucosa,_that.bcs,_that.attitudeOwner,_that.attitudeVet,_that.pulse,_that.treatment,_that.dehydration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? food,  String? mucosa,  String? bcs,  String? attitudeOwner,  String? attitudeVet,  String? pulse,  String? treatment,  double dehydration)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationFormState() when $default != null:
return $default(_that.food,_that.mucosa,_that.bcs,_that.attitudeOwner,_that.attitudeVet,_that.pulse,_that.treatment,_that.dehydration);case _:
  return null;

}
}

}

/// @nodoc


class _ConsultationFormState implements ConsultationFormState {
  const _ConsultationFormState({this.food, this.mucosa, this.bcs, this.attitudeOwner, this.attitudeVet, this.pulse, this.treatment, this.dehydration = 0});
  

@override final  String? food;
@override final  String? mucosa;
@override final  String? bcs;
@override final  String? attitudeOwner;
@override final  String? attitudeVet;
@override final  String? pulse;
@override final  String? treatment;
@override@JsonKey() final  double dehydration;

/// Create a copy of ConsultationFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationFormStateCopyWith<_ConsultationFormState> get copyWith => __$ConsultationFormStateCopyWithImpl<_ConsultationFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationFormState&&(identical(other.food, food) || other.food == food)&&(identical(other.mucosa, mucosa) || other.mucosa == mucosa)&&(identical(other.bcs, bcs) || other.bcs == bcs)&&(identical(other.attitudeOwner, attitudeOwner) || other.attitudeOwner == attitudeOwner)&&(identical(other.attitudeVet, attitudeVet) || other.attitudeVet == attitudeVet)&&(identical(other.pulse, pulse) || other.pulse == pulse)&&(identical(other.treatment, treatment) || other.treatment == treatment)&&(identical(other.dehydration, dehydration) || other.dehydration == dehydration));
}


@override
int get hashCode => Object.hash(runtimeType,food,mucosa,bcs,attitudeOwner,attitudeVet,pulse,treatment,dehydration);

@override
String toString() {
  return 'ConsultationFormState(food: $food, mucosa: $mucosa, bcs: $bcs, attitudeOwner: $attitudeOwner, attitudeVet: $attitudeVet, pulse: $pulse, treatment: $treatment, dehydration: $dehydration)';
}


}

/// @nodoc
abstract mixin class _$ConsultationFormStateCopyWith<$Res> implements $ConsultationFormStateCopyWith<$Res> {
  factory _$ConsultationFormStateCopyWith(_ConsultationFormState value, $Res Function(_ConsultationFormState) _then) = __$ConsultationFormStateCopyWithImpl;
@override @useResult
$Res call({
 String? food, String? mucosa, String? bcs, String? attitudeOwner, String? attitudeVet, String? pulse, String? treatment, double dehydration
});




}
/// @nodoc
class __$ConsultationFormStateCopyWithImpl<$Res>
    implements _$ConsultationFormStateCopyWith<$Res> {
  __$ConsultationFormStateCopyWithImpl(this._self, this._then);

  final _ConsultationFormState _self;
  final $Res Function(_ConsultationFormState) _then;

/// Create a copy of ConsultationFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? food = freezed,Object? mucosa = freezed,Object? bcs = freezed,Object? attitudeOwner = freezed,Object? attitudeVet = freezed,Object? pulse = freezed,Object? treatment = freezed,Object? dehydration = null,}) {
  return _then(_ConsultationFormState(
food: freezed == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as String?,mucosa: freezed == mucosa ? _self.mucosa : mucosa // ignore: cast_nullable_to_non_nullable
as String?,bcs: freezed == bcs ? _self.bcs : bcs // ignore: cast_nullable_to_non_nullable
as String?,attitudeOwner: freezed == attitudeOwner ? _self.attitudeOwner : attitudeOwner // ignore: cast_nullable_to_non_nullable
as String?,attitudeVet: freezed == attitudeVet ? _self.attitudeVet : attitudeVet // ignore: cast_nullable_to_non_nullable
as String?,pulse: freezed == pulse ? _self.pulse : pulse // ignore: cast_nullable_to_non_nullable
as String?,treatment: freezed == treatment ? _self.treatment : treatment // ignore: cast_nullable_to_non_nullable
as String?,dehydration: null == dehydration ? _self.dehydration : dehydration // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
