// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_profit_loss.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonthlyProfitLoss {

 String get bulan;@JsonKey(fromJson: parseJsonInt) int get pendapatan;@JsonKey(fromJson: parseJsonInt) int get pinjamanMasuk;@JsonKey(fromJson: parseJsonInt) int get bayarUtang;@JsonKey(fromJson: parseJsonInt) int get piutangTerbayar;@JsonKey(fromJson: parseJsonInt) int get pengeluaran;@JsonKey(fromJson: parseJsonInt) int get tabungan; bool get tabunganNegatif;
/// Create a copy of MonthlyProfitLoss
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthlyProfitLossCopyWith<MonthlyProfitLoss> get copyWith => _$MonthlyProfitLossCopyWithImpl<MonthlyProfitLoss>(this as MonthlyProfitLoss, _$identity);

  /// Serializes this MonthlyProfitLoss to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthlyProfitLoss&&(identical(other.bulan, bulan) || other.bulan == bulan)&&(identical(other.pendapatan, pendapatan) || other.pendapatan == pendapatan)&&(identical(other.pinjamanMasuk, pinjamanMasuk) || other.pinjamanMasuk == pinjamanMasuk)&&(identical(other.bayarUtang, bayarUtang) || other.bayarUtang == bayarUtang)&&(identical(other.piutangTerbayar, piutangTerbayar) || other.piutangTerbayar == piutangTerbayar)&&(identical(other.pengeluaran, pengeluaran) || other.pengeluaran == pengeluaran)&&(identical(other.tabungan, tabungan) || other.tabungan == tabungan)&&(identical(other.tabunganNegatif, tabunganNegatif) || other.tabunganNegatif == tabunganNegatif));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bulan,pendapatan,pinjamanMasuk,bayarUtang,piutangTerbayar,pengeluaran,tabungan,tabunganNegatif);

@override
String toString() {
  return 'MonthlyProfitLoss(bulan: $bulan, pendapatan: $pendapatan, pinjamanMasuk: $pinjamanMasuk, bayarUtang: $bayarUtang, piutangTerbayar: $piutangTerbayar, pengeluaran: $pengeluaran, tabungan: $tabungan, tabunganNegatif: $tabunganNegatif)';
}


}

