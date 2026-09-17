// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HomeState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.selectedCategory, _this.selectedCategory) || other.selectedCategory == _this.selectedCategory)&&const DeepCollectionEquality().equals(other.discountCards, _this.discountCards)&&(identical(other.status, _this.status) || other.status == _this.status));
}


@override
int get hashCode {
  final _this = this as HomeState;
  return Object.hash(runtimeType,_this.selectedCategory,const DeepCollectionEquality().hash(_this.discountCards),_this.status);
}

@override
String toString() {
  final _this = this as HomeState;
  return 'HomeState(selectedCategory: ${_this.selectedCategory}, discountCards: ${_this.discountCards}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 CardCategoryType? selectedCategory, List<DiscountCard> discountCards, HomeDataStatus status
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedCategory = freezed,Object? discountCards = null,Object? status = null,}) {
  return _then(HomeState(
selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as CardCategoryType?,discountCards: null == discountCards ? _self.discountCards : discountCards // ignore: cast_nullable_to_non_nullable
as List<DiscountCard>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeDataStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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
mixin _$HomeDataStatus {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDataStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeDataStatus()';
}


}

/// @nodoc
class $HomeDataStatusCopyWith<$Res>  {
$HomeDataStatusCopyWith(HomeDataStatus _, $Res Function(HomeDataStatus) __);
}


/// Adds pattern-matching-related methods to [HomeDataStatus].
extension HomeDataStatusPatterns on HomeDataStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeDataInitial value)?  initial,TResult Function( HomeDataSuccess value)?  success,TResult Function( HomeDataError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeDataInitial() when initial != null:
return initial(_that);case HomeDataSuccess() when success != null:
return success(_that);case HomeDataError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeDataInitial value)  initial,required TResult Function( HomeDataSuccess value)  success,required TResult Function( HomeDataError value)  error,}){
final _that = this;
switch (_that) {
case HomeDataInitial():
return initial(_that);case HomeDataSuccess():
return success(_that);case HomeDataError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeDataInitial value)?  initial,TResult? Function( HomeDataSuccess value)?  success,TResult? Function( HomeDataError value)?  error,}){
final _that = this;
switch (_that) {
case HomeDataInitial() when initial != null:
return initial(_that);case HomeDataSuccess() when success != null:
return success(_that);case HomeDataError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  success,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeDataInitial() when initial != null:
return initial();case HomeDataSuccess() when success != null:
return success();case HomeDataError() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  success,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case HomeDataInitial():
return initial();case HomeDataSuccess():
return success();case HomeDataError():
return error();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  success,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case HomeDataInitial() when initial != null:
return initial();case HomeDataSuccess() when success != null:
return success();case HomeDataError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class HomeDataInitial implements HomeDataStatus {
  const HomeDataInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDataInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeDataStatus.initial()';
}


}




/// @nodoc


class HomeDataSuccess implements HomeDataStatus {
  const HomeDataSuccess();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDataSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeDataStatus.success()';
}


}




/// @nodoc


class HomeDataError implements HomeDataStatus {
  const HomeDataError();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDataError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeDataStatus.error()';
}


}




// dart format on
