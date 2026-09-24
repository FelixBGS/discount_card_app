// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiscountCard {


/// Create a copy of DiscountCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscountCardCopyWith<DiscountCard> get copyWith => _$DiscountCardCopyWithImpl<DiscountCard>(this as DiscountCard, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DiscountCard;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscountCard&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.shopName, _this.shopName) || other.shopName == _this.shopName)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.color, _this.color) || other.color == _this.color)&&(identical(other.barcode, _this.barcode) || other.barcode == _this.barcode)&&(identical(other.barcodeFormat, _this.barcodeFormat) || other.barcodeFormat == _this.barcodeFormat)&&(identical(other.logo, _this.logo) || other.logo == _this.logo)&&(identical(other.description, _this.description) || other.description == _this.description));
}


@override
int get hashCode {
  final _this = this as DiscountCard;
  return Object.hash(runtimeType,_this.id,_this.shopName,_this.category,_this.color,_this.barcode,_this.barcodeFormat,_this.logo,_this.description);
}

@override
String toString() {
  final _this = this as DiscountCard;
  return 'DiscountCard(id: ${_this.id}, shopName: ${_this.shopName}, category: ${_this.category}, color: ${_this.color}, barcode: ${_this.barcode}, barcodeFormat: ${_this.barcodeFormat}, logo: ${_this.logo}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $DiscountCardCopyWith<$Res>  {
  factory $DiscountCardCopyWith(DiscountCard value, $Res Function(DiscountCard) _then) = _$DiscountCardCopyWithImpl;
@useResult
$Res call({
 String id, String shopName, CardCategory category, CardColor color, String barcode, BarcodeFormat barcodeFormat, LogoSource logo, String? description
});




}
/// @nodoc
class _$DiscountCardCopyWithImpl<$Res>
    implements $DiscountCardCopyWith<$Res> {
  _$DiscountCardCopyWithImpl(this._self, this._then);

  final DiscountCard _self;
  final $Res Function(DiscountCard) _then;

/// Create a copy of DiscountCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? shopName = null,Object? category = null,Object? color = null,Object? barcode = null,Object? barcodeFormat = null,Object? logo = null,Object? description = freezed,}) {
  return _then(DiscountCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,shopName: null == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CardCategory,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as CardColor,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,barcodeFormat: null == barcodeFormat ? _self.barcodeFormat : barcodeFormat // ignore: cast_nullable_to_non_nullable
as BarcodeFormat,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as LogoSource,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DiscountCard].
extension DiscountCardPatterns on DiscountCard {
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
