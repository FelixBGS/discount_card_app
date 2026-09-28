// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barcode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Barcode {


/// Create a copy of Barcode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BarcodeCopyWith<Barcode> get copyWith => _$BarcodeCopyWithImpl<Barcode>(this as Barcode, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Barcode;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Barcode&&(identical(other.barcodeNumber, _this.barcodeNumber) || other.barcodeNumber == _this.barcodeNumber)&&(identical(other.barcodeFormat, _this.barcodeFormat) || other.barcodeFormat == _this.barcodeFormat));
}


@override
int get hashCode {
  final _this = this as Barcode;
  return Object.hash(runtimeType,_this.barcodeNumber,_this.barcodeFormat);
}

@override
String toString() {
  final _this = this as Barcode;
  return 'Barcode(barcodeNumber: ${_this.barcodeNumber}, barcodeFormat: ${_this.barcodeFormat})';
}


}

/// @nodoc
abstract mixin class $BarcodeCopyWith<$Res>  {
  factory $BarcodeCopyWith(Barcode value, $Res Function(Barcode) _then) = _$BarcodeCopyWithImpl;
@useResult
$Res call({
 String barcodeNumber, BarcodeFormat barcodeFormat
});




}
/// @nodoc
class _$BarcodeCopyWithImpl<$Res>
    implements $BarcodeCopyWith<$Res> {
  _$BarcodeCopyWithImpl(this._self, this._then);

  final Barcode _self;
  final $Res Function(Barcode) _then;

/// Create a copy of Barcode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? barcodeNumber = null,Object? barcodeFormat = null,}) {
  return _then(Barcode(
barcodeNumber: null == barcodeNumber ? _self.barcodeNumber : barcodeNumber // ignore: cast_nullable_to_non_nullable
as String,barcodeFormat: null == barcodeFormat ? _self.barcodeFormat : barcodeFormat // ignore: cast_nullable_to_non_nullable
as BarcodeFormat,
  ));
}

}


/// Adds pattern-matching-related methods to [Barcode].
extension BarcodePatterns on Barcode {
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

// dart format on
