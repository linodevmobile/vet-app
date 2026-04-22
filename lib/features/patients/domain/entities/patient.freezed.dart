// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Patient {

 String get id; String get name; Species get species; Sex get sex; String get breed; int get ageYears; String get ownerName;// Mientras el backend no exponga `last_visit_at`, los datasources lo
// alimentan con `created_at` para que la UI siga funcionando.
 DateTime get lastVisit; double? get weightKg; String? get ownerPhone; String? get ownerEmail; bool get isAlert; bool get isHospitalized;
/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientCopyWith<Patient> get copyWith => _$PatientCopyWithImpl<Patient>(this as Patient, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.ageYears, ageYears) || other.ageYears == ageYears)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.lastVisit, lastVisit) || other.lastVisit == lastVisit)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.ownerPhone, ownerPhone) || other.ownerPhone == ownerPhone)&&(identical(other.ownerEmail, ownerEmail) || other.ownerEmail == ownerEmail)&&(identical(other.isAlert, isAlert) || other.isAlert == isAlert)&&(identical(other.isHospitalized, isHospitalized) || other.isHospitalized == isHospitalized));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,species,sex,breed,ageYears,ownerName,lastVisit,weightKg,ownerPhone,ownerEmail,isAlert,isHospitalized);

@override
String toString() {
  return 'Patient(id: $id, name: $name, species: $species, sex: $sex, breed: $breed, ageYears: $ageYears, ownerName: $ownerName, lastVisit: $lastVisit, weightKg: $weightKg, ownerPhone: $ownerPhone, ownerEmail: $ownerEmail, isAlert: $isAlert, isHospitalized: $isHospitalized)';
}


}

/// @nodoc
abstract mixin class $PatientCopyWith<$Res>  {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) _then) = _$PatientCopyWithImpl;
@useResult
$Res call({
 String id, String name, Species species, Sex sex, String breed, int ageYears, String ownerName, DateTime lastVisit, double? weightKg, String? ownerPhone, String? ownerEmail, bool isAlert, bool isHospitalized
});




}
/// @nodoc
class _$PatientCopyWithImpl<$Res>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._self, this._then);

  final Patient _self;
  final $Res Function(Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? species = null,Object? sex = null,Object? breed = null,Object? ageYears = null,Object? ownerName = null,Object? lastVisit = null,Object? weightKg = freezed,Object? ownerPhone = freezed,Object? ownerEmail = freezed,Object? isAlert = null,Object? isHospitalized = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as Species,sex: null == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String,ageYears: null == ageYears ? _self.ageYears : ageYears // ignore: cast_nullable_to_non_nullable
as int,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,lastVisit: null == lastVisit ? _self.lastVisit : lastVisit // ignore: cast_nullable_to_non_nullable
as DateTime,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,ownerPhone: freezed == ownerPhone ? _self.ownerPhone : ownerPhone // ignore: cast_nullable_to_non_nullable
as String?,ownerEmail: freezed == ownerEmail ? _self.ownerEmail : ownerEmail // ignore: cast_nullable_to_non_nullable
as String?,isAlert: null == isAlert ? _self.isAlert : isAlert // ignore: cast_nullable_to_non_nullable
as bool,isHospitalized: null == isHospitalized ? _self.isHospitalized : isHospitalized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Patient].
extension PatientPatterns on Patient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Patient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Patient value)  $default,){
final _that = this;
switch (_that) {
case _Patient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Patient value)?  $default,){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  Species species,  Sex sex,  String breed,  int ageYears,  String ownerName,  DateTime lastVisit,  double? weightKg,  String? ownerPhone,  String? ownerEmail,  bool isAlert,  bool isHospitalized)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.name,_that.species,_that.sex,_that.breed,_that.ageYears,_that.ownerName,_that.lastVisit,_that.weightKg,_that.ownerPhone,_that.ownerEmail,_that.isAlert,_that.isHospitalized);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  Species species,  Sex sex,  String breed,  int ageYears,  String ownerName,  DateTime lastVisit,  double? weightKg,  String? ownerPhone,  String? ownerEmail,  bool isAlert,  bool isHospitalized)  $default,) {final _that = this;
switch (_that) {
case _Patient():
return $default(_that.id,_that.name,_that.species,_that.sex,_that.breed,_that.ageYears,_that.ownerName,_that.lastVisit,_that.weightKg,_that.ownerPhone,_that.ownerEmail,_that.isAlert,_that.isHospitalized);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  Species species,  Sex sex,  String breed,  int ageYears,  String ownerName,  DateTime lastVisit,  double? weightKg,  String? ownerPhone,  String? ownerEmail,  bool isAlert,  bool isHospitalized)?  $default,) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.name,_that.species,_that.sex,_that.breed,_that.ageYears,_that.ownerName,_that.lastVisit,_that.weightKg,_that.ownerPhone,_that.ownerEmail,_that.isAlert,_that.isHospitalized);case _:
  return null;

}
}

}

