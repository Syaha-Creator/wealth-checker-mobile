// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_cash_flow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonthSnapshot {

 String get bulan;@JsonKey(fromJson: parseJsonInt) int get pemasukan;@JsonKey(fromJson: parseJsonInt) int get pengeluaran;@JsonKey(fromJson: parseJsonInt) int get sisaUangBulanan;
/// Create a copy of MonthSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthSnapshotCopyWith<MonthSnapshot> get copyWith => _$MonthSnapshotCopyWithImpl<MonthSnapshot>(this as MonthSnapshot, _$identity);

  /// Serializes this MonthSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthSnapshot&&(identical(other.bulan, bulan) || other.bulan == bulan)&&(identical(other.pemasukan, pemasukan) || other.pemasukan == pemasukan)&&(identical(other.pengeluaran, pengeluaran) || other.pengeluaran == pengeluaran)&&(identical(other.sisaUangBulanan, sisaUangBulanan) || other.sisaUangBulanan == sisaUangBulanan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bulan,pemasukan,pengeluaran,sisaUangBulanan);

@override
String toString() {
  return 'MonthSnapshot(bulan: $bulan, pemasukan: $pemasukan, pengeluaran: $pengeluaran, sisaUangBulanan: $sisaUangBulanan)';
}


}

/// @nodoc
abstract mixin class $MonthSnapshotCopyWith<$Res>  {
  factory $MonthSnapshotCopyWith(MonthSnapshot value, $Res Function(MonthSnapshot) _then) = _$MonthSnapshotCopyWithImpl;
@useResult
$Res call({
 String bulan,@JsonKey(fromJson: parseJsonInt) int pemasukan,@JsonKey(fromJson: parseJsonInt) int pengeluaran,@JsonKey(fromJson: parseJsonInt) int sisaUangBulanan
});




}
/// @nodoc
class _$MonthSnapshotCopyWithImpl<$Res>
    implements $MonthSnapshotCopyWith<$Res> {
  _$MonthSnapshotCopyWithImpl(this._self, this._then);

  final MonthSnapshot _self;
  final $Res Function(MonthSnapshot) _then;

/// Create a copy of MonthSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bulan = null,Object? pemasukan = null,Object? pengeluaran = null,Object? sisaUangBulanan = null,}) {
  return _then(_self.copyWith(
bulan: null == bulan ? _self.bulan : bulan // ignore: cast_nullable_to_non_nullable
as String,pemasukan: null == pemasukan ? _self.pemasukan : pemasukan // ignore: cast_nullable_to_non_nullable
as int,pengeluaran: null == pengeluaran ? _self.pengeluaran : pengeluaran // ignore: cast_nullable_to_non_nullable
as int,sisaUangBulanan: null == sisaUangBulanan ? _self.sisaUangBulanan : sisaUangBulanan // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MonthSnapshot].
extension MonthSnapshotPatterns on MonthSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _MonthSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _MonthSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bulan, @JsonKey(fromJson: parseJsonInt)  int pemasukan, @JsonKey(fromJson: parseJsonInt)  int pengeluaran, @JsonKey(fromJson: parseJsonInt)  int sisaUangBulanan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthSnapshot() when $default != null:
return $default(_that.bulan,_that.pemasukan,_that.pengeluaran,_that.sisaUangBulanan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bulan, @JsonKey(fromJson: parseJsonInt)  int pemasukan, @JsonKey(fromJson: parseJsonInt)  int pengeluaran, @JsonKey(fromJson: parseJsonInt)  int sisaUangBulanan)  $default,) {final _that = this;
switch (_that) {
case _MonthSnapshot():
return $default(_that.bulan,_that.pemasukan,_that.pengeluaran,_that.sisaUangBulanan);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bulan, @JsonKey(fromJson: parseJsonInt)  int pemasukan, @JsonKey(fromJson: parseJsonInt)  int pengeluaran, @JsonKey(fromJson: parseJsonInt)  int sisaUangBulanan)?  $default,) {final _that = this;
switch (_that) {
case _MonthSnapshot() when $default != null:
return $default(_that.bulan,_that.pemasukan,_that.pengeluaran,_that.sisaUangBulanan);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonthSnapshot implements MonthSnapshot {
  const _MonthSnapshot({required this.bulan, @JsonKey(fromJson: parseJsonInt) required this.pemasukan, @JsonKey(fromJson: parseJsonInt) required this.pengeluaran, @JsonKey(fromJson: parseJsonInt) required this.sisaUangBulanan});
  factory _MonthSnapshot.fromJson(Map<String, dynamic> json) => _$MonthSnapshotFromJson(json);

@override final  String bulan;
@override@JsonKey(fromJson: parseJsonInt) final  int pemasukan;
@override@JsonKey(fromJson: parseJsonInt) final  int pengeluaran;
@override@JsonKey(fromJson: parseJsonInt) final  int sisaUangBulanan;

/// Create a copy of MonthSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthSnapshotCopyWith<_MonthSnapshot> get copyWith => __$MonthSnapshotCopyWithImpl<_MonthSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonthSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthSnapshot&&(identical(other.bulan, bulan) || other.bulan == bulan)&&(identical(other.pemasukan, pemasukan) || other.pemasukan == pemasukan)&&(identical(other.pengeluaran, pengeluaran) || other.pengeluaran == pengeluaran)&&(identical(other.sisaUangBulanan, sisaUangBulanan) || other.sisaUangBulanan == sisaUangBulanan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bulan,pemasukan,pengeluaran,sisaUangBulanan);

@override
String toString() {
  return 'MonthSnapshot(bulan: $bulan, pemasukan: $pemasukan, pengeluaran: $pengeluaran, sisaUangBulanan: $sisaUangBulanan)';
}


}

/// @nodoc
abstract mixin class _$MonthSnapshotCopyWith<$Res> implements $MonthSnapshotCopyWith<$Res> {
  factory _$MonthSnapshotCopyWith(_MonthSnapshot value, $Res Function(_MonthSnapshot) _then) = __$MonthSnapshotCopyWithImpl;
@override @useResult
$Res call({
 String bulan,@JsonKey(fromJson: parseJsonInt) int pemasukan,@JsonKey(fromJson: parseJsonInt) int pengeluaran,@JsonKey(fromJson: parseJsonInt) int sisaUangBulanan
});




}
/// @nodoc
class __$MonthSnapshotCopyWithImpl<$Res>
    implements _$MonthSnapshotCopyWith<$Res> {
  __$MonthSnapshotCopyWithImpl(this._self, this._then);

  final _MonthSnapshot _self;
  final $Res Function(_MonthSnapshot) _then;

/// Create a copy of MonthSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bulan = null,Object? pemasukan = null,Object? pengeluaran = null,Object? sisaUangBulanan = null,}) {
  return _then(_MonthSnapshot(
bulan: null == bulan ? _self.bulan : bulan // ignore: cast_nullable_to_non_nullable
as String,pemasukan: null == pemasukan ? _self.pemasukan : pemasukan // ignore: cast_nullable_to_non_nullable
as int,pengeluaran: null == pengeluaran ? _self.pengeluaran : pengeluaran // ignore: cast_nullable_to_non_nullable
as int,sisaUangBulanan: null == sisaUangBulanan ? _self.sisaUangBulanan : sisaUangBulanan // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RollingAverage {

@JsonKey(fromJson: parseJsonInt) int get pemasukan;@JsonKey(fromJson: parseJsonInt) int get pengeluaran;@JsonKey(fromJson: parseJsonInt) int get sisaUangBulanan;
/// Create a copy of RollingAverage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RollingAverageCopyWith<RollingAverage> get copyWith => _$RollingAverageCopyWithImpl<RollingAverage>(this as RollingAverage, _$identity);

  /// Serializes this RollingAverage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RollingAverage&&(identical(other.pemasukan, pemasukan) || other.pemasukan == pemasukan)&&(identical(other.pengeluaran, pengeluaran) || other.pengeluaran == pengeluaran)&&(identical(other.sisaUangBulanan, sisaUangBulanan) || other.sisaUangBulanan == sisaUangBulanan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pemasukan,pengeluaran,sisaUangBulanan);

@override
String toString() {
  return 'RollingAverage(pemasukan: $pemasukan, pengeluaran: $pengeluaran, sisaUangBulanan: $sisaUangBulanan)';
}


}

/// @nodoc
abstract mixin class $RollingAverageCopyWith<$Res>  {
  factory $RollingAverageCopyWith(RollingAverage value, $Res Function(RollingAverage) _then) = _$RollingAverageCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: parseJsonInt) int pemasukan,@JsonKey(fromJson: parseJsonInt) int pengeluaran,@JsonKey(fromJson: parseJsonInt) int sisaUangBulanan
});




}
/// @nodoc
class _$RollingAverageCopyWithImpl<$Res>
    implements $RollingAverageCopyWith<$Res> {
  _$RollingAverageCopyWithImpl(this._self, this._then);

  final RollingAverage _self;
  final $Res Function(RollingAverage) _then;

/// Create a copy of RollingAverage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pemasukan = null,Object? pengeluaran = null,Object? sisaUangBulanan = null,}) {
  return _then(_self.copyWith(
pemasukan: null == pemasukan ? _self.pemasukan : pemasukan // ignore: cast_nullable_to_non_nullable
as int,pengeluaran: null == pengeluaran ? _self.pengeluaran : pengeluaran // ignore: cast_nullable_to_non_nullable
as int,sisaUangBulanan: null == sisaUangBulanan ? _self.sisaUangBulanan : sisaUangBulanan // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RollingAverage].
extension RollingAveragePatterns on RollingAverage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RollingAverage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RollingAverage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RollingAverage value)  $default,){
final _that = this;
switch (_that) {
case _RollingAverage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RollingAverage value)?  $default,){
final _that = this;
switch (_that) {
case _RollingAverage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonInt)  int pemasukan, @JsonKey(fromJson: parseJsonInt)  int pengeluaran, @JsonKey(fromJson: parseJsonInt)  int sisaUangBulanan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RollingAverage() when $default != null:
return $default(_that.pemasukan,_that.pengeluaran,_that.sisaUangBulanan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonInt)  int pemasukan, @JsonKey(fromJson: parseJsonInt)  int pengeluaran, @JsonKey(fromJson: parseJsonInt)  int sisaUangBulanan)  $default,) {final _that = this;
switch (_that) {
case _RollingAverage():
return $default(_that.pemasukan,_that.pengeluaran,_that.sisaUangBulanan);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: parseJsonInt)  int pemasukan, @JsonKey(fromJson: parseJsonInt)  int pengeluaran, @JsonKey(fromJson: parseJsonInt)  int sisaUangBulanan)?  $default,) {final _that = this;
switch (_that) {
case _RollingAverage() when $default != null:
return $default(_that.pemasukan,_that.pengeluaran,_that.sisaUangBulanan);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RollingAverage implements RollingAverage {
  const _RollingAverage({@JsonKey(fromJson: parseJsonInt) required this.pemasukan, @JsonKey(fromJson: parseJsonInt) required this.pengeluaran, @JsonKey(fromJson: parseJsonInt) required this.sisaUangBulanan});
  factory _RollingAverage.fromJson(Map<String, dynamic> json) => _$RollingAverageFromJson(json);

@override@JsonKey(fromJson: parseJsonInt) final  int pemasukan;
@override@JsonKey(fromJson: parseJsonInt) final  int pengeluaran;
@override@JsonKey(fromJson: parseJsonInt) final  int sisaUangBulanan;

/// Create a copy of RollingAverage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RollingAverageCopyWith<_RollingAverage> get copyWith => __$RollingAverageCopyWithImpl<_RollingAverage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RollingAverageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RollingAverage&&(identical(other.pemasukan, pemasukan) || other.pemasukan == pemasukan)&&(identical(other.pengeluaran, pengeluaran) || other.pengeluaran == pengeluaran)&&(identical(other.sisaUangBulanan, sisaUangBulanan) || other.sisaUangBulanan == sisaUangBulanan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pemasukan,pengeluaran,sisaUangBulanan);

@override
String toString() {
  return 'RollingAverage(pemasukan: $pemasukan, pengeluaran: $pengeluaran, sisaUangBulanan: $sisaUangBulanan)';
}


}

/// @nodoc
abstract mixin class _$RollingAverageCopyWith<$Res> implements $RollingAverageCopyWith<$Res> {
  factory _$RollingAverageCopyWith(_RollingAverage value, $Res Function(_RollingAverage) _then) = __$RollingAverageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: parseJsonInt) int pemasukan,@JsonKey(fromJson: parseJsonInt) int pengeluaran,@JsonKey(fromJson: parseJsonInt) int sisaUangBulanan
});




}
/// @nodoc
class __$RollingAverageCopyWithImpl<$Res>
    implements _$RollingAverageCopyWith<$Res> {
  __$RollingAverageCopyWithImpl(this._self, this._then);

  final _RollingAverage _self;
  final $Res Function(_RollingAverage) _then;

/// Create a copy of RollingAverage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pemasukan = null,Object? pengeluaran = null,Object? sisaUangBulanan = null,}) {
  return _then(_RollingAverage(
pemasukan: null == pemasukan ? _self.pemasukan : pemasukan // ignore: cast_nullable_to_non_nullable
as int,pengeluaran: null == pengeluaran ? _self.pengeluaran : pengeluaran // ignore: cast_nullable_to_non_nullable
as int,sisaUangBulanan: null == sisaUangBulanan ? _self.sisaUangBulanan : sisaUangBulanan // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MonthlyCashFlow {

 MonthSnapshot get bulanIni; MonthSnapshot get bulanLalu; RollingAverage get rataRata3Bulan;@JsonKey(fromJson: parseJsonDoubleNullable) double? get hidupTanpaGajiBulan; bool get usedProfileFallback;
/// Create a copy of MonthlyCashFlow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthlyCashFlowCopyWith<MonthlyCashFlow> get copyWith => _$MonthlyCashFlowCopyWithImpl<MonthlyCashFlow>(this as MonthlyCashFlow, _$identity);

  /// Serializes this MonthlyCashFlow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthlyCashFlow&&(identical(other.bulanIni, bulanIni) || other.bulanIni == bulanIni)&&(identical(other.bulanLalu, bulanLalu) || other.bulanLalu == bulanLalu)&&(identical(other.rataRata3Bulan, rataRata3Bulan) || other.rataRata3Bulan == rataRata3Bulan)&&(identical(other.hidupTanpaGajiBulan, hidupTanpaGajiBulan) || other.hidupTanpaGajiBulan == hidupTanpaGajiBulan)&&(identical(other.usedProfileFallback, usedProfileFallback) || other.usedProfileFallback == usedProfileFallback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bulanIni,bulanLalu,rataRata3Bulan,hidupTanpaGajiBulan,usedProfileFallback);

@override
String toString() {
  return 'MonthlyCashFlow(bulanIni: $bulanIni, bulanLalu: $bulanLalu, rataRata3Bulan: $rataRata3Bulan, hidupTanpaGajiBulan: $hidupTanpaGajiBulan, usedProfileFallback: $usedProfileFallback)';
}


}

/// @nodoc
abstract mixin class $MonthlyCashFlowCopyWith<$Res>  {
  factory $MonthlyCashFlowCopyWith(MonthlyCashFlow value, $Res Function(MonthlyCashFlow) _then) = _$MonthlyCashFlowCopyWithImpl;
@useResult
$Res call({
 MonthSnapshot bulanIni, MonthSnapshot bulanLalu, RollingAverage rataRata3Bulan,@JsonKey(fromJson: parseJsonDoubleNullable) double? hidupTanpaGajiBulan, bool usedProfileFallback
});


$MonthSnapshotCopyWith<$Res> get bulanIni;$MonthSnapshotCopyWith<$Res> get bulanLalu;$RollingAverageCopyWith<$Res> get rataRata3Bulan;

}
/// @nodoc
class _$MonthlyCashFlowCopyWithImpl<$Res>
    implements $MonthlyCashFlowCopyWith<$Res> {
  _$MonthlyCashFlowCopyWithImpl(this._self, this._then);

  final MonthlyCashFlow _self;
  final $Res Function(MonthlyCashFlow) _then;

/// Create a copy of MonthlyCashFlow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bulanIni = null,Object? bulanLalu = null,Object? rataRata3Bulan = null,Object? hidupTanpaGajiBulan = freezed,Object? usedProfileFallback = null,}) {
  return _then(_self.copyWith(
bulanIni: null == bulanIni ? _self.bulanIni : bulanIni // ignore: cast_nullable_to_non_nullable
as MonthSnapshot,bulanLalu: null == bulanLalu ? _self.bulanLalu : bulanLalu // ignore: cast_nullable_to_non_nullable
as MonthSnapshot,rataRata3Bulan: null == rataRata3Bulan ? _self.rataRata3Bulan : rataRata3Bulan // ignore: cast_nullable_to_non_nullable
as RollingAverage,hidupTanpaGajiBulan: freezed == hidupTanpaGajiBulan ? _self.hidupTanpaGajiBulan : hidupTanpaGajiBulan // ignore: cast_nullable_to_non_nullable
as double?,usedProfileFallback: null == usedProfileFallback ? _self.usedProfileFallback : usedProfileFallback // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MonthlyCashFlow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthSnapshotCopyWith<$Res> get bulanIni {
  
  return $MonthSnapshotCopyWith<$Res>(_self.bulanIni, (value) {
    return _then(_self.copyWith(bulanIni: value));
  });
}/// Create a copy of MonthlyCashFlow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthSnapshotCopyWith<$Res> get bulanLalu {
  
  return $MonthSnapshotCopyWith<$Res>(_self.bulanLalu, (value) {
    return _then(_self.copyWith(bulanLalu: value));
  });
}/// Create a copy of MonthlyCashFlow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RollingAverageCopyWith<$Res> get rataRata3Bulan {
  
  return $RollingAverageCopyWith<$Res>(_self.rataRata3Bulan, (value) {
    return _then(_self.copyWith(rataRata3Bulan: value));
  });
}
}


/// Adds pattern-matching-related methods to [MonthlyCashFlow].
extension MonthlyCashFlowPatterns on MonthlyCashFlow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthlyCashFlow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthlyCashFlow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthlyCashFlow value)  $default,){
final _that = this;
switch (_that) {
case _MonthlyCashFlow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthlyCashFlow value)?  $default,){
final _that = this;
switch (_that) {
case _MonthlyCashFlow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MonthSnapshot bulanIni,  MonthSnapshot bulanLalu,  RollingAverage rataRata3Bulan, @JsonKey(fromJson: parseJsonDoubleNullable)  double? hidupTanpaGajiBulan,  bool usedProfileFallback)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthlyCashFlow() when $default != null:
return $default(_that.bulanIni,_that.bulanLalu,_that.rataRata3Bulan,_that.hidupTanpaGajiBulan,_that.usedProfileFallback);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MonthSnapshot bulanIni,  MonthSnapshot bulanLalu,  RollingAverage rataRata3Bulan, @JsonKey(fromJson: parseJsonDoubleNullable)  double? hidupTanpaGajiBulan,  bool usedProfileFallback)  $default,) {final _that = this;
switch (_that) {
case _MonthlyCashFlow():
return $default(_that.bulanIni,_that.bulanLalu,_that.rataRata3Bulan,_that.hidupTanpaGajiBulan,_that.usedProfileFallback);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MonthSnapshot bulanIni,  MonthSnapshot bulanLalu,  RollingAverage rataRata3Bulan, @JsonKey(fromJson: parseJsonDoubleNullable)  double? hidupTanpaGajiBulan,  bool usedProfileFallback)?  $default,) {final _that = this;
switch (_that) {
case _MonthlyCashFlow() when $default != null:
return $default(_that.bulanIni,_that.bulanLalu,_that.rataRata3Bulan,_that.hidupTanpaGajiBulan,_that.usedProfileFallback);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonthlyCashFlow implements MonthlyCashFlow {
  const _MonthlyCashFlow({required this.bulanIni, required this.bulanLalu, required this.rataRata3Bulan, @JsonKey(fromJson: parseJsonDoubleNullable) this.hidupTanpaGajiBulan, required this.usedProfileFallback});
  factory _MonthlyCashFlow.fromJson(Map<String, dynamic> json) => _$MonthlyCashFlowFromJson(json);

@override final  MonthSnapshot bulanIni;
@override final  MonthSnapshot bulanLalu;
@override final  RollingAverage rataRata3Bulan;
@override@JsonKey(fromJson: parseJsonDoubleNullable) final  double? hidupTanpaGajiBulan;
@override final  bool usedProfileFallback;

/// Create a copy of MonthlyCashFlow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthlyCashFlowCopyWith<_MonthlyCashFlow> get copyWith => __$MonthlyCashFlowCopyWithImpl<_MonthlyCashFlow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonthlyCashFlowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthlyCashFlow&&(identical(other.bulanIni, bulanIni) || other.bulanIni == bulanIni)&&(identical(other.bulanLalu, bulanLalu) || other.bulanLalu == bulanLalu)&&(identical(other.rataRata3Bulan, rataRata3Bulan) || other.rataRata3Bulan == rataRata3Bulan)&&(identical(other.hidupTanpaGajiBulan, hidupTanpaGajiBulan) || other.hidupTanpaGajiBulan == hidupTanpaGajiBulan)&&(identical(other.usedProfileFallback, usedProfileFallback) || other.usedProfileFallback == usedProfileFallback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bulanIni,bulanLalu,rataRata3Bulan,hidupTanpaGajiBulan,usedProfileFallback);

@override
String toString() {
  return 'MonthlyCashFlow(bulanIni: $bulanIni, bulanLalu: $bulanLalu, rataRata3Bulan: $rataRata3Bulan, hidupTanpaGajiBulan: $hidupTanpaGajiBulan, usedProfileFallback: $usedProfileFallback)';
}


}

/// @nodoc
abstract mixin class _$MonthlyCashFlowCopyWith<$Res> implements $MonthlyCashFlowCopyWith<$Res> {
  factory _$MonthlyCashFlowCopyWith(_MonthlyCashFlow value, $Res Function(_MonthlyCashFlow) _then) = __$MonthlyCashFlowCopyWithImpl;
@override @useResult
$Res call({
 MonthSnapshot bulanIni, MonthSnapshot bulanLalu, RollingAverage rataRata3Bulan,@JsonKey(fromJson: parseJsonDoubleNullable) double? hidupTanpaGajiBulan, bool usedProfileFallback
});


@override $MonthSnapshotCopyWith<$Res> get bulanIni;@override $MonthSnapshotCopyWith<$Res> get bulanLalu;@override $RollingAverageCopyWith<$Res> get rataRata3Bulan;

}
/// @nodoc
class __$MonthlyCashFlowCopyWithImpl<$Res>
    implements _$MonthlyCashFlowCopyWith<$Res> {
  __$MonthlyCashFlowCopyWithImpl(this._self, this._then);

  final _MonthlyCashFlow _self;
  final $Res Function(_MonthlyCashFlow) _then;

/// Create a copy of MonthlyCashFlow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bulanIni = null,Object? bulanLalu = null,Object? rataRata3Bulan = null,Object? hidupTanpaGajiBulan = freezed,Object? usedProfileFallback = null,}) {
  return _then(_MonthlyCashFlow(
bulanIni: null == bulanIni ? _self.bulanIni : bulanIni // ignore: cast_nullable_to_non_nullable
as MonthSnapshot,bulanLalu: null == bulanLalu ? _self.bulanLalu : bulanLalu // ignore: cast_nullable_to_non_nullable
as MonthSnapshot,rataRata3Bulan: null == rataRata3Bulan ? _self.rataRata3Bulan : rataRata3Bulan // ignore: cast_nullable_to_non_nullable
as RollingAverage,hidupTanpaGajiBulan: freezed == hidupTanpaGajiBulan ? _self.hidupTanpaGajiBulan : hidupTanpaGajiBulan // ignore: cast_nullable_to_non_nullable
as double?,usedProfileFallback: null == usedProfileFallback ? _self.usedProfileFallback : usedProfileFallback // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MonthlyCashFlow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthSnapshotCopyWith<$Res> get bulanIni {
  
  return $MonthSnapshotCopyWith<$Res>(_self.bulanIni, (value) {
    return _then(_self.copyWith(bulanIni: value));
  });
}/// Create a copy of MonthlyCashFlow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthSnapshotCopyWith<$Res> get bulanLalu {
  
  return $MonthSnapshotCopyWith<$Res>(_self.bulanLalu, (value) {
    return _then(_self.copyWith(bulanLalu: value));
  });
}/// Create a copy of MonthlyCashFlow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RollingAverageCopyWith<$Res> get rataRata3Bulan {
  
  return $RollingAverageCopyWith<$Res>(_self.rataRata3Bulan, (value) {
    return _then(_self.copyWith(rataRata3Bulan: value));
  });
}
}

// dart format on
