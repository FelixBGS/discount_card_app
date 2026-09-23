// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditorState {


/// Create a copy of EditorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditorStateCopyWith<EditorState> get copyWith => _$EditorStateCopyWithImpl<EditorState>(this as EditorState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EditorState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditorState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.selectedLogo, _this.selectedLogo) || other.selectedLogo == _this.selectedLogo)&&(identical(other.shopName, _this.shopName) || other.shopName == _this.shopName)&&(identical(other.selectedCategory, _this.selectedCategory) || other.selectedCategory == _this.selectedCategory)&&(identical(other.selectedColor, _this.selectedColor) || other.selectedColor == _this.selectedColor)&&(identical(other.barcodeNumber, _this.barcodeNumber) || other.barcodeNumber == _this.barcodeNumber)&&(identical(other.barcodeFormat, _this.barcodeFormat) || other.barcodeFormat == _this.barcodeFormat)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.fieldErrors, _this.fieldErrors) || other.fieldErrors == _this.fieldErrors)&&(identical(other.cardId, _this.cardId) || other.cardId == _this.cardId));
}


@override
int get hashCode {
  final _this = this as EditorState;
  return Object.hash(runtimeType,_this.status,_this.selectedLogo,_this.shopName,_this.selectedCategory,_this.selectedColor,_this.barcodeNumber,_this.barcodeFormat,_this.description,_this.fieldErrors,_this.cardId);
}

@override
String toString() {
  final _this = this as EditorState;
  return 'EditorState(status: ${_this.status}, selectedLogo: ${_this.selectedLogo}, shopName: ${_this.shopName}, selectedCategory: ${_this.selectedCategory}, selectedColor: ${_this.selectedColor}, barcodeNumber: ${_this.barcodeNumber}, barcodeFormat: ${_this.barcodeFormat}, description: ${_this.description}, fieldErrors: ${_this.fieldErrors}, cardId: ${_this.cardId})';
}


}

/// @nodoc
abstract mixin class $EditorStateCopyWith<$Res>  {
  factory $EditorStateCopyWith(EditorState value, $Res Function(EditorState) _then) = _$EditorStateCopyWithImpl;
@useResult
$Res call({
 EditorStatus status, LogoSource selectedLogo, String shopName, CardCategoryType selectedCategory, CardColor? selectedColor, String barcodeNumber, BarcodeFormat barcodeFormat, String description, EditorFieldErrors fieldErrors, String? cardId
});




}
/// @nodoc
class _$EditorStateCopyWithImpl<$Res>
    implements $EditorStateCopyWith<$Res> {
  _$EditorStateCopyWithImpl(this._self, this._then);

  final EditorState _self;
  final $Res Function(EditorState) _then;

/// Create a copy of EditorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? selectedLogo = null,Object? shopName = null,Object? selectedCategory = null,Object? selectedColor = freezed,Object? barcodeNumber = null,Object? barcodeFormat = null,Object? description = null,Object? fieldErrors = null,Object? cardId = freezed,}) {
  return _then(EditorState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditorStatus,selectedLogo: null == selectedLogo ? _self.selectedLogo : selectedLogo // ignore: cast_nullable_to_non_nullable
as LogoSource,shopName: null == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as CardCategoryType,selectedColor: freezed == selectedColor ? _self.selectedColor : selectedColor // ignore: cast_nullable_to_non_nullable
as CardColor?,barcodeNumber: null == barcodeNumber ? _self.barcodeNumber : barcodeNumber // ignore: cast_nullable_to_non_nullable
as String,barcodeFormat: null == barcodeFormat ? _self.barcodeFormat : barcodeFormat // ignore: cast_nullable_to_non_nullable
as BarcodeFormat,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as EditorFieldErrors,cardId: freezed == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EditorState].
extension EditorStatePatterns on EditorState {
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
