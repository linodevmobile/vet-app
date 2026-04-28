// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_sign_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsultationSignRequest {

 String get result;@JsonKey(includeIfNull: false) String? get summary;@JsonKey(name: 'primary_diagnosis', includeIfNull: false) String? get primaryDiagnosis;
/// Create a copy of ConsultationSignRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationSignRequestCopyWith<ConsultationSignRequest> get copyWith => _$ConsultationSignRequestCopyWithImpl<ConsultationSignRequest>(this as ConsultationSignRequest, _$identity);

  /// Serializes this ConsultationSignRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationSignRequest&&(identical(other.result, result) || other.result == result)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.primaryDiagnosis, primaryDiagnosis) || other.primaryDiagnosis == primaryDiagnosis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,summary,primaryDiagnosis);

@override
String toString() {
  return 'ConsultationSignRequest(result: $result, summary: $summary, primaryDiagnosis: $primaryDiagnosis)';
}


}

/// @nodoc
abstract mixin class $ConsultationSignRequestCopyWith<$Res>  {
  factory $ConsultationSignRequestCopyWith(ConsultationSignRequest value, $Res Function(ConsultationSignRequest) _then) = _$ConsultationSignRequestCopyWithImpl;
@useResult
$Res call({
 String result,@JsonKey(includeIfNull: false) String? summary,@JsonKey(name: 'primary_diagnosis', includeIfNull: false) String? primaryDiagnosis
});




}
/// @nodoc
class _$ConsultationSignRequestCopyWithImpl<$Res>
    implements $ConsultationSignRequestCopyWith<$Res> {
  _$ConsultationSignRequestCopyWithImpl(this._self, this._then);

  final ConsultationSignRequest _self;
  final $Res Function(ConsultationSignRequest) _then;

/// Create a copy of ConsultationSignRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = null,Object? summary = freezed,Object? primaryDiagnosis = freezed,}) {
  return _then(_self.copyWith(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,primaryDiagnosis: freezed == primaryDiagnosis ? _self.primaryDiagnosis : primaryDiagnosis // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsultationSignRequest].
extension ConsultationSignRequestPatterns on ConsultationSignRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationSignRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationSignRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationSignRequest value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationSignRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationSignRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationSignRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String result, @JsonKey(includeIfNull: false)  String? summary, @JsonKey(name: 'primary_diagnosis', includeIfNull: false)  String? primaryDiagnosis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationSignRequest() when $default != null:
return $default(_that.result,_that.summary,_that.primaryDiagnosis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String result, @JsonKey(includeIfNull: false)  String? summary, @JsonKey(name: 'primary_diagnosis', includeIfNull: false)  String? primaryDiagnosis)  $default,) {final _that = this;
switch (_that) {
case _ConsultationSignRequest():
return $default(_that.result,_that.summary,_that.primaryDiagnosis);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String result, @JsonKey(includeIfNull: false)  String? summary, @JsonKey(name: 'primary_diagnosis', includeIfNull: false)  String? primaryDiagnosis)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationSignRequest() when $default != null:
return $default(_that.result,_that.summary,_that.primaryDiagnosis);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsultationSignRequest implements ConsultationSignRequest {
  const _ConsultationSignRequest({required this.result, @JsonKey(includeIfNull: false) this.summary, @JsonKey(name: 'primary_diagnosis', includeIfNull: false) this.primaryDiagnosis});
  factory _ConsultationSignRequest.fromJson(Map<String, dynamic> json) => _$ConsultationSignRequestFromJson(json);

@override final  String result;
@override@JsonKey(includeIfNull: false) final  String? summary;
@override@JsonKey(name: 'primary_diagnosis', includeIfNull: false) final  String? primaryDiagnosis;

/// Create a copy of ConsultationSignRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationSignRequestCopyWith<_ConsultationSignRequest> get copyWith => __$ConsultationSignRequestCopyWithImpl<_ConsultationSignRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsultationSignRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationSignRequest&&(identical(other.result, result) || other.result == result)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.primaryDiagnosis, primaryDiagnosis) || other.primaryDiagnosis == primaryDiagnosis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,summary,primaryDiagnosis);

@override
String toString() {
  return 'ConsultationSignRequest(result: $result, summary: $summary, primaryDiagnosis: $primaryDiagnosis)';
}


}

/// @nodoc
abstract mixin class _$ConsultationSignRequestCopyWith<$Res> implements $ConsultationSignRequestCopyWith<$Res> {
  factory _$ConsultationSignRequestCopyWith(_ConsultationSignRequest value, $Res Function(_ConsultationSignRequest) _then) = __$ConsultationSignRequestCopyWithImpl;
@override @useResult
$Res call({
 String result,@JsonKey(includeIfNull: false) String? summary,@JsonKey(name: 'primary_diagnosis', includeIfNull: false) String? primaryDiagnosis
});




}
/// @nodoc
class __$ConsultationSignRequestCopyWithImpl<$Res>
    implements _$ConsultationSignRequestCopyWith<$Res> {
  __$ConsultationSignRequestCopyWithImpl(this._self, this._then);

  final _ConsultationSignRequest _self;
  final $Res Function(_ConsultationSignRequest) _then;

/// Create a copy of ConsultationSignRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = null,Object? summary = freezed,Object? primaryDiagnosis = freezed,}) {
  return _then(_ConsultationSignRequest(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,primaryDiagnosis: freezed == primaryDiagnosis ? _self.primaryDiagnosis : primaryDiagnosis // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
