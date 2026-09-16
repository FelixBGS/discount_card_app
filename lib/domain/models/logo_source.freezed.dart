// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logo_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogoSource {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoSource);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LogoSource()';
}


}

/// @nodoc
class $LogoSourceCopyWith<$Res>  {
$LogoSourceCopyWith(LogoSource _, $Res Function(LogoSource) __);
}


/// Adds pattern-matching-related methods to [LogoSource].
extension LogoSourcePatterns on LogoSource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EmptyLogo value)?  empty,TResult Function( AssetLogo value)?  asset,TResult Function( NetworkLogo value)?  network,TResult Function( LocalFileLogo value)?  localFile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EmptyLogo() when empty != null:
return empty(_that);case AssetLogo() when asset != null:
return asset(_that);case NetworkLogo() when network != null:
return network(_that);case LocalFileLogo() when localFile != null:
return localFile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EmptyLogo value)  empty,required TResult Function( AssetLogo value)  asset,required TResult Function( NetworkLogo value)  network,required TResult Function( LocalFileLogo value)  localFile,}){
final _that = this;
switch (_that) {
case EmptyLogo():
return empty(_that);case AssetLogo():
return asset(_that);case NetworkLogo():
return network(_that);case LocalFileLogo():
return localFile(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EmptyLogo value)?  empty,TResult? Function( AssetLogo value)?  asset,TResult? Function( NetworkLogo value)?  network,TResult? Function( LocalFileLogo value)?  localFile,}){
final _that = this;
switch (_that) {
case EmptyLogo() when empty != null:
return empty(_that);case AssetLogo() when asset != null:
return asset(_that);case NetworkLogo() when network != null:
return network(_that);case LocalFileLogo() when localFile != null:
return localFile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  empty,TResult Function( String path)?  asset,TResult Function( String url)?  network,TResult Function( String path)?  localFile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EmptyLogo() when empty != null:
return empty();case AssetLogo() when asset != null:
return asset(_that.path);case NetworkLogo() when network != null:
return network(_that.url);case LocalFileLogo() when localFile != null:
return localFile(_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  empty,required TResult Function( String path)  asset,required TResult Function( String url)  network,required TResult Function( String path)  localFile,}) {final _that = this;
switch (_that) {
case EmptyLogo():
return empty();case AssetLogo():
return asset(_that.path);case NetworkLogo():
return network(_that.url);case LocalFileLogo():
return localFile(_that.path);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  empty,TResult? Function( String path)?  asset,TResult? Function( String url)?  network,TResult? Function( String path)?  localFile,}) {final _that = this;
switch (_that) {
case EmptyLogo() when empty != null:
return empty();case AssetLogo() when asset != null:
return asset(_that.path);case NetworkLogo() when network != null:
return network(_that.url);case LocalFileLogo() when localFile != null:
return localFile(_that.path);case _:
  return null;

}
}

}

/// @nodoc


class EmptyLogo extends LogoSource {
  const EmptyLogo(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmptyLogo);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LogoSource.empty()';
}


}




/// @nodoc


class AssetLogo extends LogoSource {
  const AssetLogo(this.path): super._();
  

 final  String path;

/// Create a copy of LogoSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetLogoCopyWith<AssetLogo> get copyWith => _$AssetLogoCopyWithImpl<AssetLogo>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetLogo&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode {
    return Object.hash(runtimeType,path);
}

@override
String toString() {
    return 'LogoSource.asset(path: $path)';
}


}

/// @nodoc
abstract mixin class $AssetLogoCopyWith<$Res> implements $LogoSourceCopyWith<$Res> {
  factory $AssetLogoCopyWith(AssetLogo value, $Res Function(AssetLogo) _then) = _$AssetLogoCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class _$AssetLogoCopyWithImpl<$Res>
    implements $AssetLogoCopyWith<$Res> {
  _$AssetLogoCopyWithImpl(this._self, this._then);

  final AssetLogo _self;
  final $Res Function(AssetLogo) _then;

/// Create a copy of LogoSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(AssetLogo(
null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NetworkLogo extends LogoSource {
  const NetworkLogo(this.url): super._();
  

 final  String url;

/// Create a copy of LogoSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkLogoCopyWith<NetworkLogo> get copyWith => _$NetworkLogoCopyWithImpl<NetworkLogo>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkLogo&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode {
    return Object.hash(runtimeType,url);
}

@override
String toString() {
    return 'LogoSource.network(url: $url)';
}


}

/// @nodoc
abstract mixin class $NetworkLogoCopyWith<$Res> implements $LogoSourceCopyWith<$Res> {
  factory $NetworkLogoCopyWith(NetworkLogo value, $Res Function(NetworkLogo) _then) = _$NetworkLogoCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$NetworkLogoCopyWithImpl<$Res>
    implements $NetworkLogoCopyWith<$Res> {
  _$NetworkLogoCopyWithImpl(this._self, this._then);

  final NetworkLogo _self;
  final $Res Function(NetworkLogo) _then;

/// Create a copy of LogoSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(NetworkLogo(
null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LocalFileLogo extends LogoSource {
  const LocalFileLogo(this.path): super._();
  

 final  String path;

/// Create a copy of LogoSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalFileLogoCopyWith<LocalFileLogo> get copyWith => _$LocalFileLogoCopyWithImpl<LocalFileLogo>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalFileLogo&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode {
    return Object.hash(runtimeType,path);
}

@override
String toString() {
    return 'LogoSource.localFile(path: $path)';
}


}

/// @nodoc
abstract mixin class $LocalFileLogoCopyWith<$Res> implements $LogoSourceCopyWith<$Res> {
  factory $LocalFileLogoCopyWith(LocalFileLogo value, $Res Function(LocalFileLogo) _then) = _$LocalFileLogoCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class _$LocalFileLogoCopyWithImpl<$Res>
    implements $LocalFileLogoCopyWith<$Res> {
  _$LocalFileLogoCopyWithImpl(this._self, this._then);

  final LocalFileLogo _self;
  final $Res Function(LocalFileLogo) _then;

/// Create a copy of LogoSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(LocalFileLogo(
null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
