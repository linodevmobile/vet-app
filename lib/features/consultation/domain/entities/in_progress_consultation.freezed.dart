// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'in_progress_consultation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InProgressConsultation {

 String get id; String get patientId; DateTime get createdAt;
/// Create a copy of InProgressConsultation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InProgressConsultationCopyWith<InProgressConsultation> get copyWith => _$InProgressConsultationCopyWithImpl<InProgressConsultation>(this as InProgressConsultation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InProgressConsultation&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,patientId,createdAt);

@override
String toString() {
  return 'InProgressConsultation(id: $id, patientId: $patientId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $InProgressConsultationCopyWith<$Res>  {
  factory $InProgressConsultationCopyWith(InProgressConsultation value, $Res Function(InProgressConsultation) _then) = _$InProgressConsultationCopyWithImpl;
@useResult
$Res call({
 String id, String patientId, DateTime createdAt
});




}
/// @nodoc
class _$InProgressConsultationCopyWithImpl<$Res>
    implements $InProgressConsultationCopyWith<$Res> {
  _$InProgressConsultationCopyWithImpl(this._self, this._then);

  final InProgressConsultation _self;
  final $Res Function(InProgressConsultation) _then;

/// Create a copy of InProgressConsultation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [InProgressConsultation].
extension InProgressConsultationPatterns on InProgressConsultation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InProgressConsultation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InProgressConsultation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InProgressConsultation value)  $default,){
final _that = this;
switch (_that) {
case _InProgressConsultation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InProgressConsultation value)?  $default,){
final _that = this;
switch (_that) {
case _InProgressConsultation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String patientId,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InProgressConsultation() when $default != null:
return $default(_that.id,_that.patientId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String patientId,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _InProgressConsultation():
return $default(_that.id,_that.patientId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String patientId,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _InProgressConsultation() when $default != null:
return $default(_that.id,_that.patientId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _InProgressConsultation implements InProgressConsultation {
  const _InProgressConsultation({required this.id, required this.patientId, required this.createdAt});
  

@override final  String id;
@override final  String patientId;
@override final  DateTime createdAt;

/// Create a copy of InProgressConsultation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InProgressConsultationCopyWith<_InProgressConsultation> get copyWith => __$InProgressConsultationCopyWithImpl<_InProgressConsultation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgressConsultation&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,patientId,createdAt);

@override
String toString() {
  return 'InProgressConsultation(id: $id, patientId: $patientId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$InProgressConsultationCopyWith<$Res> implements $InProgressConsultationCopyWith<$Res> {
  factory _$InProgressConsultationCopyWith(_InProgressConsultation value, $Res Function(_InProgressConsultation) _then) = __$InProgressConsultationCopyWithImpl;
@override @useResult
$Res call({
 String id, String patientId, DateTime createdAt
});




}
/// @nodoc
class __$InProgressConsultationCopyWithImpl<$Res>
    implements _$InProgressConsultationCopyWith<$Res> {
  __$InProgressConsultationCopyWithImpl(this._self, this._then);

  final _InProgressConsultation _self;
  final $Res Function(_InProgressConsultation) _then;

/// Create a copy of InProgressConsultation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? createdAt = null,}) {
  return _then(_InProgressConsultation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
