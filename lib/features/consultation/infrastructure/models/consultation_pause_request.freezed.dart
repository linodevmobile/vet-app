// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_pause_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsultationPauseRequest {

 String get reason;@JsonKey(includeIfNull: false) String? get note;
/// Create a copy of ConsultationPauseRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationPauseRequestCopyWith<ConsultationPauseRequest> get copyWith => _$ConsultationPauseRequestCopyWithImpl<ConsultationPauseRequest>(this as ConsultationPauseRequest, _$identity);

  /// Serializes this ConsultationPauseRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationPauseRequest&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,note);

@override
String toString() {
  return 'ConsultationPauseRequest(reason: $reason, note: $note)';
}


}

/// @nodoc
abstract mixin class $ConsultationPauseRequestCopyWith<$Res>  {
  factory $ConsultationPauseRequestCopyWith(ConsultationPauseRequest value, $Res Function(ConsultationPauseRequest) _then) = _$ConsultationPauseRequestCopyWithImpl;
@useResult
$Res call({
 String reason,@JsonKey(includeIfNull: false) String? note
});




}
/// @nodoc
class _$ConsultationPauseRequestCopyWithImpl<$Res>
    implements $ConsultationPauseRequestCopyWith<$Res> {
  _$ConsultationPauseRequestCopyWithImpl(this._self, this._then);

  final ConsultationPauseRequest _self;
  final $Res Function(ConsultationPauseRequest) _then;

/// Create a copy of ConsultationPauseRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsultationPauseRequest].
extension ConsultationPauseRequestPatterns on ConsultationPauseRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationPauseRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationPauseRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationPauseRequest value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationPauseRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationPauseRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationPauseRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reason, @JsonKey(includeIfNull: false)  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationPauseRequest() when $default != null:
return $default(_that.reason,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reason, @JsonKey(includeIfNull: false)  String? note)  $default,) {final _that = this;
switch (_that) {
case _ConsultationPauseRequest():
return $default(_that.reason,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reason, @JsonKey(includeIfNull: false)  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationPauseRequest() when $default != null:
return $default(_that.reason,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsultationPauseRequest implements ConsultationPauseRequest {
  const _ConsultationPauseRequest({required this.reason, @JsonKey(includeIfNull: false) this.note});
  factory _ConsultationPauseRequest.fromJson(Map<String, dynamic> json) => _$ConsultationPauseRequestFromJson(json);

@override final  String reason;
@override@JsonKey(includeIfNull: false) final  String? note;

/// Create a copy of ConsultationPauseRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationPauseRequestCopyWith<_ConsultationPauseRequest> get copyWith => __$ConsultationPauseRequestCopyWithImpl<_ConsultationPauseRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsultationPauseRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationPauseRequest&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,note);

@override
String toString() {
  return 'ConsultationPauseRequest(reason: $reason, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ConsultationPauseRequestCopyWith<$Res> implements $ConsultationPauseRequestCopyWith<$Res> {
  factory _$ConsultationPauseRequestCopyWith(_ConsultationPauseRequest value, $Res Function(_ConsultationPauseRequest) _then) = __$ConsultationPauseRequestCopyWithImpl;
@override @useResult
$Res call({
 String reason,@JsonKey(includeIfNull: false) String? note
});




}
/// @nodoc
class __$ConsultationPauseRequestCopyWithImpl<$Res>
    implements _$ConsultationPauseRequestCopyWith<$Res> {
  __$ConsultationPauseRequestCopyWithImpl(this._self, this._then);

  final _ConsultationPauseRequest _self;
  final $Res Function(_ConsultationPauseRequest) _then;

/// Create a copy of ConsultationPauseRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? note = freezed,}) {
  return _then(_ConsultationPauseRequest(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
