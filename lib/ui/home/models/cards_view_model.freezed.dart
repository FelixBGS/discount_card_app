// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cards_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CardsViewModel {


/// Create a copy of CardsViewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardsViewModelCopyWith<CardsViewModel> get copyWith => _$CardsViewModelCopyWithImpl<CardsViewModel>(this as CardsViewModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CardsViewModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardsViewModel&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.discountCards, _this.discountCards));
}


@override
int get hashCode {
  final _this = this as CardsViewModel;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.discountCards));
}

@override
String toString() {
  final _this = this as CardsViewModel;
  return 'CardsViewModel(status: ${_this.status}, discountCards: ${_this.discountCards})';
}


}

/// @nodoc
abstract mixin class $CardsViewModelCopyWith<$Res>  {
  factory $CardsViewModelCopyWith(CardsViewModel value, $Res Function(CardsViewModel) _then) = _$CardsViewModelCopyWithImpl;
@useResult
$Res call({
 HomeDataStatus status, List<DiscountCard> discountCards
});




}
/// @nodoc
class _$CardsViewModelCopyWithImpl<$Res>
    implements $CardsViewModelCopyWith<$Res> {
  _$CardsViewModelCopyWithImpl(this._self, this._then);

  final CardsViewModel _self;
  final $Res Function(CardsViewModel) _then;

/// Create a copy of CardsViewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? discountCards = null,}) {
  return _then(CardsViewModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeDataStatus,discountCards: null == discountCards ? _self.discountCards : discountCards // ignore: cast_nullable_to_non_nullable
as List<DiscountCard>,
  ));
}

}


/// Adds pattern-matching-related methods to [CardsViewModel].
extension CardsViewModelPatterns on CardsViewModel {
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
