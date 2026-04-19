// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'veterinarian_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VeterinarianDto {

 String get id; String get email; String get fullName; String? get licenseNumber; String? get phone;
/// Create a copy of VeterinarianDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VeterinarianDtoCopyWith<VeterinarianDto> get copyWith => _$VeterinarianDtoCopyWithImpl<VeterinarianDto>(this as VeterinarianDto, _$identity);

  /// Serializes this VeterinarianDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VeterinarianDto&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName,licenseNumber,phone);

@override
String toString() {
  return 'VeterinarianDto(id: $id, email: $email, fullName: $fullName, licenseNumber: $licenseNumber, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $VeterinarianDtoCopyWith<$Res>  {
  factory $VeterinarianDtoCopyWith(VeterinarianDto value, $Res Function(VeterinarianDto) _then) = _$VeterinarianDtoCopyWithImpl;
@useResult
$Res call({
 String id, String email, String fullName, String? licenseNumber, String? phone
});




}
/// @nodoc
class _$VeterinarianDtoCopyWithImpl<$Res>
    implements $VeterinarianDtoCopyWith<$Res> {
  _$VeterinarianDtoCopyWithImpl(this._self, this._then);

  final VeterinarianDto _self;
  final $Res Function(VeterinarianDto) _then;

/// Create a copy of VeterinarianDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? fullName = null,Object? licenseNumber = freezed,Object? phone = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VeterinarianDto].
extension VeterinarianDtoPatterns on VeterinarianDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VeterinarianDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VeterinarianDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VeterinarianDto value)  $default,){
final _that = this;
switch (_that) {
case _VeterinarianDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VeterinarianDto value)?  $default,){
final _that = this;
switch (_that) {
case _VeterinarianDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String fullName,  String? licenseNumber,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VeterinarianDto() when $default != null:
return $default(_that.id,_that.email,_that.fullName,_that.licenseNumber,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String fullName,  String? licenseNumber,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _VeterinarianDto():
return $default(_that.id,_that.email,_that.fullName,_that.licenseNumber,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String fullName,  String? licenseNumber,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _VeterinarianDto() when $default != null:
return $default(_that.id,_that.email,_that.fullName,_that.licenseNumber,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VeterinarianDto implements VeterinarianDto {
  const _VeterinarianDto({required this.id, required this.email, required this.fullName, this.licenseNumber, this.phone});
  factory _VeterinarianDto.fromJson(Map<String, dynamic> json) => _$VeterinarianDtoFromJson(json);

@override final  String id;
@override final  String email;
@override final  String fullName;
@override final  String? licenseNumber;
@override final  String? phone;

/// Create a copy of VeterinarianDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VeterinarianDtoCopyWith<_VeterinarianDto> get copyWith => __$VeterinarianDtoCopyWithImpl<_VeterinarianDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VeterinarianDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VeterinarianDto&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName,licenseNumber,phone);

@override
String toString() {
  return 'VeterinarianDto(id: $id, email: $email, fullName: $fullName, licenseNumber: $licenseNumber, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$VeterinarianDtoCopyWith<$Res> implements $VeterinarianDtoCopyWith<$Res> {
  factory _$VeterinarianDtoCopyWith(_VeterinarianDto value, $Res Function(_VeterinarianDto) _then) = __$VeterinarianDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String fullName, String? licenseNumber, String? phone
});




}
/// @nodoc
class __$VeterinarianDtoCopyWithImpl<$Res>
    implements _$VeterinarianDtoCopyWith<$Res> {
  __$VeterinarianDtoCopyWithImpl(this._self, this._then);

  final _VeterinarianDto _self;
  final $Res Function(_VeterinarianDto) _then;

/// Create a copy of VeterinarianDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? fullName = null,Object? licenseNumber = freezed,Object? phone = freezed,}) {
  return _then(_VeterinarianDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
