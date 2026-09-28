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





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScannerState()';
}


}

/// @nodoc
class $ScannerStateCopyWith<$Res>  {
$ScannerStateCopyWith(ScannerState _, $Res Function(ScannerState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ScanerInitialState value)?  initial,TResult Function( ScannerRequiredPermissionState value)?  requiredPermission,TResult Function( ScannerPermissionPermanentlyDeniedState value)?  permissionPermanentlyDenied,TResult Function( ScannerPermissionGranted value)?  permissionGranted,TResult Function( ScannerCameraRunningState value)?  cameraRunning,TResult Function( ScannerCameraErrorState value)?  cameraError,TResult Function( ScannerDataSuccessState value)?  dataSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ScanerInitialState() when initial != null:
return initial(_that);case ScannerRequiredPermissionState() when requiredPermission != null:
return requiredPermission(_that);case ScannerPermissionPermanentlyDeniedState() when permissionPermanentlyDenied != null:
return permissionPermanentlyDenied(_that);case ScannerPermissionGranted() when permissionGranted != null:
return permissionGranted(_that);case ScannerCameraRunningState() when cameraRunning != null:
return cameraRunning(_that);case ScannerCameraErrorState() when cameraError != null:
return cameraError(_that);case ScannerDataSuccessState() when dataSuccess != null:
return dataSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ScanerInitialState value)  initial,required TResult Function( ScannerRequiredPermissionState value)  requiredPermission,required TResult Function( ScannerPermissionPermanentlyDeniedState value)  permissionPermanentlyDenied,required TResult Function( ScannerPermissionGranted value)  permissionGranted,required TResult Function( ScannerCameraRunningState value)  cameraRunning,required TResult Function( ScannerCameraErrorState value)  cameraError,required TResult Function( ScannerDataSuccessState value)  dataSuccess,}){
final _that = this;
switch (_that) {
case ScanerInitialState():
return initial(_that);case ScannerRequiredPermissionState():
return requiredPermission(_that);case ScannerPermissionPermanentlyDeniedState():
return permissionPermanentlyDenied(_that);case ScannerPermissionGranted():
return permissionGranted(_that);case ScannerCameraRunningState():
return cameraRunning(_that);case ScannerCameraErrorState():
return cameraError(_that);case ScannerDataSuccessState():
return dataSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ScanerInitialState value)?  initial,TResult? Function( ScannerRequiredPermissionState value)?  requiredPermission,TResult? Function( ScannerPermissionPermanentlyDeniedState value)?  permissionPermanentlyDenied,TResult? Function( ScannerPermissionGranted value)?  permissionGranted,TResult? Function( ScannerCameraRunningState value)?  cameraRunning,TResult? Function( ScannerCameraErrorState value)?  cameraError,TResult? Function( ScannerDataSuccessState value)?  dataSuccess,}){
final _that = this;
switch (_that) {
case ScanerInitialState() when initial != null:
return initial(_that);case ScannerRequiredPermissionState() when requiredPermission != null:
return requiredPermission(_that);case ScannerPermissionPermanentlyDeniedState() when permissionPermanentlyDenied != null:
return permissionPermanentlyDenied(_that);case ScannerPermissionGranted() when permissionGranted != null:
return permissionGranted(_that);case ScannerCameraRunningState() when cameraRunning != null:
return cameraRunning(_that);case ScannerCameraErrorState() when cameraError != null:
return cameraError(_that);case ScannerDataSuccessState() when dataSuccess != null:
return dataSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  requiredPermission,TResult Function()?  permissionPermanentlyDenied,TResult Function()?  permissionGranted,TResult Function( bool isTorchEnabled,  String? torchFailureMessage,  String? barcodeFailureMessage)?  cameraRunning,TResult Function( String message)?  cameraError,TResult Function( String barcodeNumber,  BarcodeFormat barcodeFormat)?  dataSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ScanerInitialState() when initial != null:
return initial();case ScannerRequiredPermissionState() when requiredPermission != null:
return requiredPermission();case ScannerPermissionPermanentlyDeniedState() when permissionPermanentlyDenied != null:
return permissionPermanentlyDenied();case ScannerPermissionGranted() when permissionGranted != null:
return permissionGranted();case ScannerCameraRunningState() when cameraRunning != null:
return cameraRunning(_that.isTorchEnabled,_that.torchFailureMessage,_that.barcodeFailureMessage);case ScannerCameraErrorState() when cameraError != null:
return cameraError(_that.message);case ScannerDataSuccessState() when dataSuccess != null:
return dataSuccess(_that.barcodeNumber,_that.barcodeFormat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  requiredPermission,required TResult Function()  permissionPermanentlyDenied,required TResult Function()  permissionGranted,required TResult Function( bool isTorchEnabled,  String? torchFailureMessage,  String? barcodeFailureMessage)  cameraRunning,required TResult Function( String message)  cameraError,required TResult Function( String barcodeNumber,  BarcodeFormat barcodeFormat)  dataSuccess,}) {final _that = this;
switch (_that) {
case ScanerInitialState():
return initial();case ScannerRequiredPermissionState():
return requiredPermission();case ScannerPermissionPermanentlyDeniedState():
return permissionPermanentlyDenied();case ScannerPermissionGranted():
return permissionGranted();case ScannerCameraRunningState():
return cameraRunning(_that.isTorchEnabled,_that.torchFailureMessage,_that.barcodeFailureMessage);case ScannerCameraErrorState():
return cameraError(_that.message);case ScannerDataSuccessState():
return dataSuccess(_that.barcodeNumber,_that.barcodeFormat);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  requiredPermission,TResult? Function()?  permissionPermanentlyDenied,TResult? Function()?  permissionGranted,TResult? Function( bool isTorchEnabled,  String? torchFailureMessage,  String? barcodeFailureMessage)?  cameraRunning,TResult? Function( String message)?  cameraError,TResult? Function( String barcodeNumber,  BarcodeFormat barcodeFormat)?  dataSuccess,}) {final _that = this;
switch (_that) {
case ScanerInitialState() when initial != null:
return initial();case ScannerRequiredPermissionState() when requiredPermission != null:
return requiredPermission();case ScannerPermissionPermanentlyDeniedState() when permissionPermanentlyDenied != null:
return permissionPermanentlyDenied();case ScannerPermissionGranted() when permissionGranted != null:
return permissionGranted();case ScannerCameraRunningState() when cameraRunning != null:
return cameraRunning(_that.isTorchEnabled,_that.torchFailureMessage,_that.barcodeFailureMessage);case ScannerCameraErrorState() when cameraError != null:
return cameraError(_that.message);case ScannerDataSuccessState() when dataSuccess != null:
return dataSuccess(_that.barcodeNumber,_that.barcodeFormat);case _:
  return null;

}
}

}

