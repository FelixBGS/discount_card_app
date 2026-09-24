// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScannerState {


/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannerStateCopyWith<ScannerState> get copyWith => _$ScannerStateCopyWithImpl<ScannerState>(this as ScannerState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ScannerState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerState&&(identical(other.permission, _this.permission) || other.permission == _this.permission)&&(identical(other.phase, _this.phase) || other.phase == _this.phase)&&(identical(other.torch, _this.torch) || other.torch == _this.torch)&&(identical(other.pendingBarcode, _this.pendingBarcode) || other.pendingBarcode == _this.pendingBarcode)&&(identical(other.rejectionId, _this.rejectionId) || other.rejectionId == _this.rejectionId));
}


@override
int get hashCode {
  final _this = this as ScannerState;
  return Object.hash(runtimeType,_this.permission,_this.phase,_this.torch,_this.pendingBarcode,_this.rejectionId);
}

@override
String toString() {
  final _this = this as ScannerState;
  return 'ScannerState(permission: ${_this.permission}, phase: ${_this.phase}, torch: ${_this.torch}, pendingBarcode: ${_this.pendingBarcode}, rejectionId: ${_this.rejectionId})';
}


}

/// @nodoc
abstract mixin class $ScannerStateCopyWith<$Res>  {
  factory $ScannerStateCopyWith(ScannerState value, $Res Function(ScannerState) _then) = _$ScannerStateCopyWithImpl;
@useResult
$Res call({
 ScannerPermission permission, ScannerPhase phase, ScannerTorch torch, ({BarcodeFormat format, String value,})? pendingBarcode, int rejectionId
});




}
/// @nodoc
class _$ScannerStateCopyWithImpl<$Res>
    implements $ScannerStateCopyWith<$Res> {
  _$ScannerStateCopyWithImpl(this._self, this._then);

  final ScannerState _self;
  final $Res Function(ScannerState) _then;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? permission = null,Object? phase = null,Object? torch = null,Object? pendingBarcode = freezed,Object? rejectionId = null,}) {
  return _then(ScannerState(
permission: null == permission ? _self.permission : permission // ignore: cast_nullable_to_non_nullable
as ScannerPermission,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as ScannerPhase,torch: null == torch ? _self.torch : torch // ignore: cast_nullable_to_non_nullable
as ScannerTorch,pendingBarcode: freezed == pendingBarcode ? _self.pendingBarcode : pendingBarcode // ignore: cast_nullable_to_non_nullable
as ({BarcodeFormat format, String value,})?,rejectionId: null == rejectionId ? _self.rejectionId : rejectionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ScannerState].
extension ScannerStatePatterns on ScannerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$ScannerPhase {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerPhase);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScannerPhase()';
}


}

/// @nodoc
class $ScannerPhaseCopyWith<$Res>  {
$ScannerPhaseCopyWith(ScannerPhase _, $Res Function(ScannerPhase) __);
}


/// Adds pattern-matching-related methods to [ScannerPhase].
extension ScannerPhasePatterns on ScannerPhase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ScannerPhaseIdle value)?  idle,TResult Function( ScannerPhaseStarting value)?  starting,TResult Function( ScannerPhaseRunning value)?  running,TResult Function( ScannerPhaseStopped value)?  stopped,TResult Function( ScannerPhaseFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ScannerPhaseIdle() when idle != null:
return idle(_that);case ScannerPhaseStarting() when starting != null:
return starting(_that);case ScannerPhaseRunning() when running != null:
return running(_that);case ScannerPhaseStopped() when stopped != null:
return stopped(_that);case ScannerPhaseFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ScannerPhaseIdle value)  idle,required TResult Function( ScannerPhaseStarting value)  starting,required TResult Function( ScannerPhaseRunning value)  running,required TResult Function( ScannerPhaseStopped value)  stopped,required TResult Function( ScannerPhaseFailed value)  failed,}){
final _that = this;
switch (_that) {
case ScannerPhaseIdle():
return idle(_that);case ScannerPhaseStarting():
return starting(_that);case ScannerPhaseRunning():
return running(_that);case ScannerPhaseStopped():
return stopped(_that);case ScannerPhaseFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ScannerPhaseIdle value)?  idle,TResult? Function( ScannerPhaseStarting value)?  starting,TResult? Function( ScannerPhaseRunning value)?  running,TResult? Function( ScannerPhaseStopped value)?  stopped,TResult? Function( ScannerPhaseFailed value)?  failed,}){
final _that = this;
switch (_that) {
case ScannerPhaseIdle() when idle != null:
return idle(_that);case ScannerPhaseStarting() when starting != null:
return starting(_that);case ScannerPhaseRunning() when running != null:
return running(_that);case ScannerPhaseStopped() when stopped != null:
return stopped(_that);case ScannerPhaseFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  starting,TResult Function()?  running,TResult Function()?  stopped,TResult Function()?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ScannerPhaseIdle() when idle != null:
return idle();case ScannerPhaseStarting() when starting != null:
return starting();case ScannerPhaseRunning() when running != null:
return running();case ScannerPhaseStopped() when stopped != null:
return stopped();case ScannerPhaseFailed() when failed != null:
return failed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  starting,required TResult Function()  running,required TResult Function()  stopped,required TResult Function()  failed,}) {final _that = this;
switch (_that) {
case ScannerPhaseIdle():
return idle();case ScannerPhaseStarting():
return starting();case ScannerPhaseRunning():
return running();case ScannerPhaseStopped():
return stopped();case ScannerPhaseFailed():
return failed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  starting,TResult? Function()?  running,TResult? Function()?  stopped,TResult? Function()?  failed,}) {final _that = this;
switch (_that) {
case ScannerPhaseIdle() when idle != null:
return idle();case ScannerPhaseStarting() when starting != null:
return starting();case ScannerPhaseRunning() when running != null:
return running();case ScannerPhaseStopped() when stopped != null:
return stopped();case ScannerPhaseFailed() when failed != null:
return failed();case _:
  return null;

}
}

}

/// @nodoc


class ScannerPhaseIdle implements ScannerPhase {
  const ScannerPhaseIdle();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerPhaseIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScannerPhase.idle()';
}


}




/// @nodoc


class ScannerPhaseStarting implements ScannerPhase {
  const ScannerPhaseStarting();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerPhaseStarting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScannerPhase.starting()';
}


}




/// @nodoc


class ScannerPhaseRunning implements ScannerPhase {
  const ScannerPhaseRunning();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerPhaseRunning);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScannerPhase.running()';
}


}




/// @nodoc


class ScannerPhaseStopped implements ScannerPhase {
  const ScannerPhaseStopped();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerPhaseStopped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScannerPhase.stopped()';
}


}




/// @nodoc


class ScannerPhaseFailed implements ScannerPhase {
  const ScannerPhaseFailed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerPhaseFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScannerPhase.failed()';
}


}




// dart format on
