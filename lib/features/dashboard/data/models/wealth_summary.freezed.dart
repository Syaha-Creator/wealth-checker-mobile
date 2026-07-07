// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wealth_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WealthSummary {

 String get userName; String get userEmail;@JsonKey(fromJson: parseJsonInt) int get totalKas;@JsonKey(fromJson: parseJsonInt) int get totalLiquidAssets;@JsonKey(fromJson: parseJsonInt) int get totalFixedAssets;@JsonKey(fromJson: parseJsonInt) int get totalReceivables;@JsonKey(fromJson: parseJsonInt) int get totalUtang;@JsonKey(fromJson: parseJsonInt) int get totalAset;@JsonKey(fromJson: parseJsonInt) int get kekayaanBersih;@JsonKey(fromJson: parseJsonInt) int get wealthLevel; String get wealthLevelName;
/// Create a copy of WealthSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WealthSummaryCopyWith<WealthSummary> get copyWith => _$WealthSummaryCopyWithImpl<WealthSummary>(this as WealthSummary, _$identity);

  /// Serializes this WealthSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WealthSummary&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.totalKas, totalKas) || other.totalKas == totalKas)&&(identical(other.totalLiquidAssets, totalLiquidAssets) || other.totalLiquidAssets == totalLiquidAssets)&&(identical(other.totalFixedAssets, totalFixedAssets) || other.totalFixedAssets == totalFixedAssets)&&(identical(other.totalReceivables, totalReceivables) || other.totalReceivables == totalReceivables)&&(identical(other.totalUtang, totalUtang) || other.totalUtang == totalUtang)&&(identical(other.totalAset, totalAset) || other.totalAset == totalAset)&&(identical(other.kekayaanBersih, kekayaanBersih) || other.kekayaanBersih == kekayaanBersih)&&(identical(other.wealthLevel, wealthLevel) || other.wealthLevel == wealthLevel)&&(identical(other.wealthLevelName, wealthLevelName) || other.wealthLevelName == wealthLevelName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,userEmail,totalKas,totalLiquidAssets,totalFixedAssets,totalReceivables,totalUtang,totalAset,kekayaanBersih,wealthLevel,wealthLevelName);

@override
String toString() {
  return 'WealthSummary(userName: $userName, userEmail: $userEmail, totalKas: $totalKas, totalLiquidAssets: $totalLiquidAssets, totalFixedAssets: $totalFixedAssets, totalReceivables: $totalReceivables, totalUtang: $totalUtang, totalAset: $totalAset, kekayaanBersih: $kekayaanBersih, wealthLevel: $wealthLevel, wealthLevelName: $wealthLevelName)';
}


}