/// @nodoc
abstract mixin class $MonthlyProfitLossCopyWith<$Res>  {
  factory $MonthlyProfitLossCopyWith(MonthlyProfitLoss value, $Res Function(MonthlyProfitLoss) _then) = _$MonthlyProfitLossCopyWithImpl;
@useResult
$Res call({
 String bulan,@JsonKey(fromJson: parseJsonInt) int pendapatan,@JsonKey(fromJson: parseJsonInt) int pinjamanMasuk,@JsonKey(fromJson: parseJsonInt) int bayarUtang,@JsonKey(fromJson: parseJsonInt) int piutangTerbayar,@JsonKey(fromJson: parseJsonInt) int pengeluaran,@JsonKey(fromJson: parseJsonInt) int tabungan, bool tabunganNegatif
});




}
/// @nodoc
class _$MonthlyProfitLossCopyWithImpl<$Res>
    implements $MonthlyProfitLossCopyWith<$Res> {
  _$MonthlyProfitLossCopyWithImpl(this._self, this._then);

  final MonthlyProfitLoss _self;
  final $Res Function(MonthlyProfitLoss) _then;

/// Create a copy of MonthlyProfitLoss
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bulan = null,Object? pendapatan = null,Object? pinjamanMasuk = null,Object? bayarUtang = null,Object? piutangTerbayar = null,Object? pengeluaran = null,Object? tabungan = null,Object? tabunganNegatif = null,}) {
  return _then(_self.copyWith(
bulan: null == bulan ? _self.bulan : bulan // ignore: cast_nullable_to_non_nullable
as String,pendapatan: null == pendapatan ? _self.pendapatan : pendapatan // ignore: cast_nullable_to_non_nullable
as int,pinjamanMasuk: null == pinjamanMasuk ? _self.pinjamanMasuk : pinjamanMasuk // ignore: cast_nullable_to_non_nullable
as int,bayarUtang: null == bayarUtang ? _self.bayarUtang : bayarUtang // ignore: cast_nullable_to_non_nullable
as int,piutangTerbayar: null == piutangTerbayar ? _self.piutangTerbayar : piutangTerbayar // ignore: cast_nullable_to_non_nullable
as int,pengeluaran: null == pengeluaran ? _self.pengeluaran : pengeluaran // ignore: cast_nullable_to_non_nullable
as int,tabungan: null == tabungan ? _self.tabungan : tabungan // ignore: cast_nullable_to_non_nullable
as int,tabunganNegatif: null == tabunganNegatif ? _self.tabunganNegatif : tabunganNegatif // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MonthlyProfitLoss].
extension MonthlyProfitLossPatterns on MonthlyProfitLoss {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthlyProfitLoss value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthlyProfitLoss() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthlyProfitLoss value)  $default,){
final _that = this;
switch (_that) {
case _MonthlyProfitLoss():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthlyProfitLoss value)?  $default,){
final _that = this;
switch (_that) {
case _MonthlyProfitLoss() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bulan, @JsonKey(fromJson: parseJsonInt)  int pendapatan, @JsonKey(fromJson: parseJsonInt)  int pinjamanMasuk, @JsonKey(fromJson: parseJsonInt)  int bayarUtang, @JsonKey(fromJson: parseJsonInt)  int piutangTerbayar, @JsonKey(fromJson: parseJsonInt)  int pengeluaran, @JsonKey(fromJson: parseJsonInt)  int tabungan,  bool tabunganNegatif)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthlyProfitLoss() when $default != null:
return $default(_that.bulan,_that.pendapatan,_that.pinjamanMasuk,_that.bayarUtang,_that.piutangTerbayar,_that.pengeluaran,_that.tabungan,_that.tabunganNegatif);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bulan, @JsonKey(fromJson: parseJsonInt)  int pendapatan, @JsonKey(fromJson: parseJsonInt)  int pinjamanMasuk, @JsonKey(fromJson: parseJsonInt)  int bayarUtang, @JsonKey(fromJson: parseJsonInt)  int piutangTerbayar, @JsonKey(fromJson: parseJsonInt)  int pengeluaran, @JsonKey(fromJson: parseJsonInt)  int tabungan,  bool tabunganNegatif)  $default,) {final _that = this;
switch (_that) {
case _MonthlyProfitLoss():
return $default(_that.bulan,_that.pendapatan,_that.pinjamanMasuk,_that.bayarUtang,_that.piutangTerbayar,_that.pengeluaran,_that.tabungan,_that.tabunganNegatif);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bulan, @JsonKey(fromJson: parseJsonInt)  int pendapatan, @JsonKey(fromJson: parseJsonInt)  int pinjamanMasuk, @JsonKey(fromJson: parseJsonInt)  int bayarUtang, @JsonKey(fromJson: parseJsonInt)  int piutangTerbayar, @JsonKey(fromJson: parseJsonInt)  int pengeluaran, @JsonKey(fromJson: parseJsonInt)  int tabungan,  bool tabunganNegatif)?  $default,) {final _that = this;
switch (_that) {
case _MonthlyProfitLoss() when $default != null:
return $default(_that.bulan,_that.pendapatan,_that.pinjamanMasuk,_that.bayarUtang,_that.piutangTerbayar,_that.pengeluaran,_that.tabungan,_that.tabunganNegatif);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonthlyProfitLoss extends MonthlyProfitLoss {
  const _MonthlyProfitLoss({required this.bulan, @JsonKey(fromJson: parseJsonInt) required this.pendapatan, @JsonKey(fromJson: parseJsonInt) required this.pinjamanMasuk, @JsonKey(fromJson: parseJsonInt) required this.bayarUtang, @JsonKey(fromJson: parseJsonInt) required this.piutangTerbayar, @JsonKey(fromJson: parseJsonInt) required this.pengeluaran, @JsonKey(fromJson: parseJsonInt) required this.tabungan, required this.tabunganNegatif}): super._();
  factory _MonthlyProfitLoss.fromJson(Map<String, dynamic> json) => _$MonthlyProfitLossFromJson(json);

@override final  String bulan;
@override@JsonKey(fromJson: parseJsonInt) final  int pendapatan;
@override@JsonKey(fromJson: parseJsonInt) final  int pinjamanMasuk;
@override@JsonKey(fromJson: parseJsonInt) final  int bayarUtang;
@override@JsonKey(fromJson: parseJsonInt) final  int piutangTerbayar;
@override@JsonKey(fromJson: parseJsonInt) final  int pengeluaran;
@override@JsonKey(fromJson: parseJsonInt) final  int tabungan;
@override final  bool tabunganNegatif;

/// Create a copy of MonthlyProfitLoss
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthlyProfitLossCopyWith<_MonthlyProfitLoss> get copyWith => __$MonthlyProfitLossCopyWithImpl<_MonthlyProfitLoss>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonthlyProfitLossToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthlyProfitLoss&&(identical(other.bulan, bulan) || other.bulan == bulan)&&(identical(other.pendapatan, pendapatan) || other.pendapatan == pendapatan)&&(identical(other.pinjamanMasuk, pinjamanMasuk) || other.pinjamanMasuk == pinjamanMasuk)&&(identical(other.bayarUtang, bayarUtang) || other.bayarUtang == bayarUtang)&&(identical(other.piutangTerbayar, piutangTerbayar) || other.piutangTerbayar == piutangTerbayar)&&(identical(other.pengeluaran, pengeluaran) || other.pengeluaran == pengeluaran)&&(identical(other.tabungan, tabungan) || other.tabungan == tabungan)&&(identical(other.tabunganNegatif, tabunganNegatif) || other.tabunganNegatif == tabunganNegatif));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bulan,pendapatan,pinjamanMasuk,bayarUtang,piutangTerbayar,pengeluaran,tabungan,tabunganNegatif);

@override
String toString() {
  return 'MonthlyProfitLoss(bulan: $bulan, pendapatan: $pendapatan, pinjamanMasuk: $pinjamanMasuk, bayarUtang: $bayarUtang, piutangTerbayar: $piutangTerbayar, pengeluaran: $pengeluaran, tabungan: $tabungan, tabunganNegatif: $tabunganNegatif)';
}


}

/// @nodoc
abstract mixin class _$MonthlyProfitLossCopyWith<$Res> implements $MonthlyProfitLossCopyWith<$Res> {
  factory _$MonthlyProfitLossCopyWith(_MonthlyProfitLoss value, $Res Function(_MonthlyProfitLoss) _then) = __$MonthlyProfitLossCopyWithImpl;
@override @useResult
$Res call({
 String bulan,@JsonKey(fromJson: parseJsonInt) int pendapatan,@JsonKey(fromJson: parseJsonInt) int pinjamanMasuk,@JsonKey(fromJson: parseJsonInt) int bayarUtang,@JsonKey(fromJson: parseJsonInt) int piutangTerbayar,@JsonKey(fromJson: parseJsonInt) int pengeluaran,@JsonKey(fromJson: parseJsonInt) int tabungan, bool tabunganNegatif
});




}
/// @nodoc
class __$MonthlyProfitLossCopyWithImpl<$Res>
    implements _$MonthlyProfitLossCopyWith<$Res> {
  __$MonthlyProfitLossCopyWithImpl(this._self, this._then);

  final _MonthlyProfitLoss _self;
  final $Res Function(_MonthlyProfitLoss) _then;

/// Create a copy of MonthlyProfitLoss
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bulan = null,Object? pendapatan = null,Object? pinjamanMasuk = null,Object? bayarUtang = null,Object? piutangTerbayar = null,Object? pengeluaran = null,Object? tabungan = null,Object? tabunganNegatif = null,}) {
  return _then(_MonthlyProfitLoss(
bulan: null == bulan ? _self.bulan : bulan // ignore: cast_nullable_to_non_nullable
as String,pendapatan: null == pendapatan ? _self.pendapatan : pendapatan // ignore: cast_nullable_to_non_nullable
as int,pinjamanMasuk: null == pinjamanMasuk ? _self.pinjamanMasuk : pinjamanMasuk // ignore: cast_nullable_to_non_nullable
as int,bayarUtang: null == bayarUtang ? _self.bayarUtang : bayarUtang // ignore: cast_nullable_to_non_nullable
as int,piutangTerbayar: null == piutangTerbayar ? _self.piutangTerbayar : piutangTerbayar // ignore: cast_nullable_to_non_nullable
as int,pengeluaran: null == pengeluaran ? _self.pengeluaran : pengeluaran // ignore: cast_nullable_to_non_nullable
as int,tabungan: null == tabungan ? _self.tabungan : tabungan // ignore: cast_nullable_to_non_nullable
as int,tabunganNegatif: null == tabunganNegatif ? _self.tabunganNegatif : tabunganNegatif // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