/// @nodoc


class _Patient implements Patient {
  const _Patient({required this.id, required this.name, required this.species, required this.sex, required this.breed, required this.ageYears, required this.ownerName, required this.lastVisit, this.weightKg, this.ownerPhone, this.ownerEmail, this.isAlert = false, this.isHospitalized = false});
  

@override final  String id;
@override final  String name;
@override final  Species species;
@override final  Sex sex;
@override final  String breed;
@override final  int ageYears;
@override final  String ownerName;
// Mientras el backend no exponga `last_visit_at`, los datasources lo
// alimentan con `created_at` para que la UI siga funcionando.
@override final  DateTime lastVisit;
@override final  double? weightKg;
@override final  String? ownerPhone;
@override final  String? ownerEmail;
@override@JsonKey() final  bool isAlert;
@override@JsonKey() final  bool isHospitalized;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientCopyWith<_Patient> get copyWith => __$PatientCopyWithImpl<_Patient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.ageYears, ageYears) || other.ageYears == ageYears)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.lastVisit, lastVisit) || other.lastVisit == lastVisit)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.ownerPhone, ownerPhone) || other.ownerPhone == ownerPhone)&&(identical(other.ownerEmail, ownerEmail) || other.ownerEmail == ownerEmail)&&(identical(other.isAlert, isAlert) || other.isAlert == isAlert)&&(identical(other.isHospitalized, isHospitalized) || other.isHospitalized == isHospitalized));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,species,sex,breed,ageYears,ownerName,lastVisit,weightKg,ownerPhone,ownerEmail,isAlert,isHospitalized);

@override
String toString() {
  return 'Patient(id: $id, name: $name, species: $species, sex: $sex, breed: $breed, ageYears: $ageYears, ownerName: $ownerName, lastVisit: $lastVisit, weightKg: $weightKg, ownerPhone: $ownerPhone, ownerEmail: $ownerEmail, isAlert: $isAlert, isHospitalized: $isHospitalized)';
}


}

/// @nodoc
abstract mixin class _$PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$PatientCopyWith(_Patient value, $Res Function(_Patient) _then) = __$PatientCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, Species species, Sex sex, String breed, int ageYears, String ownerName, DateTime lastVisit, double? weightKg, String? ownerPhone, String? ownerEmail, bool isAlert, bool isHospitalized
});




}
/// @nodoc
class __$PatientCopyWithImpl<$Res>
    implements _$PatientCopyWith<$Res> {
  __$PatientCopyWithImpl(this._self, this._then);

  final _Patient _self;
  final $Res Function(_Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? species = null,Object? sex = null,Object? breed = null,Object? ageYears = null,Object? ownerName = null,Object? lastVisit = null,Object? weightKg = freezed,Object? ownerPhone = freezed,Object? ownerEmail = freezed,Object? isAlert = null,Object? isHospitalized = null,}) {
  return _then(_Patient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as Species,sex: null == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String,ageYears: null == ageYears ? _self.ageYears : ageYears // ignore: cast_nullable_to_non_nullable
as int,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,lastVisit: null == lastVisit ? _self.lastVisit : lastVisit // ignore: cast_nullable_to_non_nullable
as DateTime,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,ownerPhone: freezed == ownerPhone ? _self.ownerPhone : ownerPhone // ignore: cast_nullable_to_non_nullable
as String?,ownerEmail: freezed == ownerEmail ? _self.ownerEmail : ownerEmail // ignore: cast_nullable_to_non_nullable
as String?,isAlert: null == isAlert ? _self.isAlert : isAlert // ignore: cast_nullable_to_non_nullable
as bool,isHospitalized: null == isHospitalized ? _self.isHospitalized : isHospitalized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
