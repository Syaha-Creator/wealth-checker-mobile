// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wealth_history_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WealthHistoryPoint {

 String get tanggal;@JsonKey(fromJson: parseJsonInt) int get kekayaanBersih;
/// Create a copy of WealthHistoryPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WealthHistoryPointCopyWith<WealthHistoryPoint> get copyWith => _$WealthHistoryPointCopyWithImpl<WealthHistoryPoint>(this as WealthHistoryPoint, _$identity);

  /// Serializes this WealthHistoryPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WealthHistoryPoint&&(identical(other.tanggal, tanggal) || other.tanggal == tanggal)&&(identical(other.kekayaanBersih, kekayaanBersih) || other.kekayaanBersih == kekayaanBersih));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tanggal,kekayaanBersih);

@override
String toString() {
  return 'WealthHistoryPoint(tanggal: $tanggal, kekayaanBersih: $kekayaanBersih)';
}


}

/// @nodoc
abstract mixin class $WealthHistoryPointCopyWith<$Res>  {
  factory $WealthHistoryPointCopyWith(WealthHistoryPoint value, $Res Function(WealthHistoryPoint) _then) = _$WealthHistoryPointCopyWithImpl;
@useResult
$Res call({
 String tanggal,@JsonKey(fromJson: parseJsonInt) int kekayaanBersih
});




}
/// @nodoc
class _$WealthHistoryPointCopyWithImpl<$Res>
    implements $WealthHistoryPointCopyWith<$Res> {
  _$WealthHistoryPointCopyWithImpl(this._self, this._then);

  final WealthHistoryPoint _self;
  final $Res Function(WealthHistoryPoint) _then;

/// Create a copy of WealthHistoryPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tanggal = null,Object? kekayaanBersih = null,}) {
  return _then(_self.copyWith(
tanggal: null == tanggal ? _self.tanggal : tanggal // ignore: cast_nullable_to_non_nullable
as String,kekayaanBersih: null == kekayaanBersih ? _self.kekayaanBersih : kekayaanBersih // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WealthHistoryPoint].
extension WealthHistoryPointPatterns on WealthHistoryPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WealthHistoryPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WealthHistoryPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WealthHistoryPoint value)  $default,){
final _that = this;
switch (_that) {
case _WealthHistoryPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WealthHistoryPoint value)?  $default,){
final _that = this;
switch (_that) {
case _WealthHistoryPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tanggal, @JsonKey(fromJson: parseJsonInt)  int kekayaanBersih)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WealthHistoryPoint() when $default != null:
return $default(_that.tanggal,_that.kekayaanBersih);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tanggal, @JsonKey(fromJson: parseJsonInt)  int kekayaanBersih)  $default,) {final _that = this;
switch (_that) {
case _WealthHistoryPoint():
return $default(_that.tanggal,_that.kekayaanBersih);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tanggal, @JsonKey(fromJson: parseJsonInt)  int kekayaanBersih)?  $default,) {final _that = this;
switch (_that) {
case _WealthHistoryPoint() when $default != null:
return $default(_that.tanggal,_that.kekayaanBersih);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WealthHistoryPoint implements WealthHistoryPoint {
  const _WealthHistoryPoint({required this.tanggal, @JsonKey(fromJson: parseJsonInt) required this.kekayaanBersih});
  factory _WealthHistoryPoint.fromJson(Map<String, dynamic> json) => _$WealthHistoryPointFromJson(json);

@override final  String tanggal;
@override@JsonKey(fromJson: parseJsonInt) final  int kekayaanBersih;

/// Create a copy of WealthHistoryPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WealthHistoryPointCopyWith<_WealthHistoryPoint> get copyWith => __$WealthHistoryPointCopyWithImpl<_WealthHistoryPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WealthHistoryPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WealthHistoryPoint&&(identical(other.tanggal, tanggal) || other.tanggal == tanggal)&&(identical(other.kekayaanBersih, kekayaanBersih) || other.kekayaanBersih == kekayaanBersih));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tanggal,kekayaanBersih);

@override
String toString() {
  return 'WealthHistoryPoint(tanggal: $tanggal, kekayaanBersih: $kekayaanBersih)';
}


}

/// @nodoc
abstract mixin class _$WealthHistoryPointCopyWith<$Res> implements $WealthHistoryPointCopyWith<$Res> {
  factory _$WealthHistoryPointCopyWith(_WealthHistoryPoint value, $Res Function(_WealthHistoryPoint) _then) = __$WealthHistoryPointCopyWithImpl;
@override @useResult
$Res call({
 String tanggal,@JsonKey(fromJson: parseJsonInt) int kekayaanBersih
});




}
/// @nodoc
class __$WealthHistoryPointCopyWithImpl<$Res>
    implements _$WealthHistoryPointCopyWith<$Res> {
  __$WealthHistoryPointCopyWithImpl(this._self, this._then);

  final _WealthHistoryPoint _self;
  final $Res Function(_WealthHistoryPoint) _then;

/// Create a copy of WealthHistoryPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tanggal = null,Object? kekayaanBersih = null,}) {
  return _then(_WealthHistoryPoint(
tanggal: null == tanggal ? _self.tanggal : tanggal // ignore: cast_nullable_to_non_nullable
as String,kekayaanBersih: null == kekayaanBersih ? _self.kekayaanBersih : kekayaanBersih // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WealthHistory {

 List<WealthHistoryPoint> get history;@JsonKey(fromJson: parseJsonInt) int get delta;
/// Create a copy of WealthHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WealthHistoryCopyWith<WealthHistory> get copyWith => _$WealthHistoryCopyWithImpl<WealthHistory>(this as WealthHistory, _$identity);

  /// Serializes this WealthHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WealthHistory&&const DeepCollectionEquality().equals(other.history, history)&&(identical(other.delta, delta) || other.delta == delta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(history),delta);

@override
String toString() {
  return 'WealthHistory(history: $history, delta: $delta)';
}


}

/// @nodoc
abstract mixin class $WealthHistoryCopyWith<$Res>  {
  factory $WealthHistoryCopyWith(WealthHistory value, $Res Function(WealthHistory) _then) = _$WealthHistoryCopyWithImpl;
@useResult
$Res call({
 List<WealthHistoryPoint> history,@JsonKey(fromJson: parseJsonInt) int delta
});




}
/// @nodoc
class _$WealthHistoryCopyWithImpl<$Res>
    implements $WealthHistoryCopyWith<$Res> {
  _$WealthHistoryCopyWithImpl(this._self, this._then);

  final WealthHistory _self;
  final $Res Function(WealthHistory) _then;

/// Create a copy of WealthHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? history = null,Object? delta = null,}) {
  return _then(_self.copyWith(
history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<WealthHistoryPoint>,delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WealthHistory].
extension WealthHistoryPatterns on WealthHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WealthHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WealthHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WealthHistory value)  $default,){
final _that = this;
switch (_that) {
case _WealthHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WealthHistory value)?  $default,){
final _that = this;
switch (_that) {
case _WealthHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WealthHistoryPoint> history, @JsonKey(fromJson: parseJsonInt)  int delta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WealthHistory() when $default != null:
return $default(_that.history,_that.delta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WealthHistoryPoint> history, @JsonKey(fromJson: parseJsonInt)  int delta)  $default,) {final _that = this;
switch (_that) {
case _WealthHistory():
return $default(_that.history,_that.delta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WealthHistoryPoint> history, @JsonKey(fromJson: parseJsonInt)  int delta)?  $default,) {final _that = this;
switch (_that) {
case _WealthHistory() when $default != null:
return $default(_that.history,_that.delta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WealthHistory extends WealthHistory {
  const _WealthHistory({final  List<WealthHistoryPoint> history = const [], @JsonKey(fromJson: parseJsonInt) this.delta = 0}): _history = history,super._();
  factory _WealthHistory.fromJson(Map<String, dynamic> json) => _$WealthHistoryFromJson(json);

 final  List<WealthHistoryPoint> _history;
@override@JsonKey() List<WealthHistoryPoint> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override@JsonKey(fromJson: parseJsonInt) final  int delta;

/// Create a copy of WealthHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WealthHistoryCopyWith<_WealthHistory> get copyWith => __$WealthHistoryCopyWithImpl<_WealthHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WealthHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WealthHistory&&const DeepCollectionEquality().equals(other._history, _history)&&(identical(other.delta, delta) || other.delta == delta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_history),delta);

@override
String toString() {
  return 'WealthHistory(history: $history, delta: $delta)';
}


}

/// @nodoc
abstract mixin class _$WealthHistoryCopyWith<$Res> implements $WealthHistoryCopyWith<$Res> {
  factory _$WealthHistoryCopyWith(_WealthHistory value, $Res Function(_WealthHistory) _then) = __$WealthHistoryCopyWithImpl;
@override @useResult
$Res call({
 List<WealthHistoryPoint> history,@JsonKey(fromJson: parseJsonInt) int delta
});




}
/// @nodoc
class __$WealthHistoryCopyWithImpl<$Res>
    implements _$WealthHistoryCopyWith<$Res> {
  __$WealthHistoryCopyWithImpl(this._self, this._then);

  final _WealthHistory _self;
  final $Res Function(_WealthHistory) _then;

/// Create a copy of WealthHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? history = null,Object? delta = null,}) {
  return _then(_WealthHistory(
history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<WealthHistoryPoint>,delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
