// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editor_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditorArgs {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EditorArgs);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EditorArgs()';
}


}

/// @nodoc
class $EditorArgsCopyWith<$Res>  {
$EditorArgsCopyWith(EditorArgs _, $Res Function(EditorArgs) __);
}


/// Adds pattern-matching-related methods to [EditorArgs].
extension EditorArgsPatterns on EditorArgs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Blank value)?  blank,TResult Function( FromCamara value)?  fromCamera,TResult Function( FromDetails value)?  fromDetails,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Blank() when blank != null:
return blank(_that);case FromCamara() when fromCamera != null:
return fromCamera(_that);case FromDetails() when fromDetails != null:
return fromDetails(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Blank value)  blank,required TResult Function( FromCamara value)  fromCamera,required TResult Function( FromDetails value)  fromDetails,}){
final _that = this;
switch (_that) {
case Blank():
return blank(_that);case FromCamara():
return fromCamera(_that);case FromDetails():
return fromDetails(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Blank value)?  blank,TResult? Function( FromCamara value)?  fromCamera,TResult? Function( FromDetails value)?  fromDetails,}){
final _that = this;
switch (_that) {
case Blank() when blank != null:
return blank(_that);case FromCamara() when fromCamera != null:
return fromCamera(_that);case FromDetails() when fromDetails != null:
return fromDetails(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  blank,TResult Function( String barcodeNumber,  BarcodeFormat barcodeFormat)?  fromCamera,TResult Function( String cardId)?  fromDetails,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Blank() when blank != null:
return blank();case FromCamara() when fromCamera != null:
return fromCamera(_that.barcodeNumber,_that.barcodeFormat);case FromDetails() when fromDetails != null:
return fromDetails(_that.cardId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  blank,required TResult Function( String barcodeNumber,  BarcodeFormat barcodeFormat)  fromCamera,required TResult Function( String cardId)  fromDetails,}) {final _that = this;
switch (_that) {
case Blank():
return blank();case FromCamara():
return fromCamera(_that.barcodeNumber,_that.barcodeFormat);case FromDetails():
return fromDetails(_that.cardId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  blank,TResult? Function( String barcodeNumber,  BarcodeFormat barcodeFormat)?  fromCamera,TResult? Function( String cardId)?  fromDetails,}) {final _that = this;
switch (_that) {
case Blank() when blank != null:
return blank();case FromCamara() when fromCamera != null:
return fromCamera(_that.barcodeNumber,_that.barcodeFormat);case FromDetails() when fromDetails != null:
return fromDetails(_that.cardId);case _:
  return null;

}
}

}

/// @nodoc


class Blank implements EditorArgs {
  const Blank();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Blank);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EditorArgs.blank()';
}


}




/// @nodoc


class FromCamara implements EditorArgs {
  const FromCamara({required this.barcodeNumber, required this.barcodeFormat});
  

 final  String barcodeNumber;
 final  BarcodeFormat barcodeFormat;

/// Create a copy of EditorArgs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FromCamaraCopyWith<FromCamara> get copyWith => _$FromCamaraCopyWithImpl<FromCamara>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FromCamara&&(identical(other.barcodeNumber, barcodeNumber) || other.barcodeNumber == barcodeNumber)&&(identical(other.barcodeFormat, barcodeFormat) || other.barcodeFormat == barcodeFormat));
}


@override
int get hashCode {
    return Object.hash(runtimeType,barcodeNumber,barcodeFormat);
}

@override
String toString() {
    return 'EditorArgs.fromCamera(barcodeNumber: $barcodeNumber, barcodeFormat: $barcodeFormat)';
}


}

/// @nodoc
abstract mixin class $FromCamaraCopyWith<$Res> implements $EditorArgsCopyWith<$Res> {
  factory $FromCamaraCopyWith(FromCamara value, $Res Function(FromCamara) _then) = _$FromCamaraCopyWithImpl;
@useResult
$Res call({
 String barcodeNumber, BarcodeFormat barcodeFormat
});




}
/// @nodoc
class _$FromCamaraCopyWithImpl<$Res>
    implements $FromCamaraCopyWith<$Res> {
  _$FromCamaraCopyWithImpl(this._self, this._then);

  final FromCamara _self;
  final $Res Function(FromCamara) _then;

/// Create a copy of EditorArgs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? barcodeNumber = null,Object? barcodeFormat = null,}) {
  return _then(FromCamara(
barcodeNumber: null == barcodeNumber ? _self.barcodeNumber : barcodeNumber // ignore: cast_nullable_to_non_nullable
as String,barcodeFormat: null == barcodeFormat ? _self.barcodeFormat : barcodeFormat // ignore: cast_nullable_to_non_nullable
as BarcodeFormat,
  ));
}


}

/// @nodoc


class FromDetails implements EditorArgs {
  const FromDetails({required this.cardId});
  

 final  String cardId;

/// Create a copy of EditorArgs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FromDetailsCopyWith<FromDetails> get copyWith => _$FromDetailsCopyWithImpl<FromDetails>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FromDetails&&(identical(other.cardId, cardId) || other.cardId == cardId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,cardId);
}

@override
String toString() {
    return 'EditorArgs.fromDetails(cardId: $cardId)';
}


}

/// @nodoc
abstract mixin class $FromDetailsCopyWith<$Res> implements $EditorArgsCopyWith<$Res> {
  factory $FromDetailsCopyWith(FromDetails value, $Res Function(FromDetails) _then) = _$FromDetailsCopyWithImpl;
@useResult
$Res call({
 String cardId
});




}
/// @nodoc
class _$FromDetailsCopyWithImpl<$Res>
    implements $FromDetailsCopyWith<$Res> {
  _$FromDetailsCopyWithImpl(this._self, this._then);

  final FromDetails _self;
  final $Res Function(FromDetails) _then;

/// Create a copy of EditorArgs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cardId = null,}) {
  return _then(FromDetails(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
