// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tetris_game_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TetrisGameStateData {

 TetrisField get field; TetrisFigure get currentFigure; int get curX; int get curY;
/// Create a copy of TetrisGameStateData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TetrisGameStateDataCopyWith<TetrisGameStateData> get copyWith => _$TetrisGameStateDataCopyWithImpl<TetrisGameStateData>(this as TetrisGameStateData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TetrisGameStateData&&const DeepCollectionEquality().equals(other.field, field)&&const DeepCollectionEquality().equals(other.currentFigure, currentFigure)&&(identical(other.curX, curX) || other.curX == curX)&&(identical(other.curY, curY) || other.curY == curY));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(field),const DeepCollectionEquality().hash(currentFigure),curX,curY);

@override
String toString() {
  return 'TetrisGameStateData(field: $field, currentFigure: $currentFigure, curX: $curX, curY: $curY)';
}


}

/// @nodoc
abstract mixin class $TetrisGameStateDataCopyWith<$Res>  {
  factory $TetrisGameStateDataCopyWith(TetrisGameStateData value, $Res Function(TetrisGameStateData) _then) = _$TetrisGameStateDataCopyWithImpl;
@useResult
$Res call({
 TetrisField field, TetrisFigure currentFigure, int curX, int curY
});




}
/// @nodoc
class _$TetrisGameStateDataCopyWithImpl<$Res>
    implements $TetrisGameStateDataCopyWith<$Res> {
  _$TetrisGameStateDataCopyWithImpl(this._self, this._then);

  final TetrisGameStateData _self;
  final $Res Function(TetrisGameStateData) _then;

/// Create a copy of TetrisGameStateData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? field = null,Object? currentFigure = null,Object? curX = null,Object? curY = null,}) {
  return _then(_self.copyWith(
field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as TetrisField,currentFigure: null == currentFigure ? _self.currentFigure : currentFigure // ignore: cast_nullable_to_non_nullable
as TetrisFigure,curX: null == curX ? _self.curX : curX // ignore: cast_nullable_to_non_nullable
as int,curY: null == curY ? _self.curY : curY // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TetrisGameStateData].
extension TetrisGameStateDataPatterns on TetrisGameStateData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TetrisGameStateData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TetrisGameStateData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TetrisGameStateData value)  $default,){
final _that = this;
switch (_that) {
case _TetrisGameStateData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TetrisGameStateData value)?  $default,){
final _that = this;
switch (_that) {
case _TetrisGameStateData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TetrisField field,  TetrisFigure currentFigure,  int curX,  int curY)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TetrisGameStateData() when $default != null:
return $default(_that.field,_that.currentFigure,_that.curX,_that.curY);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TetrisField field,  TetrisFigure currentFigure,  int curX,  int curY)  $default,) {final _that = this;
switch (_that) {
case _TetrisGameStateData():
return $default(_that.field,_that.currentFigure,_that.curX,_that.curY);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TetrisField field,  TetrisFigure currentFigure,  int curX,  int curY)?  $default,) {final _that = this;
switch (_that) {
case _TetrisGameStateData() when $default != null:
return $default(_that.field,_that.currentFigure,_that.curX,_that.curY);case _:
  return null;

}
}

}

/// @nodoc


class _TetrisGameStateData implements TetrisGameStateData {
  const _TetrisGameStateData({required final  TetrisField field, required final  TetrisFigure currentFigure, required this.curX, required this.curY}): _field = field,_currentFigure = currentFigure;
  

 final  TetrisField _field;
@override TetrisField get field {
  if (_field is EqualUnmodifiableListView) return _field;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_field);
}

 final  TetrisFigure _currentFigure;
@override TetrisFigure get currentFigure {
  if (_currentFigure is EqualUnmodifiableListView) return _currentFigure;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currentFigure);
}

@override final  int curX;
@override final  int curY;

/// Create a copy of TetrisGameStateData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TetrisGameStateDataCopyWith<_TetrisGameStateData> get copyWith => __$TetrisGameStateDataCopyWithImpl<_TetrisGameStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TetrisGameStateData&&const DeepCollectionEquality().equals(other._field, _field)&&const DeepCollectionEquality().equals(other._currentFigure, _currentFigure)&&(identical(other.curX, curX) || other.curX == curX)&&(identical(other.curY, curY) || other.curY == curY));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_field),const DeepCollectionEquality().hash(_currentFigure),curX,curY);

@override
String toString() {
  return 'TetrisGameStateData(field: $field, currentFigure: $currentFigure, curX: $curX, curY: $curY)';
}


}

/// @nodoc
abstract mixin class _$TetrisGameStateDataCopyWith<$Res> implements $TetrisGameStateDataCopyWith<$Res> {
  factory _$TetrisGameStateDataCopyWith(_TetrisGameStateData value, $Res Function(_TetrisGameStateData) _then) = __$TetrisGameStateDataCopyWithImpl;
@override @useResult
$Res call({
 TetrisField field, TetrisFigure currentFigure, int curX, int curY
});




}
/// @nodoc
class __$TetrisGameStateDataCopyWithImpl<$Res>
    implements _$TetrisGameStateDataCopyWith<$Res> {
  __$TetrisGameStateDataCopyWithImpl(this._self, this._then);

  final _TetrisGameStateData _self;
  final $Res Function(_TetrisGameStateData) _then;

/// Create a copy of TetrisGameStateData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? field = null,Object? currentFigure = null,Object? curX = null,Object? curY = null,}) {
  return _then(_TetrisGameStateData(
field: null == field ? _self._field : field // ignore: cast_nullable_to_non_nullable
as TetrisField,currentFigure: null == currentFigure ? _self._currentFigure : currentFigure // ignore: cast_nullable_to_non_nullable
as TetrisFigure,curX: null == curX ? _self.curX : curX // ignore: cast_nullable_to_non_nullable
as int,curY: null == curY ? _self.curY : curY // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
