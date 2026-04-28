// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatientDto {

 String get id; String get name; String get species; String get sex; String get ownerName; DateTime get createdAt; String? get breed; int? get ageYears; DateTime? get dateOfBirth; double? get weightKg; String? get microchip; String? get ownerPhone; String? get ownerEmail; String? get veterinarianId;
/// Create a copy of PatientDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientDtoCopyWith<PatientDto> get copyWith => _$PatientDtoCopyWithImpl<PatientDto>(this as PatientDto, _$identity);

  /// Serializes this PatientDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.ageYears, ageYears) || other.ageYears == ageYears)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.microchip, microchip) || other.microchip == microchip)&&(identical(other.ownerPhone, ownerPhone) || other.ownerPhone == ownerPhone)&&(identical(other.ownerEmail, ownerEmail) || other.ownerEmail == ownerEmail)&&(identical(other.veterinarianId, veterinarianId) || other.veterinarianId == veterinarianId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,species,sex,ownerName,createdAt,breed,ageYears,dateOfBirth,weightKg,microchip,ownerPhone,ownerEmail,veterinarianId);

@override
String toString() {
  return 'PatientDto(id: $id, name: $name, species: $species, sex: $sex, ownerName: $ownerName, createdAt: $createdAt, breed: $breed, ageYears: $ageYears, dateOfBirth: $dateOfBirth, weightKg: $weightKg, microchip: $microchip, ownerPhone: $ownerPhone, ownerEmail: $ownerEmail, veterinarianId: $veterinarianId)';
}


}

