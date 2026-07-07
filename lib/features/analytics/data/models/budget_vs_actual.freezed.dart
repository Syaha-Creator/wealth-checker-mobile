// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_vs_actual.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BudgetVsActualPendapatan {

@JsonKey(fromJson: parseJsonMoneyAmount) int get rencanaNominal;@JsonKey(fromJson: parseJsonMoneyAmount) int get aktualNominal;
/// Create a copy of BudgetVsActualPendapatan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetVsActualPendapatanCopyWith<BudgetVsActualPendapatan> get copyWith => _$BudgetVsActualPendapatanCopyWithImpl<BudgetVsActualPendapatan>(this as BudgetVsActualPendapatan, _$identity);

  /// Serializes this BudgetVsActualPendapatan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetVsActualPendapatan&&(identical(other.rencanaNominal, rencanaNominal) || other.rencanaNominal == rencanaNominal)&&(identical(other.aktualNominal, aktualNominal) || other.aktualNominal == aktualNominal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rencanaNominal,aktualNominal);

@override
String toString() {
  return 'BudgetVsActualPendapatan(rencanaNominal: $rencanaNominal, aktualNominal: $aktualNominal)';
}


}

/// @nodoc
abstract mixin class $BudgetVsActualPendapatanCopyWith<$Res>  {
  factory $BudgetVsActualPendapatanCopyWith(BudgetVsActualPendapatan value, $Res Function(BudgetVsActualPendapatan) _then) = _$BudgetVsActualPendapatanCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: parseJsonMoneyAmount) int rencanaNominal,@JsonKey(fromJson: parseJsonMoneyAmount) int aktualNominal
});




}
/// @nodoc
class _$BudgetVsActualPendapatanCopyWithImpl<$Res>
    implements $BudgetVsActualPendapatanCopyWith<$Res> {
  _$BudgetVsActualPendapatanCopyWithImpl(this._self, this._then);

  final BudgetVsActualPendapatan _self;
  final $Res Function(BudgetVsActualPendapatan) _then;

/// Create a copy of BudgetVsActualPendapatan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rencanaNominal = null,Object? aktualNominal = null,}) {
  return _then(_self.copyWith(
rencanaNominal: null == rencanaNominal ? _self.rencanaNominal : rencanaNominal // ignore: cast_nullable_to_non_nullable
as int,aktualNominal: null == aktualNominal ? _self.aktualNominal : aktualNominal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetVsActualPendapatan].
extension BudgetVsActualPendapatanPatterns on BudgetVsActualPendapatan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetVsActualPendapatan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetVsActualPendapatan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetVsActualPendapatan value)  $default,){
final _that = this;
switch (_that) {
case _BudgetVsActualPendapatan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetVsActualPendapatan value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetVsActualPendapatan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonMoneyAmount)  int rencanaNominal, @JsonKey(fromJson: parseJsonMoneyAmount)  int aktualNominal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetVsActualPendapatan() when $default != null:
return $default(_that.rencanaNominal,_that.aktualNominal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonMoneyAmount)  int rencanaNominal, @JsonKey(fromJson: parseJsonMoneyAmount)  int aktualNominal)  $default,) {final _that = this;
switch (_that) {
case _BudgetVsActualPendapatan():
return $default(_that.rencanaNominal,_that.aktualNominal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: parseJsonMoneyAmount)  int rencanaNominal, @JsonKey(fromJson: parseJsonMoneyAmount)  int aktualNominal)?  $default,) {final _that = this;
switch (_that) {
case _BudgetVsActualPendapatan() when $default != null:
return $default(_that.rencanaNominal,_that.aktualNominal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BudgetVsActualPendapatan implements BudgetVsActualPendapatan {
  const _BudgetVsActualPendapatan({@JsonKey(fromJson: parseJsonMoneyAmount) required this.rencanaNominal, @JsonKey(fromJson: parseJsonMoneyAmount) required this.aktualNominal});
  factory _BudgetVsActualPendapatan.fromJson(Map<String, dynamic> json) => _$BudgetVsActualPendapatanFromJson(json);

@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int rencanaNominal;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int aktualNominal;

/// Create a copy of BudgetVsActualPendapatan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetVsActualPendapatanCopyWith<_BudgetVsActualPendapatan> get copyWith => __$BudgetVsActualPendapatanCopyWithImpl<_BudgetVsActualPendapatan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BudgetVsActualPendapatanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetVsActualPendapatan&&(identical(other.rencanaNominal, rencanaNominal) || other.rencanaNominal == rencanaNominal)&&(identical(other.aktualNominal, aktualNominal) || other.aktualNominal == aktualNominal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rencanaNominal,aktualNominal);

@override
String toString() {
  return 'BudgetVsActualPendapatan(rencanaNominal: $rencanaNominal, aktualNominal: $aktualNominal)';
}


}

/// @nodoc
abstract mixin class _$BudgetVsActualPendapatanCopyWith<$Res> implements $BudgetVsActualPendapatanCopyWith<$Res> {
  factory _$BudgetVsActualPendapatanCopyWith(_BudgetVsActualPendapatan value, $Res Function(_BudgetVsActualPendapatan) _then) = __$BudgetVsActualPendapatanCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: parseJsonMoneyAmount) int rencanaNominal,@JsonKey(fromJson: parseJsonMoneyAmount) int aktualNominal
});




}
/// @nodoc
class __$BudgetVsActualPendapatanCopyWithImpl<$Res>
    implements _$BudgetVsActualPendapatanCopyWith<$Res> {
  __$BudgetVsActualPendapatanCopyWithImpl(this._self, this._then);

  final _BudgetVsActualPendapatan _self;
  final $Res Function(_BudgetVsActualPendapatan) _then;

/// Create a copy of BudgetVsActualPendapatan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rencanaNominal = null,Object? aktualNominal = null,}) {
  return _then(_BudgetVsActualPendapatan(
rencanaNominal: null == rencanaNominal ? _self.rencanaNominal : rencanaNominal // ignore: cast_nullable_to_non_nullable
as int,aktualNominal: null == aktualNominal ? _self.aktualNominal : aktualNominal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BudgetVsActualItem {

 String get kategori;@JsonKey(fromJson: parseJsonMoneyAmount) int get rencanaNominal;@JsonKey(fromJson: parseJsonMoneyAmount) int get aktualNominal;@JsonKey(fromJson: parseJsonMoneyAmount) int get selisih;/// `null` when `rencanaNominal` is 0 (division by zero on the server).
@JsonKey(fromJson: parseJsonDoubleOrStringNullable) double? get selisihPersen; bool get overBudget;
/// Create a copy of BudgetVsActualItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetVsActualItemCopyWith<BudgetVsActualItem> get copyWith => _$BudgetVsActualItemCopyWithImpl<BudgetVsActualItem>(this as BudgetVsActualItem, _$identity);

  /// Serializes this BudgetVsActualItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetVsActualItem&&(identical(other.kategori, kategori) || other.kategori == kategori)&&(identical(other.rencanaNominal, rencanaNominal) || other.rencanaNominal == rencanaNominal)&&(identical(other.aktualNominal, aktualNominal) || other.aktualNominal == aktualNominal)&&(identical(other.selisih, selisih) || other.selisih == selisih)&&(identical(other.selisihPersen, selisihPersen) || other.selisihPersen == selisihPersen)&&(identical(other.overBudget, overBudget) || other.overBudget == overBudget));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kategori,rencanaNominal,aktualNominal,selisih,selisihPersen,overBudget);

@override
String toString() {
  return 'BudgetVsActualItem(kategori: $kategori, rencanaNominal: $rencanaNominal, aktualNominal: $aktualNominal, selisih: $selisih, selisihPersen: $selisihPersen, overBudget: $overBudget)';
}


}

/// @nodoc
abstract mixin class $BudgetVsActualItemCopyWith<$Res>  {
  factory $BudgetVsActualItemCopyWith(BudgetVsActualItem value, $Res Function(BudgetVsActualItem) _then) = _$BudgetVsActualItemCopyWithImpl;
@useResult
$Res call({
 String kategori,@JsonKey(fromJson: parseJsonMoneyAmount) int rencanaNominal,@JsonKey(fromJson: parseJsonMoneyAmount) int aktualNominal,@JsonKey(fromJson: parseJsonMoneyAmount) int selisih,@JsonKey(fromJson: parseJsonDoubleOrStringNullable) double? selisihPersen, bool overBudget
});




}
/// @nodoc
class _$BudgetVsActualItemCopyWithImpl<$Res>
    implements $BudgetVsActualItemCopyWith<$Res> {
  _$BudgetVsActualItemCopyWithImpl(this._self, this._then);

  final BudgetVsActualItem _self;
  final $Res Function(BudgetVsActualItem) _then;

/// Create a copy of BudgetVsActualItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kategori = null,Object? rencanaNominal = null,Object? aktualNominal = null,Object? selisih = null,Object? selisihPersen = freezed,Object? overBudget = null,}) {
  return _then(_self.copyWith(
kategori: null == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String,rencanaNominal: null == rencanaNominal ? _self.rencanaNominal : rencanaNominal // ignore: cast_nullable_to_non_nullable
as int,aktualNominal: null == aktualNominal ? _self.aktualNominal : aktualNominal // ignore: cast_nullable_to_non_nullable
as int,selisih: null == selisih ? _self.selisih : selisih // ignore: cast_nullable_to_non_nullable
as int,selisihPersen: freezed == selisihPersen ? _self.selisihPersen : selisihPersen // ignore: cast_nullable_to_non_nullable
as double?,overBudget: null == overBudget ? _self.overBudget : overBudget // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetVsActualItem].
extension BudgetVsActualItemPatterns on BudgetVsActualItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetVsActualItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetVsActualItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetVsActualItem value)  $default,){
final _that = this;
switch (_that) {
case _BudgetVsActualItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetVsActualItem value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetVsActualItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String kategori, @JsonKey(fromJson: parseJsonMoneyAmount)  int rencanaNominal, @JsonKey(fromJson: parseJsonMoneyAmount)  int aktualNominal, @JsonKey(fromJson: parseJsonMoneyAmount)  int selisih, @JsonKey(fromJson: parseJsonDoubleOrStringNullable)  double? selisihPersen,  bool overBudget)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetVsActualItem() when $default != null:
return $default(_that.kategori,_that.rencanaNominal,_that.aktualNominal,_that.selisih,_that.selisihPersen,_that.overBudget);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String kategori, @JsonKey(fromJson: parseJsonMoneyAmount)  int rencanaNominal, @JsonKey(fromJson: parseJsonMoneyAmount)  int aktualNominal, @JsonKey(fromJson: parseJsonMoneyAmount)  int selisih, @JsonKey(fromJson: parseJsonDoubleOrStringNullable)  double? selisihPersen,  bool overBudget)  $default,) {final _that = this;
switch (_that) {
case _BudgetVsActualItem():
return $default(_that.kategori,_that.rencanaNominal,_that.aktualNominal,_that.selisih,_that.selisihPersen,_that.overBudget);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String kategori, @JsonKey(fromJson: parseJsonMoneyAmount)  int rencanaNominal, @JsonKey(fromJson: parseJsonMoneyAmount)  int aktualNominal, @JsonKey(fromJson: parseJsonMoneyAmount)  int selisih, @JsonKey(fromJson: parseJsonDoubleOrStringNullable)  double? selisihPersen,  bool overBudget)?  $default,) {final _that = this;
switch (_that) {
case _BudgetVsActualItem() when $default != null:
return $default(_that.kategori,_that.rencanaNominal,_that.aktualNominal,_that.selisih,_that.selisihPersen,_that.overBudget);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BudgetVsActualItem implements BudgetVsActualItem {
  const _BudgetVsActualItem({required this.kategori, @JsonKey(fromJson: parseJsonMoneyAmount) required this.rencanaNominal, @JsonKey(fromJson: parseJsonMoneyAmount) required this.aktualNominal, @JsonKey(fromJson: parseJsonMoneyAmount) required this.selisih, @JsonKey(fromJson: parseJsonDoubleOrStringNullable) this.selisihPersen, required this.overBudget});
  factory _BudgetVsActualItem.fromJson(Map<String, dynamic> json) => _$BudgetVsActualItemFromJson(json);

@override final  String kategori;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int rencanaNominal;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int aktualNominal;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int selisih;
/// `null` when `rencanaNominal` is 0 (division by zero on the server).
@override@JsonKey(fromJson: parseJsonDoubleOrStringNullable) final  double? selisihPersen;
@override final  bool overBudget;

/// Create a copy of BudgetVsActualItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetVsActualItemCopyWith<_BudgetVsActualItem> get copyWith => __$BudgetVsActualItemCopyWithImpl<_BudgetVsActualItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BudgetVsActualItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetVsActualItem&&(identical(other.kategori, kategori) || other.kategori == kategori)&&(identical(other.rencanaNominal, rencanaNominal) || other.rencanaNominal == rencanaNominal)&&(identical(other.aktualNominal, aktualNominal) || other.aktualNominal == aktualNominal)&&(identical(other.selisih, selisih) || other.selisih == selisih)&&(identical(other.selisihPersen, selisihPersen) || other.selisihPersen == selisihPersen)&&(identical(other.overBudget, overBudget) || other.overBudget == overBudget));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kategori,rencanaNominal,aktualNominal,selisih,selisihPersen,overBudget);

@override
String toString() {
  return 'BudgetVsActualItem(kategori: $kategori, rencanaNominal: $rencanaNominal, aktualNominal: $aktualNominal, selisih: $selisih, selisihPersen: $selisihPersen, overBudget: $overBudget)';
}


}

/// @nodoc
abstract mixin class _$BudgetVsActualItemCopyWith<$Res> implements $BudgetVsActualItemCopyWith<$Res> {
  factory _$BudgetVsActualItemCopyWith(_BudgetVsActualItem value, $Res Function(_BudgetVsActualItem) _then) = __$BudgetVsActualItemCopyWithImpl;
@override @useResult
$Res call({
 String kategori,@JsonKey(fromJson: parseJsonMoneyAmount) int rencanaNominal,@JsonKey(fromJson: parseJsonMoneyAmount) int aktualNominal,@JsonKey(fromJson: parseJsonMoneyAmount) int selisih,@JsonKey(fromJson: parseJsonDoubleOrStringNullable) double? selisihPersen, bool overBudget
});




}
/// @nodoc
class __$BudgetVsActualItemCopyWithImpl<$Res>
    implements _$BudgetVsActualItemCopyWith<$Res> {
  __$BudgetVsActualItemCopyWithImpl(this._self, this._then);

  final _BudgetVsActualItem _self;
  final $Res Function(_BudgetVsActualItem) _then;

/// Create a copy of BudgetVsActualItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kategori = null,Object? rencanaNominal = null,Object? aktualNominal = null,Object? selisih = null,Object? selisihPersen = freezed,Object? overBudget = null,}) {
  return _then(_BudgetVsActualItem(
kategori: null == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String,rencanaNominal: null == rencanaNominal ? _self.rencanaNominal : rencanaNominal // ignore: cast_nullable_to_non_nullable
as int,aktualNominal: null == aktualNominal ? _self.aktualNominal : aktualNominal // ignore: cast_nullable_to_non_nullable
as int,selisih: null == selisih ? _self.selisih : selisih // ignore: cast_nullable_to_non_nullable
as int,selisihPersen: freezed == selisihPersen ? _self.selisihPersen : selisihPersen // ignore: cast_nullable_to_non_nullable
as double?,overBudget: null == overBudget ? _self.overBudget : overBudget // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$BudgetVsActual {

@JsonKey(fromJson: parseJsonInt) int get wealthLevel; bool get hasPlan;/// `null` when the user has no financial data yet (`wealthLevel: -1`).
 BudgetVsActualPendapatan? get pendapatan; List<BudgetVsActualItem> get alokasi;
/// Create a copy of BudgetVsActual
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetVsActualCopyWith<BudgetVsActual> get copyWith => _$BudgetVsActualCopyWithImpl<BudgetVsActual>(this as BudgetVsActual, _$identity);

  /// Serializes this BudgetVsActual to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetVsActual&&(identical(other.wealthLevel, wealthLevel) || other.wealthLevel == wealthLevel)&&(identical(other.hasPlan, hasPlan) || other.hasPlan == hasPlan)&&(identical(other.pendapatan, pendapatan) || other.pendapatan == pendapatan)&&const DeepCollectionEquality().equals(other.alokasi, alokasi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wealthLevel,hasPlan,pendapatan,const DeepCollectionEquality().hash(alokasi));

@override
String toString() {
  return 'BudgetVsActual(wealthLevel: $wealthLevel, hasPlan: $hasPlan, pendapatan: $pendapatan, alokasi: $alokasi)';
}


}

/// @nodoc
abstract mixin class $BudgetVsActualCopyWith<$Res>  {
  factory $BudgetVsActualCopyWith(BudgetVsActual value, $Res Function(BudgetVsActual) _then) = _$BudgetVsActualCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: parseJsonInt) int wealthLevel, bool hasPlan, BudgetVsActualPendapatan? pendapatan, List<BudgetVsActualItem> alokasi
});


$BudgetVsActualPendapatanCopyWith<$Res>? get pendapatan;

}
/// @nodoc
class _$BudgetVsActualCopyWithImpl<$Res>
    implements $BudgetVsActualCopyWith<$Res> {
  _$BudgetVsActualCopyWithImpl(this._self, this._then);

  final BudgetVsActual _self;
  final $Res Function(BudgetVsActual) _then;

/// Create a copy of BudgetVsActual
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wealthLevel = null,Object? hasPlan = null,Object? pendapatan = freezed,Object? alokasi = null,}) {
  return _then(_self.copyWith(
wealthLevel: null == wealthLevel ? _self.wealthLevel : wealthLevel // ignore: cast_nullable_to_non_nullable
as int,hasPlan: null == hasPlan ? _self.hasPlan : hasPlan // ignore: cast_nullable_to_non_nullable
as bool,pendapatan: freezed == pendapatan ? _self.pendapatan : pendapatan // ignore: cast_nullable_to_non_nullable
as BudgetVsActualPendapatan?,alokasi: null == alokasi ? _self.alokasi : alokasi // ignore: cast_nullable_to_non_nullable
as List<BudgetVsActualItem>,
  ));
}
/// Create a copy of BudgetVsActual
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetVsActualPendapatanCopyWith<$Res>? get pendapatan {
    if (_self.pendapatan == null) {
    return null;
  }

  return $BudgetVsActualPendapatanCopyWith<$Res>(_self.pendapatan!, (value) {
    return _then(_self.copyWith(pendapatan: value));
  });
}
}


/// Adds pattern-matching-related methods to [BudgetVsActual].
extension BudgetVsActualPatterns on BudgetVsActual {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetVsActual value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetVsActual() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetVsActual value)  $default,){
final _that = this;
switch (_that) {
case _BudgetVsActual():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetVsActual value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetVsActual() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonInt)  int wealthLevel,  bool hasPlan,  BudgetVsActualPendapatan? pendapatan,  List<BudgetVsActualItem> alokasi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetVsActual() when $default != null:
return $default(_that.wealthLevel,_that.hasPlan,_that.pendapatan,_that.alokasi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonInt)  int wealthLevel,  bool hasPlan,  BudgetVsActualPendapatan? pendapatan,  List<BudgetVsActualItem> alokasi)  $default,) {final _that = this;
switch (_that) {
case _BudgetVsActual():
return $default(_that.wealthLevel,_that.hasPlan,_that.pendapatan,_that.alokasi);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: parseJsonInt)  int wealthLevel,  bool hasPlan,  BudgetVsActualPendapatan? pendapatan,  List<BudgetVsActualItem> alokasi)?  $default,) {final _that = this;
switch (_that) {
case _BudgetVsActual() when $default != null:
return $default(_that.wealthLevel,_that.hasPlan,_that.pendapatan,_that.alokasi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BudgetVsActual extends BudgetVsActual {
  const _BudgetVsActual({@JsonKey(fromJson: parseJsonInt) required this.wealthLevel, required this.hasPlan, this.pendapatan, final  List<BudgetVsActualItem> alokasi = const []}): _alokasi = alokasi,super._();
  factory _BudgetVsActual.fromJson(Map<String, dynamic> json) => _$BudgetVsActualFromJson(json);

@override@JsonKey(fromJson: parseJsonInt) final  int wealthLevel;
@override final  bool hasPlan;
/// `null` when the user has no financial data yet (`wealthLevel: -1`).
@override final  BudgetVsActualPendapatan? pendapatan;
 final  List<BudgetVsActualItem> _alokasi;
@override@JsonKey() List<BudgetVsActualItem> get alokasi {
  if (_alokasi is EqualUnmodifiableListView) return _alokasi;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alokasi);
}


/// Create a copy of BudgetVsActual
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetVsActualCopyWith<_BudgetVsActual> get copyWith => __$BudgetVsActualCopyWithImpl<_BudgetVsActual>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BudgetVsActualToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetVsActual&&(identical(other.wealthLevel, wealthLevel) || other.wealthLevel == wealthLevel)&&(identical(other.hasPlan, hasPlan) || other.hasPlan == hasPlan)&&(identical(other.pendapatan, pendapatan) || other.pendapatan == pendapatan)&&const DeepCollectionEquality().equals(other._alokasi, _alokasi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wealthLevel,hasPlan,pendapatan,const DeepCollectionEquality().hash(_alokasi));

@override
String toString() {
  return 'BudgetVsActual(wealthLevel: $wealthLevel, hasPlan: $hasPlan, pendapatan: $pendapatan, alokasi: $alokasi)';
}


}

/// @nodoc
abstract mixin class _$BudgetVsActualCopyWith<$Res> implements $BudgetVsActualCopyWith<$Res> {
  factory _$BudgetVsActualCopyWith(_BudgetVsActual value, $Res Function(_BudgetVsActual) _then) = __$BudgetVsActualCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: parseJsonInt) int wealthLevel, bool hasPlan, BudgetVsActualPendapatan? pendapatan, List<BudgetVsActualItem> alokasi
});


