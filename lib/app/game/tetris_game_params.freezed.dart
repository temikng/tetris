// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tetris_game_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TetrisGameParams {

 int get cols; int get rows;
/// Create a copy of TetrisGameParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TetrisGameParamsCopyWith<TetrisGameParams> get copyWith => _$TetrisGameParamsCopyWithImpl<TetrisGameParams>(this as TetrisGameParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TetrisGameParams&&(identical(other.cols, cols) || other.cols == cols)&&(identical(other.rows, rows) || other.rows == rows));
}


@override
int get hashCode => Object.hash(runtimeType,cols,rows);

@override
String toString() {
  return 'TetrisGameParams(cols: $cols, rows: $rows)';
}


}

/// @nodoc
abstract mixin class $TetrisGameParamsCopyWith<$Res>  {
  factory $TetrisGameParamsCopyWith(TetrisGameParams value, $Res Function(TetrisGameParams) _then) = _$TetrisGameParamsCopyWithImpl;
@useResult
$Res call({
 int cols, int rows
});




}
/// @nodoc
class _$TetrisGameParamsCopyWithImpl<$Res>
    implements $TetrisGameParamsCopyWith<$Res> {
  _$TetrisGameParamsCopyWithImpl(this._self, this._then);

  final TetrisGameParams _self;
  final $Res Function(TetrisGameParams) _then;

/// Create a copy of TetrisGameParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cols = null,Object? rows = null,}) {
  return _then(_self.copyWith(
cols: null == cols ? _self.cols : cols // ignore: cast_nullable_to_non_nullable
as int,rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TetrisGameParams].
extension TetrisGameParamsPatterns on TetrisGameParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TetrisGameParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TetrisGameParams() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TetrisGameParams value)  $default,){
final _that = this;
switch (_that) {
case _TetrisGameParams():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TetrisGameParams value)?  $default,){
final _that = this;
switch (_that) {
case _TetrisGameParams() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int cols,  int rows)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TetrisGameParams() when $default != null:
return $default(_that.cols,_that.rows);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int cols,  int rows)  $default,) {final _that = this;
switch (_that) {
case _TetrisGameParams():
return $default(_that.cols,_that.rows);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int cols,  int rows)?  $default,) {final _that = this;
switch (_that) {
case _TetrisGameParams() when $default != null:
return $default(_that.cols,_that.rows);case _:
  return null;

}
}

}

/// @nodoc


class _TetrisGameParams implements TetrisGameParams {
  const _TetrisGameParams({required this.cols, required this.rows});
  

@override final  int cols;
@override final  int rows;

/// Create a copy of TetrisGameParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TetrisGameParamsCopyWith<_TetrisGameParams> get copyWith => __$TetrisGameParamsCopyWithImpl<_TetrisGameParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TetrisGameParams&&(identical(other.cols, cols) || other.cols == cols)&&(identical(other.rows, rows) || other.rows == rows));
}


@override
int get hashCode => Object.hash(runtimeType,cols,rows);

@override
String toString() {
  return 'TetrisGameParams(cols: $cols, rows: $rows)';
}


}

/// @nodoc
abstract mixin class _$TetrisGameParamsCopyWith<$Res> implements $TetrisGameParamsCopyWith<$Res> {
  factory _$TetrisGameParamsCopyWith(_TetrisGameParams value, $Res Function(_TetrisGameParams) _then) = __$TetrisGameParamsCopyWithImpl;
@override @useResult
$Res call({
 int cols, int rows
});




}
/// @nodoc
class __$TetrisGameParamsCopyWithImpl<$Res>
    implements _$TetrisGameParamsCopyWith<$Res> {
  __$TetrisGameParamsCopyWithImpl(this._self, this._then);

  final _TetrisGameParams _self;
  final $Res Function(_TetrisGameParams) _then;

/// Create a copy of TetrisGameParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cols = null,Object? rows = null,}) {
  return _then(_TetrisGameParams(
cols: null == cols ? _self.cols : cols // ignore: cast_nullable_to_non_nullable
as int,rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
