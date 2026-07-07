// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_checkup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HealthCheckup {

@JsonKey(fromJson: parseJsonInt) int get wealthLevel; String get wealthLevelName; String get diagnosa; String get saran; List<String> get ciri;@JsonKey(fromJson: parseJsonInt) int get kekayaanBersih;@JsonKey(fromJson: parseJsonInt) int get totalAset;@JsonKey(fromJson: parseJsonInt) int get totalUtang;
/// Create a copy of HealthCheckup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthCheckupCopyWith<HealthCheckup> get copyWith => _$HealthCheckupCopyWithImpl<HealthCheckup>(this as HealthCheckup, _$identity);

  /// Serializes this HealthCheckup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthCheckup&&(identical(other.wealthLevel, wealthLevel) || other.wealthLevel == wealthLevel)&&(identical(other.wealthLevelName, wealthLevelName) || other.wealthLevelName == wealthLevelName)&&(identical(other.diagnosa, diagnosa) || other.diagnosa == diagnosa)&&(identical(other.saran, saran) || other.saran == saran)&&const DeepCollectionEquality().equals(other.ciri, ciri)&&(identical(other.kekayaanBersih, kekayaanBersih) || other.kekayaanBersih == kekayaanBersih)&&(identical(other.totalAset, totalAset) || other.totalAset == totalAset)&&(identical(other.totalUtang, totalUtang) || other.totalUtang == totalUtang));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wealthLevel,wealthLevelName,diagnosa,saran,const DeepCollectionEquality().hash(ciri),kekayaanBersih,totalAset,totalUtang);

@override
String toString() {
  return 'HealthCheckup(wealthLevel: $wealthLevel, wealthLevelName: $wealthLevelName, diagnosa: $diagnosa, saran: $saran, ciri: $ciri, kekayaanBersih: $kekayaanBersih, totalAset: $totalAset, totalUtang: $totalUtang)';
}


}

