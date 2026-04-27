// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_recorder_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConsultationRecorderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationRecorderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConsultationRecorderState()';
}


}

/// @nodoc
class $ConsultationRecorderStateCopyWith<$Res>  {
$ConsultationRecorderStateCopyWith(ConsultationRecorderState _, $Res Function(ConsultationRecorderState) __);
}


/// Adds pattern-matching-related methods to [ConsultationRecorderState].
extension ConsultationRecorderStatePatterns on ConsultationRecorderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RecorderIdle value)?  idle,TResult Function( RecorderRecording value)?  recording,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RecorderIdle() when idle != null:
return idle(_that);case RecorderRecording() when recording != null:
return recording(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RecorderIdle value)  idle,required TResult Function( RecorderRecording value)  recording,}){
final _that = this;
switch (_that) {
case RecorderIdle():
return idle(_that);case RecorderRecording():
return recording(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RecorderIdle value)?  idle,TResult? Function( RecorderRecording value)?  recording,}){
final _that = this;
switch (_that) {
case RecorderIdle() when idle != null:
return idle(_that);case RecorderRecording() when recording != null:
return recording(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( ConsultationSection section,  Duration elapsed,  double amplitude)?  recording,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RecorderIdle() when idle != null:
return idle();case RecorderRecording() when recording != null:
return recording(_that.section,_that.elapsed,_that.amplitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( ConsultationSection section,  Duration elapsed,  double amplitude)  recording,}) {final _that = this;
switch (_that) {
case RecorderIdle():
return idle();case RecorderRecording():
return recording(_that.section,_that.elapsed,_that.amplitude);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( ConsultationSection section,  Duration elapsed,  double amplitude)?  recording,}) {final _that = this;
switch (_that) {
case RecorderIdle() when idle != null:
return idle();case RecorderRecording() when recording != null:
return recording(_that.section,_that.elapsed,_that.amplitude);case _:
  return null;

}
}

}

/// @nodoc


class RecorderIdle implements ConsultationRecorderState {
  const RecorderIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecorderIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConsultationRecorderState.idle()';
}


}




/// @nodoc


class RecorderRecording implements ConsultationRecorderState {
  const RecorderRecording({required this.section, required this.elapsed, required this.amplitude});
  

 final  ConsultationSection section;
 final  Duration elapsed;
 final  double amplitude;

/// Create a copy of ConsultationRecorderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecorderRecordingCopyWith<RecorderRecording> get copyWith => _$RecorderRecordingCopyWithImpl<RecorderRecording>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecorderRecording&&(identical(other.section, section) || other.section == section)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed)&&(identical(other.amplitude, amplitude) || other.amplitude == amplitude));
}


@override
int get hashCode => Object.hash(runtimeType,section,elapsed,amplitude);

@override
String toString() {
  return 'ConsultationRecorderState.recording(section: $section, elapsed: $elapsed, amplitude: $amplitude)';
}


}

/// @nodoc
abstract mixin class $RecorderRecordingCopyWith<$Res> implements $ConsultationRecorderStateCopyWith<$Res> {
  factory $RecorderRecordingCopyWith(RecorderRecording value, $Res Function(RecorderRecording) _then) = _$RecorderRecordingCopyWithImpl;
@useResult
$Res call({
 ConsultationSection section, Duration elapsed, double amplitude
});




}
/// @nodoc
class _$RecorderRecordingCopyWithImpl<$Res>
    implements $RecorderRecordingCopyWith<$Res> {
  _$RecorderRecordingCopyWithImpl(this._self, this._then);

  final RecorderRecording _self;
  final $Res Function(RecorderRecording) _then;

/// Create a copy of ConsultationRecorderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? section = null,Object? elapsed = null,Object? amplitude = null,}) {
  return _then(RecorderRecording(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as ConsultationSection,elapsed: null == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as Duration,amplitude: null == amplitude ? _self.amplitude : amplitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