/// @nodoc
abstract mixin class $PatientDtoCopyWith<$Res>  {
  factory $PatientDtoCopyWith(PatientDto value, $Res Function(PatientDto) _then) = _$PatientDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String species, String sex, String ownerName, DateTime createdAt, String? breed, int? ageYears, DateTime? dateOfBirth, double? weightKg, String? microchip, String? ownerPhone, String? ownerEmail, String? veterinarianId
});




}
/// @nodoc
class _$PatientDtoCopyWithImpl<$Res>
    implements $PatientDtoCopyWith<$Res> {
  _$PatientDtoCopyWithImpl(this._self, this._then);

  final PatientDto _self;
  final $Res Function(PatientDto) _then;

/// Create a copy of PatientDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? species = null,Object? sex = null,Object? ownerName = null,Object? createdAt = null,Object? breed = freezed,Object? ageYears = freezed,Object? dateOfBirth = freezed,Object? weightKg = freezed,Object? microchip = freezed,Object? ownerPhone = freezed,Object? ownerEmail = freezed,Object? veterinarianId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,sex: null == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,breed: freezed == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String?,ageYears: freezed == ageYears ? _self.ageYears : ageYears // ignore: cast_nullable_to_non_nullable
as int?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,microchip: freezed == microchip ? _self.microchip : microchip // ignore: cast_nullable_to_non_nullable
as String?,ownerPhone: freezed == ownerPhone ? _self.ownerPhone : ownerPhone // ignore: cast_nullable_to_non_nullable
as String?,ownerEmail: freezed == ownerEmail ? _self.ownerEmail : ownerEmail // ignore: cast_nullable_to_non_nullable
as String?,veterinarianId: freezed == veterinarianId ? _self.veterinarianId : veterinarianId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientDto].
extension PatientDtoPatterns on PatientDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientDto value)  $default,){
final _that = this;
switch (_that) {
case _PatientDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientDto value)?  $default,){
final _that = this;
switch (_that) {
case _PatientDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String species,  String sex,  String ownerName,  DateTime createdAt,  String? breed,  int? ageYears,  DateTime? dateOfBirth,  double? weightKg,  String? microchip,  String? ownerPhone,  String? ownerEmail,  String? veterinarianId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientDto() when $default != null:
return $default(_that.id,_that.name,_that.species,_that.sex,_that.ownerName,_that.createdAt,_that.breed,_that.ageYears,_that.dateOfBirth,_that.weightKg,_that.microchip,_that.ownerPhone,_that.ownerEmail,_that.veterinarianId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String species,  String sex,  String ownerName,  DateTime createdAt,  String? breed,  int? ageYears,  DateTime? dateOfBirth,  double? weightKg,  String? microchip,  String? ownerPhone,  String? ownerEmail,  String? veterinarianId)  $default,) {final _that = this;
switch (_that) {
case _PatientDto():
return $default(_that.id,_that.name,_that.species,_that.sex,_that.ownerName,_that.createdAt,_that.breed,_that.ageYears,_that.dateOfBirth,_that.weightKg,_that.microchip,_that.ownerPhone,_that.ownerEmail,_that.veterinarianId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String species,  String sex,  String ownerName,  DateTime createdAt,  String? breed,  int? ageYears,  DateTime? dateOfBirth,  double? weightKg,  String? microchip,  String? ownerPhone,  String? ownerEmail,  String? veterinarianId)?  $default,) {final _that = this;
switch (_that) {
case _PatientDto() when $default != null:
return $default(_that.id,_that.name,_that.species,_that.sex,_that.ownerName,_that.createdAt,_that.breed,_that.ageYears,_that.dateOfBirth,_that.weightKg,_that.microchip,_that.ownerPhone,_that.ownerEmail,_that.veterinarianId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientDto implements PatientDto {
  const _PatientDto({required this.id, required this.name, required this.species, required this.sex, required this.ownerName, required this.createdAt, this.breed, this.ageYears, this.dateOfBirth, this.weightKg, this.microchip, this.ownerPhone, this.ownerEmail, this.veterinarianId});
  factory _PatientDto.fromJson(Map<String, dynamic> json) => _$PatientDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String species;
@override final  String sex;
@override final  String ownerName;
@override final  DateTime createdAt;
@override final  String? breed;
@override final  int? ageYears;
@override final  DateTime? dateOfBirth;
@override final  double? weightKg;
@override final  String? microchip;
@override final  String? ownerPhone;
@override final  String? ownerEmail;
@override final  String? veterinarianId;

/// Create a copy of PatientDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientDtoCopyWith<_PatientDto> get copyWith => __$PatientDtoCopyWithImpl<_PatientDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.ageYears, ageYears) || other.ageYears == ageYears)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.microchip, microchip) || other.microchip == microchip)&&(identical(other.ownerPhone, ownerPhone) || other.ownerPhone == ownerPhone)&&(identical(other.ownerEmail, ownerEmail) || other.ownerEmail == ownerEmail)&&(identical(other.veterinarianId, veterinarianId) || other.veterinarianId == veterinarianId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,species,sex,ownerName,createdAt,breed,ageYears,dateOfBirth,weightKg,microchip,ownerPhone,ownerEmail,veterinarianId);

@override
String toString() {
  return 'PatientDto(id: $id, name: $name, species: $species, sex: $sex, ownerName: $ownerName, createdAt: $createdAt, breed: $breed, ageYears: $ageYears, dateOfBirth: $dateOfBirth, weightKg: $weightKg, microchip: $microchip, ownerPhone: $ownerPhone, ownerEmail: $ownerEmail, veterinarianId: $veterinarianId)';
}


}

/// @nodoc
abstract mixin class _$PatientDtoCopyWith<$Res> implements $PatientDtoCopyWith<$Res> {
  factory _$PatientDtoCopyWith(_PatientDto value, $Res Function(_PatientDto) _then) = __$PatientDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String species, String sex, String ownerName, DateTime createdAt, String? breed, int? ageYears, DateTime? dateOfBirth, double? weightKg, String? microchip, String? ownerPhone, String? ownerEmail, String? veterinarianId
});




}
/// @nodoc
class __$PatientDtoCopyWithImpl<$Res>
    implements _$PatientDtoCopyWith<$Res> {
  __$PatientDtoCopyWithImpl(this._self, this._then);

  final _PatientDto _self;
  final $Res Function(_PatientDto) _then;

/// Create a copy of PatientDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? species = null,Object? sex = null,Object? ownerName = null,Object? createdAt = null,Object? breed = freezed,Object? ageYears = freezed,Object? dateOfBirth = freezed,Object? weightKg = freezed,Object? microchip = freezed,Object? ownerPhone = freezed,Object? ownerEmail = freezed,Object? veterinarianId = freezed,}) {
  return _then(_PatientDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,sex: null == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,breed: freezed == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String?,ageYears: freezed == ageYears ? _self.ageYears : ageYears // ignore: cast_nullable_to_non_nullable
as int?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,microchip: freezed == microchip ? _self.microchip : microchip // ignore: cast_nullable_to_non_nullable
as String?,ownerPhone: freezed == ownerPhone ? _self.ownerPhone : ownerPhone // ignore: cast_nullable_to_non_nullable
as String?,ownerEmail: freezed == ownerEmail ? _self.ownerEmail : ownerEmail // ignore: cast_nullable_to_non_nullable
as String?,veterinarianId: freezed == veterinarianId ? _self.veterinarianId : veterinarianId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