/// @nodoc


class ScanerInitialState implements ScannerState {
  const ScanerInitialState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanerInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScannerState.initial()';
}


}




/// @nodoc


class ScannerRequiredPermissionState implements ScannerState {
  const ScannerRequiredPermissionState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerRequiredPermissionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScannerState.requiredPermission()';
}


}




/// @nodoc


class ScannerPermissionPermanentlyDeniedState implements ScannerState {
  const ScannerPermissionPermanentlyDeniedState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerPermissionPermanentlyDeniedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScannerState.permissionPermanentlyDenied()';
}


}




/// @nodoc


class ScannerPermissionGranted implements ScannerState {
  const ScannerPermissionGranted();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerPermissionGranted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScannerState.permissionGranted()';
}


}




/// @nodoc


class ScannerCameraRunningState implements ScannerState {
  const ScannerCameraRunningState({this.isTorchEnabled = false, this.torchFailureMessage, this.barcodeFailureMessage});
  

@JsonKey() final  bool isTorchEnabled;
 final  String? torchFailureMessage;
 final  String? barcodeFailureMessage;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannerCameraRunningStateCopyWith<ScannerCameraRunningState> get copyWith => _$ScannerCameraRunningStateCopyWithImpl<ScannerCameraRunningState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerCameraRunningState&&(identical(other.isTorchEnabled, isTorchEnabled) || other.isTorchEnabled == isTorchEnabled)&&(identical(other.torchFailureMessage, torchFailureMessage) || other.torchFailureMessage == torchFailureMessage)&&(identical(other.barcodeFailureMessage, barcodeFailureMessage) || other.barcodeFailureMessage == barcodeFailureMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,isTorchEnabled,torchFailureMessage,barcodeFailureMessage);
}

@override
String toString() {
    return 'ScannerState.cameraRunning(isTorchEnabled: $isTorchEnabled, torchFailureMessage: $torchFailureMessage, barcodeFailureMessage: $barcodeFailureMessage)';
}


}