/// @nodoc
abstract mixin class $WealthSummaryCopyWith<$Res>  {
  factory $WealthSummaryCopyWith(WealthSummary value, $Res Function(WealthSummary) _then) = _$WealthSummaryCopyWithImpl;
@useResult
$Res call({
 String userName, String userEmail,@JsonKey(fromJson: parseJsonInt) int totalKas,@JsonKey(fromJson: parseJsonInt) int totalLiquidAssets,@JsonKey(fromJson: parseJsonInt) int totalFixedAssets,@JsonKey(fromJson: parseJsonInt) int totalReceivables,@JsonKey(fromJson: parseJsonInt) int totalUtang,@JsonKey(fromJson: parseJsonInt) int totalAset,@JsonKey(fromJson: parseJsonInt) int kekayaanBersih,@JsonKey(fromJson: parseJsonInt) int wealthLevel, String wealthLevelName
});




}
/// @nodoc
class _$WealthSummaryCopyWithImpl<$Res>
    implements $WealthSummaryCopyWith<$Res> {
  _$WealthSummaryCopyWithImpl(this._self, this._then);

  final WealthSummary _self;
  final $Res Function(WealthSummary) _then;

/// Create a copy of WealthSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = null,Object? userEmail = null,Object? totalKas = null,Object? totalLiquidAssets = null,Object? totalFixedAssets = null,Object? totalReceivables = null,Object? totalUtang = null,Object? totalAset = null,Object? kekayaanBersih = null,Object? wealthLevel = null,Object? wealthLevelName = null,}) {
  return _then(_self.copyWith(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userEmail: null == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String,totalKas: null == totalKas ? _self.totalKas : totalKas // ignore: cast_nullable_to_non_nullable
as int,totalLiquidAssets: null == totalLiquidAssets ? _self.totalLiquidAssets : totalLiquidAssets // ignore: cast_nullable_to_non_nullable
as int,totalFixedAssets: null == totalFixedAssets ? _self.totalFixedAssets : totalFixedAssets // ignore: cast_nullable_to_non_nullable
as int,totalReceivables: null == totalReceivables ? _self.totalReceivables : totalReceivables // ignore: cast_nullable_to_non_nullable
as int,totalUtang: null == totalUtang ? _self.totalUtang : totalUtang // ignore: cast_nullable_to_non_nullable
as int,totalAset: null == totalAset ? _self.totalAset : totalAset // ignore: cast_nullable_to_non_nullable
as int,kekayaanBersih: null == kekayaanBersih ? _self.kekayaanBersih : kekayaanBersih // ignore: cast_nullable_to_non_nullable
as int,wealthLevel: null == wealthLevel ? _self.wealthLevel : wealthLevel // ignore: cast_nullable_to_non_nullable
as int,wealthLevelName: null == wealthLevelName ? _self.wealthLevelName : wealthLevelName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WealthSummary].
extension WealthSummaryPatterns on WealthSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WealthSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WealthSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WealthSummary value)  $default,){
final _that = this;
switch (_that) {
case _WealthSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WealthSummary value)?  $default,){
final _that = this;
switch (_that) {
case _WealthSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userName,  String userEmail, @JsonKey(fromJson: parseJsonInt)  int totalKas, @JsonKey(fromJson: parseJsonInt)  int totalLiquidAssets, @JsonKey(fromJson: parseJsonInt)  int totalFixedAssets, @JsonKey(fromJson: parseJsonInt)  int totalReceivables, @JsonKey(fromJson: parseJsonInt)  int totalUtang, @JsonKey(fromJson: parseJsonInt)  int totalAset, @JsonKey(fromJson: parseJsonInt)  int kekayaanBersih, @JsonKey(fromJson: parseJsonInt)  int wealthLevel,  String wealthLevelName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WealthSummary() when $default != null:
return $default(_that.userName,_that.userEmail,_that.totalKas,_that.totalLiquidAssets,_that.totalFixedAssets,_that.totalReceivables,_that.totalUtang,_that.totalAset,_that.kekayaanBersih,_that.wealthLevel,_that.wealthLevelName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userName,  String userEmail, @JsonKey(fromJson: parseJsonInt)  int totalKas, @JsonKey(fromJson: parseJsonInt)  int totalLiquidAssets, @JsonKey(fromJson: parseJsonInt)  int totalFixedAssets, @JsonKey(fromJson: parseJsonInt)  int totalReceivables, @JsonKey(fromJson: parseJsonInt)  int totalUtang, @JsonKey(fromJson: parseJsonInt)  int totalAset, @JsonKey(fromJson: parseJsonInt)  int kekayaanBersih, @JsonKey(fromJson: parseJsonInt)  int wealthLevel,  String wealthLevelName)  $default,) {final _that = this;
switch (_that) {
case _WealthSummary():
return $default(_that.userName,_that.userEmail,_that.totalKas,_that.totalLiquidAssets,_that.totalFixedAssets,_that.totalReceivables,_that.totalUtang,_that.totalAset,_that.kekayaanBersih,_that.wealthLevel,_that.wealthLevelName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userName,  String userEmail, @JsonKey(fromJson: parseJsonInt)  int totalKas, @JsonKey(fromJson: parseJsonInt)  int totalLiquidAssets, @JsonKey(fromJson: parseJsonInt)  int totalFixedAssets, @JsonKey(fromJson: parseJsonInt)  int totalReceivables, @JsonKey(fromJson: parseJsonInt)  int totalUtang, @JsonKey(fromJson: parseJsonInt)  int totalAset, @JsonKey(fromJson: parseJsonInt)  int kekayaanBersih, @JsonKey(fromJson: parseJsonInt)  int wealthLevel,  String wealthLevelName)?  $default,) {final _that = this;
switch (_that) {
case _WealthSummary() when $default != null:
return $default(_that.userName,_that.userEmail,_that.totalKas,_that.totalLiquidAssets,_that.totalFixedAssets,_that.totalReceivables,_that.totalUtang,_that.totalAset,_that.kekayaanBersih,_that.wealthLevel,_that.wealthLevelName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WealthSummary implements WealthSummary {
  const _WealthSummary({required this.userName, required this.userEmail, @JsonKey(fromJson: parseJsonInt) required this.totalKas, @JsonKey(fromJson: parseJsonInt) required this.totalLiquidAssets, @JsonKey(fromJson: parseJsonInt) required this.totalFixedAssets, @JsonKey(fromJson: parseJsonInt) required this.totalReceivables, @JsonKey(fromJson: parseJsonInt) required this.totalUtang, @JsonKey(fromJson: parseJsonInt) required this.totalAset, @JsonKey(fromJson: parseJsonInt) required this.kekayaanBersih, @JsonKey(fromJson: parseJsonInt) required this.wealthLevel, required this.wealthLevelName});
  factory _WealthSummary.fromJson(Map<String, dynamic> json) => _$WealthSummaryFromJson(json);

@override final  String userName;
@override final  String userEmail;
@override@JsonKey(fromJson: parseJsonInt) final  int totalKas;
@override@JsonKey(fromJson: parseJsonInt) final  int totalLiquidAssets;
@override@JsonKey(fromJson: parseJsonInt) final  int totalFixedAssets;
@override@JsonKey(fromJson: parseJsonInt) final  int totalReceivables;
@override@JsonKey(fromJson: parseJsonInt) final  int totalUtang;
@override@JsonKey(fromJson: parseJsonInt) final  int totalAset;
@override@JsonKey(fromJson: parseJsonInt) final  int kekayaanBersih;
@override@JsonKey(fromJson: parseJsonInt) final  int wealthLevel;
@override final  String wealthLevelName;

/// Create a copy of WealthSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WealthSummaryCopyWith<_WealthSummary> get copyWith => __$WealthSummaryCopyWithImpl<_WealthSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WealthSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WealthSummary&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.totalKas, totalKas) || other.totalKas == totalKas)&&(identical(other.totalLiquidAssets, totalLiquidAssets) || other.totalLiquidAssets == totalLiquidAssets)&&(identical(other.totalFixedAssets, totalFixedAssets) || other.totalFixedAssets == totalFixedAssets)&&(identical(other.totalReceivables, totalReceivables) || other.totalReceivables == totalReceivables)&&(identical(other.totalUtang, totalUtang) || other.totalUtang == totalUtang)&&(identical(other.totalAset, totalAset) || other.totalAset == totalAset)&&(identical(other.kekayaanBersih, kekayaanBersih) || other.kekayaanBersih == kekayaanBersih)&&(identical(other.wealthLevel, wealthLevel) || other.wealthLevel == wealthLevel)&&(identical(other.wealthLevelName, wealthLevelName) || other.wealthLevelName == wealthLevelName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,userEmail,totalKas,totalLiquidAssets,totalFixedAssets,totalReceivables,totalUtang,totalAset,kekayaanBersih,wealthLevel,wealthLevelName);

@override
String toString() {
  return 'WealthSummary(userName: $userName, userEmail: $userEmail, totalKas: $totalKas, totalLiquidAssets: $totalLiquidAssets, totalFixedAssets: $totalFixedAssets, totalReceivables: $totalReceivables, totalUtang: $totalUtang, totalAset: $totalAset, kekayaanBersih: $kekayaanBersih, wealthLevel: $wealthLevel, wealthLevelName: $wealthLevelName)';
}


}

/// @nodoc
abstract mixin class _$WealthSummaryCopyWith<$Res> implements $WealthSummaryCopyWith<$Res> {
  factory _$WealthSummaryCopyWith(_WealthSummary value, $Res Function(_WealthSummary) _then) = __$WealthSummaryCopyWithImpl;
@override @useResult
$Res call({
 String userName, String userEmail,@JsonKey(fromJson: parseJsonInt) int totalKas,@JsonKey(fromJson: parseJsonInt) int totalLiquidAssets,@JsonKey(fromJson: parseJsonInt) int totalFixedAssets,@JsonKey(fromJson: parseJsonInt) int totalReceivables,@JsonKey(fromJson: parseJsonInt) int totalUtang,@JsonKey(fromJson: parseJsonInt) int totalAset,@JsonKey(fromJson: parseJsonInt) int kekayaanBersih,@JsonKey(fromJson: parseJsonInt) int wealthLevel, String wealthLevelName
});




}
/// @nodoc
class __$WealthSummaryCopyWithImpl<$Res>
    implements _$WealthSummaryCopyWith<$Res> {
  __$WealthSummaryCopyWithImpl(this._self, this._then);

  final _WealthSummary _self;
  final $Res Function(_WealthSummary) _then;

/// Create a copy of WealthSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userName = null,Object? userEmail = null,Object? totalKas = null,Object? totalLiquidAssets = null,Object? totalFixedAssets = null,Object? totalReceivables = null,Object? totalUtang = null,Object? totalAset = null,Object? kekayaanBersih = null,Object? wealthLevel = null,Object? wealthLevelName = null,}) {
  return _then(_WealthSummary(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userEmail: null == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String,totalKas: null == totalKas ? _self.totalKas : totalKas // ignore: cast_nullable_to_non_nullable
as int,totalLiquidAssets: null == totalLiquidAssets ? _self.totalLiquidAssets : totalLiquidAssets // ignore: cast_nullable_to_non_nullable
as int,totalFixedAssets: null == totalFixedAssets ? _self.totalFixedAssets : totalFixedAssets // ignore: cast_nullable_to_non_nullable
as int,totalReceivables: null == totalReceivables ? _self.totalReceivables : totalReceivables // ignore: cast_nullable_to_non_nullable
as int,totalUtang: null == totalUtang ? _self.totalUtang : totalUtang // ignore: cast_nullable_to_non_nullable
as int,totalAset: null == totalAset ? _self.totalAset : totalAset // ignore: cast_nullable_to_non_nullable
as int,kekayaanBersih: null == kekayaanBersih ? _self.kekayaanBersih : kekayaanBersih // ignore: cast_nullable_to_non_nullable
as int,wealthLevel: null == wealthLevel ? _self.wealthLevel : wealthLevel // ignore: cast_nullable_to_non_nullable
as int,wealthLevelName: null == wealthLevelName ? _self.wealthLevelName : wealthLevelName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
