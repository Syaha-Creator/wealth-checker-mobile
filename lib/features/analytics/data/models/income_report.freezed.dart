// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncomeItem {

 String get kategori;@JsonKey(fromJson: parseJsonMoneyAmount) int get total;@JsonKey(fromJson: parseJsonDoubleOrString) double get persentaseDariTotal; bool get isTerbesar;
/// Create a copy of IncomeItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomeItemCopyWith<IncomeItem> get copyWith => _$IncomeItemCopyWithImpl<IncomeItem>(this as IncomeItem, _$identity);

  /// Serializes this IncomeItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomeItem&&(identical(other.kategori, kategori) || other.kategori == kategori)&&(identical(other.total, total) || other.total == total)&&(identical(other.persentaseDariTotal, persentaseDariTotal) || other.persentaseDariTotal == persentaseDariTotal)&&(identical(other.isTerbesar, isTerbesar) || other.isTerbesar == isTerbesar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kategori,total,persentaseDariTotal,isTerbesar);

@override
String toString() {
  return 'IncomeItem(kategori: $kategori, total: $total, persentaseDariTotal: $persentaseDariTotal, isTerbesar: $isTerbesar)';
}


}

/// @nodoc
abstract mixin class $IncomeItemCopyWith<$Res>  {
  factory $IncomeItemCopyWith(IncomeItem value, $Res Function(IncomeItem) _then) = _$IncomeItemCopyWithImpl;
@useResult
$Res call({
 String kategori,@JsonKey(fromJson: parseJsonMoneyAmount) int total,@JsonKey(fromJson: parseJsonDoubleOrString) double persentaseDariTotal, bool isTerbesar
});




}
/// @nodoc
class _$IncomeItemCopyWithImpl<$Res>
    implements $IncomeItemCopyWith<$Res> {
  _$IncomeItemCopyWithImpl(this._self, this._then);

  final IncomeItem _self;
  final $Res Function(IncomeItem) _then;

/// Create a copy of IncomeItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kategori = null,Object? total = null,Object? persentaseDariTotal = null,Object? isTerbesar = null,}) {
  return _then(_self.copyWith(
kategori: null == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,persentaseDariTotal: null == persentaseDariTotal ? _self.persentaseDariTotal : persentaseDariTotal // ignore: cast_nullable_to_non_nullable
as double,isTerbesar: null == isTerbesar ? _self.isTerbesar : isTerbesar // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [IncomeItem].
extension IncomeItemPatterns on IncomeItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomeItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomeItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomeItem value)  $default,){
final _that = this;
switch (_that) {
case _IncomeItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomeItem value)?  $default,){
final _that = this;
switch (_that) {
case _IncomeItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String kategori, @JsonKey(fromJson: parseJsonMoneyAmount)  int total, @JsonKey(fromJson: parseJsonDoubleOrString)  double persentaseDariTotal,  bool isTerbesar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomeItem() when $default != null:
return $default(_that.kategori,_that.total,_that.persentaseDariTotal,_that.isTerbesar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String kategori, @JsonKey(fromJson: parseJsonMoneyAmount)  int total, @JsonKey(fromJson: parseJsonDoubleOrString)  double persentaseDariTotal,  bool isTerbesar)  $default,) {final _that = this;
switch (_that) {
case _IncomeItem():
return $default(_that.kategori,_that.total,_that.persentaseDariTotal,_that.isTerbesar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String kategori, @JsonKey(fromJson: parseJsonMoneyAmount)  int total, @JsonKey(fromJson: parseJsonDoubleOrString)  double persentaseDariTotal,  bool isTerbesar)?  $default,) {final _that = this;
switch (_that) {
case _IncomeItem() when $default != null:
return $default(_that.kategori,_that.total,_that.persentaseDariTotal,_that.isTerbesar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncomeItem implements IncomeItem {
  const _IncomeItem({required this.kategori, @JsonKey(fromJson: parseJsonMoneyAmount) required this.total, @JsonKey(fromJson: parseJsonDoubleOrString) required this.persentaseDariTotal, required this.isTerbesar});
  factory _IncomeItem.fromJson(Map<String, dynamic> json) => _$IncomeItemFromJson(json);

@override final  String kategori;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int total;
@override@JsonKey(fromJson: parseJsonDoubleOrString) final  double persentaseDariTotal;
@override final  bool isTerbesar;

/// Create a copy of IncomeItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomeItemCopyWith<_IncomeItem> get copyWith => __$IncomeItemCopyWithImpl<_IncomeItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncomeItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomeItem&&(identical(other.kategori, kategori) || other.kategori == kategori)&&(identical(other.total, total) || other.total == total)&&(identical(other.persentaseDariTotal, persentaseDariTotal) || other.persentaseDariTotal == persentaseDariTotal)&&(identical(other.isTerbesar, isTerbesar) || other.isTerbesar == isTerbesar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kategori,total,persentaseDariTotal,isTerbesar);

@override
String toString() {
  return 'IncomeItem(kategori: $kategori, total: $total, persentaseDariTotal: $persentaseDariTotal, isTerbesar: $isTerbesar)';
}


}

/// @nodoc
abstract mixin class _$IncomeItemCopyWith<$Res> implements $IncomeItemCopyWith<$Res> {
  factory _$IncomeItemCopyWith(_IncomeItem value, $Res Function(_IncomeItem) _then) = __$IncomeItemCopyWithImpl;
@override @useResult
$Res call({
 String kategori,@JsonKey(fromJson: parseJsonMoneyAmount) int total,@JsonKey(fromJson: parseJsonDoubleOrString) double persentaseDariTotal, bool isTerbesar
});




}
/// @nodoc
class __$IncomeItemCopyWithImpl<$Res>
    implements _$IncomeItemCopyWith<$Res> {
  __$IncomeItemCopyWithImpl(this._self, this._then);

  final _IncomeItem _self;
  final $Res Function(_IncomeItem) _then;

/// Create a copy of IncomeItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kategori = null,Object? total = null,Object? persentaseDariTotal = null,Object? isTerbesar = null,}) {
  return _then(_IncomeItem(
kategori: null == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,persentaseDariTotal: null == persentaseDariTotal ? _self.persentaseDariTotal : persentaseDariTotal // ignore: cast_nullable_to_non_nullable
as double,isTerbesar: null == isTerbesar ? _self.isTerbesar : isTerbesar // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$IncomeReport {

 List<IncomeItem> get items;@JsonKey(fromJson: parseJsonMoneyAmount) int get grandTotal;
/// Create a copy of IncomeReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomeReportCopyWith<IncomeReport> get copyWith => _$IncomeReportCopyWithImpl<IncomeReport>(this as IncomeReport, _$identity);

  /// Serializes this IncomeReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomeReport&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),grandTotal);

@override
String toString() {
  return 'IncomeReport(items: $items, grandTotal: $grandTotal)';
}


}

/// @nodoc
abstract mixin class $IncomeReportCopyWith<$Res>  {
  factory $IncomeReportCopyWith(IncomeReport value, $Res Function(IncomeReport) _then) = _$IncomeReportCopyWithImpl;
@useResult
$Res call({
 List<IncomeItem> items,@JsonKey(fromJson: parseJsonMoneyAmount) int grandTotal
});




}
/// @nodoc
class _$IncomeReportCopyWithImpl<$Res>
    implements $IncomeReportCopyWith<$Res> {
  _$IncomeReportCopyWithImpl(this._self, this._then);

  final IncomeReport _self;
  final $Res Function(IncomeReport) _then;

/// Create a copy of IncomeReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? grandTotal = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<IncomeItem>,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IncomeReport].
extension IncomeReportPatterns on IncomeReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomeReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomeReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomeReport value)  $default,){
final _that = this;
switch (_that) {
case _IncomeReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomeReport value)?  $default,){
final _that = this;
switch (_that) {
case _IncomeReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<IncomeItem> items, @JsonKey(fromJson: parseJsonMoneyAmount)  int grandTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomeReport() when $default != null:
return $default(_that.items,_that.grandTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<IncomeItem> items, @JsonKey(fromJson: parseJsonMoneyAmount)  int grandTotal)  $default,) {final _that = this;
switch (_that) {
case _IncomeReport():
return $default(_that.items,_that.grandTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<IncomeItem> items, @JsonKey(fromJson: parseJsonMoneyAmount)  int grandTotal)?  $default,) {final _that = this;
switch (_that) {
case _IncomeReport() when $default != null:
return $default(_that.items,_that.grandTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncomeReport implements IncomeReport {
  const _IncomeReport({final  List<IncomeItem> items = const [], @JsonKey(fromJson: parseJsonMoneyAmount) required this.grandTotal}): _items = items;
  factory _IncomeReport.fromJson(Map<String, dynamic> json) => _$IncomeReportFromJson(json);

 final  List<IncomeItem> _items;
@override@JsonKey() List<IncomeItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int grandTotal;

/// Create a copy of IncomeReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomeReportCopyWith<_IncomeReport> get copyWith => __$IncomeReportCopyWithImpl<_IncomeReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncomeReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomeReport&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),grandTotal);

@override
String toString() {
  return 'IncomeReport(items: $items, grandTotal: $grandTotal)';
}


}

/// @nodoc
abstract mixin class _$IncomeReportCopyWith<$Res> implements $IncomeReportCopyWith<$Res> {
  factory _$IncomeReportCopyWith(_IncomeReport value, $Res Function(_IncomeReport) _then) = __$IncomeReportCopyWithImpl;
@override @useResult
$Res call({
 List<IncomeItem> items,@JsonKey(fromJson: parseJsonMoneyAmount) int grandTotal
});




}
/// @nodoc
class __$IncomeReportCopyWithImpl<$Res>
    implements _$IncomeReportCopyWith<$Res> {
  __$IncomeReportCopyWithImpl(this._self, this._then);

  final _IncomeReport _self;
  final $Res Function(_IncomeReport) _then;

/// Create a copy of IncomeReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? grandTotal = null,}) {
  return _then(_IncomeReport(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<IncomeItem>,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