/// @nodoc
abstract mixin class $HealthCheckupCopyWith<$Res>  {
  factory $HealthCheckupCopyWith(HealthCheckup value, $Res Function(HealthCheckup) _then) = _$HealthCheckupCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: parseJsonInt) int wealthLevel, String wealthLevelName, String diagnosa, String saran, List<String> ciri,@JsonKey(fromJson: parseJsonInt) int kekayaanBersih,@JsonKey(fromJson: parseJsonInt) int totalAset,@JsonKey(fromJson: parseJsonInt) int totalUtang
});




}
/// @nodoc
class _$HealthCheckupCopyWithImpl<$Res>
    implements $HealthCheckupCopyWith<$Res> {
  _$HealthCheckupCopyWithImpl(this._self, this._then);

  final HealthCheckup _self;
  final $Res Function(HealthCheckup) _then;

/// Create a copy of HealthCheckup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wealthLevel = null,Object? wealthLevelName = null,Object? diagnosa = null,Object? saran = null,Object? ciri = null,Object? kekayaanBersih = null,Object? totalAset = null,Object? totalUtang = null,}) {
  return _then(_self.copyWith(
wealthLevel: null == wealthLevel ? _self.wealthLevel : wealthLevel // ignore: cast_nullable_to_non_nullable
as int,wealthLevelName: null == wealthLevelName ? _self.wealthLevelName : wealthLevelName // ignore: cast_nullable_to_non_nullable
as String,diagnosa: null == diagnosa ? _self.diagnosa : diagnosa // ignore: cast_nullable_to_non_nullable
as String,saran: null == saran ? _self.saran : saran // ignore: cast_nullable_to_non_nullable
as String,ciri: null == ciri ? _self.ciri : ciri // ignore: cast_nullable_to_non_nullable
as List<String>,kekayaanBersih: null == kekayaanBersih ? _self.kekayaanBersih : kekayaanBersih // ignore: cast_nullable_to_non_nullable
as int,totalAset: null == totalAset ? _self.totalAset : totalAset // ignore: cast_nullable_to_non_nullable
as int,totalUtang: null == totalUtang ? _self.totalUtang : totalUtang // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthCheckup].
extension HealthCheckupPatterns on HealthCheckup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthCheckup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthCheckup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthCheckup value)  $default,){
final _that = this;
switch (_that) {
case _HealthCheckup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthCheckup value)?  $default,){
final _that = this;
switch (_that) {
case _HealthCheckup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonInt)  int wealthLevel,  String wealthLevelName,  String diagnosa,  String saran,  List<String> ciri, @JsonKey(fromJson: parseJsonInt)  int kekayaanBersih, @JsonKey(fromJson: parseJsonInt)  int totalAset, @JsonKey(fromJson: parseJsonInt)  int totalUtang)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthCheckup() when $default != null:
return $default(_that.wealthLevel,_that.wealthLevelName,_that.diagnosa,_that.saran,_that.ciri,_that.kekayaanBersih,_that.totalAset,_that.totalUtang);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonInt)  int wealthLevel,  String wealthLevelName,  String diagnosa,  String saran,  List<String> ciri, @JsonKey(fromJson: parseJsonInt)  int kekayaanBersih, @JsonKey(fromJson: parseJsonInt)  int totalAset, @JsonKey(fromJson: parseJsonInt)  int totalUtang)  $default,) {final _that = this;
switch (_that) {
case _HealthCheckup():
return $default(_that.wealthLevel,_that.wealthLevelName,_that.diagnosa,_that.saran,_that.ciri,_that.kekayaanBersih,_that.totalAset,_that.totalUtang);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: parseJsonInt)  int wealthLevel,  String wealthLevelName,  String diagnosa,  String saran,  List<String> ciri, @JsonKey(fromJson: parseJsonInt)  int kekayaanBersih, @JsonKey(fromJson: parseJsonInt)  int totalAset, @JsonKey(fromJson: parseJsonInt)  int totalUtang)?  $default,) {final _that = this;
switch (_that) {
case _HealthCheckup() when $default != null:
return $default(_that.wealthLevel,_that.wealthLevelName,_that.diagnosa,_that.saran,_that.ciri,_that.kekayaanBersih,_that.totalAset,_that.totalUtang);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthCheckup extends HealthCheckup {
  const _HealthCheckup({@JsonKey(fromJson: parseJsonInt) required this.wealthLevel, required this.wealthLevelName, required this.diagnosa, required this.saran, final  List<String> ciri = const [], @JsonKey(fromJson: parseJsonInt) required this.kekayaanBersih, @JsonKey(fromJson: parseJsonInt) required this.totalAset, @JsonKey(fromJson: parseJsonInt) required this.totalUtang}): _ciri = ciri,super._();
  factory _HealthCheckup.fromJson(Map<String, dynamic> json) => _$HealthCheckupFromJson(json);

@override@JsonKey(fromJson: parseJsonInt) final  int wealthLevel;
@override final  String wealthLevelName;
@override final  String diagnosa;
@override final  String saran;
 final  List<String> _ciri;
@override@JsonKey() List<String> get ciri {
  if (_ciri is EqualUnmodifiableListView) return _ciri;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ciri);
}

@override@JsonKey(fromJson: parseJsonInt) final  int kekayaanBersih;
@override@JsonKey(fromJson: parseJsonInt) final  int totalAset;
@override@JsonKey(fromJson: parseJsonInt) final  int totalUtang;

/// Create a copy of HealthCheckup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthCheckupCopyWith<_HealthCheckup> get copyWith => __$HealthCheckupCopyWithImpl<_HealthCheckup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthCheckupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthCheckup&&(identical(other.wealthLevel, wealthLevel) || other.wealthLevel == wealthLevel)&&(identical(other.wealthLevelName, wealthLevelName) || other.wealthLevelName == wealthLevelName)&&(identical(other.diagnosa, diagnosa) || other.diagnosa == diagnosa)&&(identical(other.saran, saran) || other.saran == saran)&&const DeepCollectionEquality().equals(other._ciri, _ciri)&&(identical(other.kekayaanBersih, kekayaanBersih) || other.kekayaanBersih == kekayaanBersih)&&(identical(other.totalAset, totalAset) || other.totalAset == totalAset)&&(identical(other.totalUtang, totalUtang) || other.totalUtang == totalUtang));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wealthLevel,wealthLevelName,diagnosa,saran,const DeepCollectionEquality().hash(_ciri),kekayaanBersih,totalAset,totalUtang);

@override
String toString() {
  return 'HealthCheckup(wealthLevel: $wealthLevel, wealthLevelName: $wealthLevelName, diagnosa: $diagnosa, saran: $saran, ciri: $ciri, kekayaanBersih: $kekayaanBersih, totalAset: $totalAset, totalUtang: $totalUtang)';
}


}

/// @nodoc
abstract mixin class _$HealthCheckupCopyWith<$Res> implements $HealthCheckupCopyWith<$Res> {
  factory _$HealthCheckupCopyWith(_HealthCheckup value, $Res Function(_HealthCheckup) _then) = __$HealthCheckupCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: parseJsonInt) int wealthLevel, String wealthLevelName, String diagnosa, String saran, List<String> ciri,@JsonKey(fromJson: parseJsonInt) int kekayaanBersih,@JsonKey(fromJson: parseJsonInt) int totalAset,@JsonKey(fromJson: parseJsonInt) int totalUtang
});




}
/// @nodoc
class __$HealthCheckupCopyWithImpl<$Res>
    implements _$HealthCheckupCopyWith<$Res> {
  __$HealthCheckupCopyWithImpl(this._self, this._then);

  final _HealthCheckup _self;
  final $Res Function(_HealthCheckup) _then;

/// Create a copy of HealthCheckup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wealthLevel = null,Object? wealthLevelName = null,Object? diagnosa = null,Object? saran = null,Object? ciri = null,Object? kekayaanBersih = null,Object? totalAset = null,Object? totalUtang = null,}) {
  return _then(_HealthCheckup(
wealthLevel: null == wealthLevel ? _self.wealthLevel : wealthLevel // ignore: cast_nullable_to_non_nullable
as int,wealthLevelName: null == wealthLevelName ? _self.wealthLevelName : wealthLevelName // ignore: cast_nullable_to_non_nullable
as String,diagnosa: null == diagnosa ? _self.diagnosa : diagnosa // ignore: cast_nullable_to_non_nullable
as String,saran: null == saran ? _self.saran : saran // ignore: cast_nullable_to_non_nullable
as String,ciri: null == ciri ? _self._ciri : ciri // ignore: cast_nullable_to_non_nullable
as List<String>,kekayaanBersih: null == kekayaanBersih ? _self.kekayaanBersih : kekayaanBersih // ignore: cast_nullable_to_non_nullable
as int,totalAset: null == totalAset ? _self.totalAset : totalAset // ignore: cast_nullable_to_non_nullable
as int,totalUtang: null == totalUtang ? _self.totalUtang : totalUtang // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