@override $BudgetVsActualPendapatanCopyWith<$Res>? get pendapatan;

}
/// @nodoc
class __$BudgetVsActualCopyWithImpl<$Res>
    implements _$BudgetVsActualCopyWith<$Res> {
  __$BudgetVsActualCopyWithImpl(this._self, this._then);

  final _BudgetVsActual _self;
  final $Res Function(_BudgetVsActual) _then;

/// Create a copy of BudgetVsActual
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wealthLevel = null,Object? hasPlan = null,Object? pendapatan = freezed,Object? alokasi = null,}) {
  return _then(_BudgetVsActual(
wealthLevel: null == wealthLevel ? _self.wealthLevel : wealthLevel // ignore: cast_nullable_to_non_nullable
as int,hasPlan: null == hasPlan ? _self.hasPlan : hasPlan // ignore: cast_nullable_to_non_nullable
as bool,pendapatan: freezed == pendapatan ? _self.pendapatan : pendapatan // ignore: cast_nullable_to_non_nullable
as BudgetVsActualPendapatan?,alokasi: null == alokasi ? _self._alokasi : alokasi // ignore: cast_nullable_to_non_nullable
as List<BudgetVsActualItem>,
  ));
}

/// Create a copy of BudgetVsActual
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetVsActualPendapatanCopyWith<$Res>? get pendapatan {
    if (_self.pendapatan == null) {
    return null;
  }

  return $BudgetVsActualPendapatanCopyWith<$Res>(_self.pendapatan!, (value) {
    return _then(_self.copyWith(pendapatan: value));
  });
}
}

// dart format on