/// @nodoc
abstract mixin class $ScannerCameraRunningStateCopyWith<$Res> implements $ScannerStateCopyWith<$Res> {
  factory $ScannerCameraRunningStateCopyWith(ScannerCameraRunningState value, $Res Function(ScannerCameraRunningState) _then) = _$ScannerCameraRunningStateCopyWithImpl;
@useResult
$Res call({
 bool isTorchEnabled, String? torchFailureMessage, String? barcodeFailureMessage
});




}
/// @nodoc
class _$ScannerCameraRunningStateCopyWithImpl<$Res>
    implements $ScannerCameraRunningStateCopyWith<$Res> {
  _$ScannerCameraRunningStateCopyWithImpl(this._self, this._then);

  final ScannerCameraRunningState _self;
  final $Res Function(ScannerCameraRunningState) _then;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isTorchEnabled = null,Object? torchFailureMessage = freezed,Object? barcodeFailureMessage = freezed,}) {
  return _then(ScannerCameraRunningState(
isTorchEnabled: null == isTorchEnabled ? _self.isTorchEnabled : isTorchEnabled // ignore: cast_nullable_to_non_nullable
as bool,torchFailureMessage: freezed == torchFailureMessage ? _self.torchFailureMessage : torchFailureMessage // ignore: cast_nullable_to_non_nullable
as String?,barcodeFailureMessage: freezed == barcodeFailureMessage ? _self.barcodeFailureMessage : barcodeFailureMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ScannerCameraErrorState implements ScannerState {
  const ScannerCameraErrorState({required this.message});
  

 final  String message;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannerCameraErrorStateCopyWith<ScannerCameraErrorState> get copyWith => _$ScannerCameraErrorStateCopyWithImpl<ScannerCameraErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerCameraErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'ScannerState.cameraError(message: $message)';
}


}

/// @nodoc
abstract mixin class $ScannerCameraErrorStateCopyWith<$Res> implements $ScannerStateCopyWith<$Res> {
  factory $ScannerCameraErrorStateCopyWith(ScannerCameraErrorState value, $Res Function(ScannerCameraErrorState) _then) = _$ScannerCameraErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ScannerCameraErrorStateCopyWithImpl<$Res>
    implements $ScannerCameraErrorStateCopyWith<$Res> {
  _$ScannerCameraErrorStateCopyWithImpl(this._self, this._then);

  final ScannerCameraErrorState _self;
  final $Res Function(ScannerCameraErrorState) _then;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ScannerCameraErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ScannerDataSuccessState implements ScannerState {
  const ScannerDataSuccessState({required this.barcodeNumber, required this.barcodeFormat});
  

 final  String barcodeNumber;
 final  BarcodeFormat barcodeFormat;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannerDataSuccessStateCopyWith<ScannerDataSuccessState> get copyWith => _$ScannerDataSuccessStateCopyWithImpl<ScannerDataSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerDataSuccessState&&(identical(other.barcodeNumber, barcodeNumber) || other.barcodeNumber == barcodeNumber)&&(identical(other.barcodeFormat, barcodeFormat) || other.barcodeFormat == barcodeFormat));
}


@override
int get hashCode {
    return Object.hash(runtimeType,barcodeNumber,barcodeFormat);
}

@override
String toString() {
    return 'ScannerState.dataSuccess(barcodeNumber: $barcodeNumber, barcodeFormat: $barcodeFormat)';
}


}

/// @nodoc
abstract mixin class $ScannerDataSuccessStateCopyWith<$Res> implements $ScannerStateCopyWith<$Res> {
  factory $ScannerDataSuccessStateCopyWith(ScannerDataSuccessState value, $Res Function(ScannerDataSuccessState) _then) = _$ScannerDataSuccessStateCopyWithImpl;
@useResult
$Res call({
 String barcodeNumber, BarcodeFormat barcodeFormat
});




}
/// @nodoc
class _$ScannerDataSuccessStateCopyWithImpl<$Res>
    implements $ScannerDataSuccessStateCopyWith<$Res> {
  _$ScannerDataSuccessStateCopyWithImpl(this._self, this._then);

  final ScannerDataSuccessState _self;
  final $Res Function(ScannerDataSuccessState) _then;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? barcodeNumber = null,Object? barcodeFormat = null,}) {
  return _then(ScannerDataSuccessState(
barcodeNumber: null == barcodeNumber ? _self.barcodeNumber : barcodeNumber // ignore: cast_nullable_to_non_nullable
as String,barcodeFormat: null == barcodeFormat ? _self.barcodeFormat : barcodeFormat // ignore: cast_nullable_to_non_nullable
as BarcodeFormat,
  ));
}


}

// dart format on
