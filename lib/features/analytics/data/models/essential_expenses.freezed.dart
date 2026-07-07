// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'essential_expenses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EssentialExpenseRincian {

 String get rincian;@JsonKey(fromJson: parseJsonMoneyAmount) int get total;
/// Create a copy of EssentialExpenseRincian
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EssentialExpenseRincianCopyWith<EssentialExpenseRincian> get copyWith => _$EssentialExpenseRincianCopyWithImpl<EssentialExpenseRincian>(this as EssentialExpenseRincian, _$identity);

  /// Serializes this EssentialExpenseRincian to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EssentialExpenseRincian&&(identical(other.rincian, rincian) || other.rincian == rincian)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rincian,total);

@override
String toString() {
  return 'EssentialExpenseRincian(rincian: $rincian, total: $total)';
}


}

/// @nodoc
abstract mixin class $EssentialExpenseRincianCopyWith<$Res>  {
  factory $EssentialExpenseRincianCopyWith(EssentialExpenseRincian value, $Res Function(EssentialExpenseRincian) _then) = _$EssentialExpenseRincianCopyWithImpl;
@useResult
$Res call({
 String rincian,@JsonKey(fromJson: parseJsonMoneyAmount) int total
});




}
/// @nodoc
class _$EssentialExpenseRincianCopyWithImpl<$Res>
    implements $EssentialExpenseRincianCopyWith<$Res> {
  _$EssentialExpenseRincianCopyWithImpl(this._self, this._then);

  final EssentialExpenseRincian _self;
  final $Res Function(EssentialExpenseRincian) _then;

/// Create a copy of EssentialExpenseRincian
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rincian = null,Object? total = null,}) {
  return _then(_self.copyWith(
rincian: null == rincian ? _self.rincian : rincian // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EssentialExpenseRincian].
extension EssentialExpenseRincianPatterns on EssentialExpenseRincian {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EssentialExpenseRincian value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EssentialExpenseRincian() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EssentialExpenseRincian value)  $default,){
final _that = this;
switch (_that) {
case _EssentialExpenseRincian():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EssentialExpenseRincian value)?  $default,){
final _that = this;
switch (_that) {
case _EssentialExpenseRincian() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String rincian, @JsonKey(fromJson: parseJsonMoneyAmount)  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EssentialExpenseRincian() when $default != null:
return $default(_that.rincian,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String rincian, @JsonKey(fromJson: parseJsonMoneyAmount)  int total)  $default,) {final _that = this;
switch (_that) {
case _EssentialExpenseRincian():
return $default(_that.rincian,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String rincian, @JsonKey(fromJson: parseJsonMoneyAmount)  int total)?  $default,) {final _that = this;
switch (_that) {
case _EssentialExpenseRincian() when $default != null:
return $default(_that.rincian,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EssentialExpenseRincian implements EssentialExpenseRincian {
  const _EssentialExpenseRincian({required this.rincian, @JsonKey(fromJson: parseJsonMoneyAmount) required this.total});
  factory _EssentialExpenseRincian.fromJson(Map<String, dynamic> json) => _$EssentialExpenseRincianFromJson(json);

@override final  String rincian;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int total;

/// Create a copy of EssentialExpenseRincian
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EssentialExpenseRincianCopyWith<_EssentialExpenseRincian> get copyWith => __$EssentialExpenseRincianCopyWithImpl<_EssentialExpenseRincian>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EssentialExpenseRincianToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EssentialExpenseRincian&&(identical(other.rincian, rincian) || other.rincian == rincian)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rincian,total);

@override
String toString() {
  return 'EssentialExpenseRincian(rincian: $rincian, total: $total)';
}


}

/// @nodoc
abstract mixin class _$EssentialExpenseRincianCopyWith<$Res> implements $EssentialExpenseRincianCopyWith<$Res> {
  factory _$EssentialExpenseRincianCopyWith(_EssentialExpenseRincian value, $Res Function(_EssentialExpenseRincian) _then) = __$EssentialExpenseRincianCopyWithImpl;
@override @useResult
$Res call({
 String rincian,@JsonKey(fromJson: parseJsonMoneyAmount) int total
});




}
/// @nodoc
class __$EssentialExpenseRincianCopyWithImpl<$Res>
    implements _$EssentialExpenseRincianCopyWith<$Res> {
  __$EssentialExpenseRincianCopyWithImpl(this._self, this._then);

  final _EssentialExpenseRincian _self;
  final $Res Function(_EssentialExpenseRincian) _then;

/// Create a copy of EssentialExpenseRincian
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rincian = null,Object? total = null,}) {
  return _then(_EssentialExpenseRincian(
rincian: null == rincian ? _self.rincian : rincian // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$EssentialExpenseItem {

 String get kategori; List<EssentialExpenseRincian> get rincianList;@JsonKey(fromJson: parseJsonMoneyAmount) int get subtotal;
/// Create a copy of EssentialExpenseItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EssentialExpenseItemCopyWith<EssentialExpenseItem> get copyWith => _$EssentialExpenseItemCopyWithImpl<EssentialExpenseItem>(this as EssentialExpenseItem, _$identity);

  /// Serializes this EssentialExpenseItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EssentialExpenseItem&&(identical(other.kategori, kategori) || other.kategori == kategori)&&const DeepCollectionEquality().equals(other.rincianList, rincianList)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kategori,const DeepCollectionEquality().hash(rincianList),subtotal);

@override
String toString() {
  return 'EssentialExpenseItem(kategori: $kategori, rincianList: $rincianList, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class $EssentialExpenseItemCopyWith<$Res>  {
  factory $EssentialExpenseItemCopyWith(EssentialExpenseItem value, $Res Function(EssentialExpenseItem) _then) = _$EssentialExpenseItemCopyWithImpl;
@useResult
$Res call({
 String kategori, List<EssentialExpenseRincian> rincianList,@JsonKey(fromJson: parseJsonMoneyAmount) int subtotal
});




}
/// @nodoc
class _$EssentialExpenseItemCopyWithImpl<$Res>
    implements $EssentialExpenseItemCopyWith<$Res> {
  _$EssentialExpenseItemCopyWithImpl(this._self, this._then);

  final EssentialExpenseItem _self;
  final $Res Function(EssentialExpenseItem) _then;

/// Create a copy of EssentialExpenseItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kategori = null,Object? rincianList = null,Object? subtotal = null,}) {
  return _then(_self.copyWith(
kategori: null == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String,rincianList: null == rincianList ? _self.rincianList : rincianList // ignore: cast_nullable_to_non_nullable
as List<EssentialExpenseRincian>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EssentialExpenseItem].
extension EssentialExpenseItemPatterns on EssentialExpenseItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EssentialExpenseItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EssentialExpenseItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EssentialExpenseItem value)  $default,){
final _that = this;
switch (_that) {
case _EssentialExpenseItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EssentialExpenseItem value)?  $default,){
final _that = this;
switch (_that) {
case _EssentialExpenseItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String kategori,  List<EssentialExpenseRincian> rincianList, @JsonKey(fromJson: parseJsonMoneyAmount)  int subtotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EssentialExpenseItem() when $default != null:
return $default(_that.kategori,_that.rincianList,_that.subtotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String kategori,  List<EssentialExpenseRincian> rincianList, @JsonKey(fromJson: parseJsonMoneyAmount)  int subtotal)  $default,) {final _that = this;
switch (_that) {
case _EssentialExpenseItem():
return $default(_that.kategori,_that.rincianList,_that.subtotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String kategori,  List<EssentialExpenseRincian> rincianList, @JsonKey(fromJson: parseJsonMoneyAmount)  int subtotal)?  $default,) {final _that = this;
switch (_that) {
case _EssentialExpenseItem() when $default != null:
return $default(_that.kategori,_that.rincianList,_that.subtotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EssentialExpenseItem implements EssentialExpenseItem {
  const _EssentialExpenseItem({required this.kategori, final  List<EssentialExpenseRincian> rincianList = const [], @JsonKey(fromJson: parseJsonMoneyAmount) required this.subtotal}): _rincianList = rincianList;
  factory _EssentialExpenseItem.fromJson(Map<String, dynamic> json) => _$EssentialExpenseItemFromJson(json);

@override final  String kategori;
 final  List<EssentialExpenseRincian> _rincianList;
@override@JsonKey() List<EssentialExpenseRincian> get rincianList {
  if (_rincianList is EqualUnmodifiableListView) return _rincianList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rincianList);
}

@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int subtotal;

/// Create a copy of EssentialExpenseItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EssentialExpenseItemCopyWith<_EssentialExpenseItem> get copyWith => __$EssentialExpenseItemCopyWithImpl<_EssentialExpenseItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EssentialExpenseItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EssentialExpenseItem&&(identical(other.kategori, kategori) || other.kategori == kategori)&&const DeepCollectionEquality().equals(other._rincianList, _rincianList)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kategori,const DeepCollectionEquality().hash(_rincianList),subtotal);

@override
String toString() {
  return 'EssentialExpenseItem(kategori: $kategori, rincianList: $rincianList, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class _$EssentialExpenseItemCopyWith<$Res> implements $EssentialExpenseItemCopyWith<$Res> {
  factory _$EssentialExpenseItemCopyWith(_EssentialExpenseItem value, $Res Function(_EssentialExpenseItem) _then) = __$EssentialExpenseItemCopyWithImpl;
@override @useResult
$Res call({
 String kategori, List<EssentialExpenseRincian> rincianList,@JsonKey(fromJson: parseJsonMoneyAmount) int subtotal
});




}
/// @nodoc
class __$EssentialExpenseItemCopyWithImpl<$Res>
    implements _$EssentialExpenseItemCopyWith<$Res> {
  __$EssentialExpenseItemCopyWithImpl(this._self, this._then);

  final _EssentialExpenseItem _self;
  final $Res Function(_EssentialExpenseItem) _then;

/// Create a copy of EssentialExpenseItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kategori = null,Object? rincianList = null,Object? subtotal = null,}) {
  return _then(_EssentialExpenseItem(
kategori: null == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String,rincianList: null == rincianList ? _self._rincianList : rincianList // ignore: cast_nullable_to_non_nullable
as List<EssentialExpenseRincian>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$EssentialExpenses {

 List<String> get categories; List<EssentialExpenseItem> get items;@JsonKey(fromJson: parseJsonMoneyAmount) int get grandTotal;
/// Create a copy of EssentialExpenses
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EssentialExpensesCopyWith<EssentialExpenses> get copyWith => _$EssentialExpensesCopyWithImpl<EssentialExpenses>(this as EssentialExpenses, _$identity);

  /// Serializes this EssentialExpenses to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EssentialExpenses&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(items),grandTotal);

@override
String toString() {
  return 'EssentialExpenses(categories: $categories, items: $items, grandTotal: $grandTotal)';
}


}

/// @nodoc
abstract mixin class $EssentialExpensesCopyWith<$Res>  {
  factory $EssentialExpensesCopyWith(EssentialExpenses value, $Res Function(EssentialExpenses) _then) = _$EssentialExpensesCopyWithImpl;
@useResult
$Res call({
 List<String> categories, List<EssentialExpenseItem> items,@JsonKey(fromJson: parseJsonMoneyAmount) int grandTotal
});




}
/// @nodoc
class _$EssentialExpensesCopyWithImpl<$Res>
    implements $EssentialExpensesCopyWith<$Res> {
  _$EssentialExpensesCopyWithImpl(this._self, this._then);

  final EssentialExpenses _self;
  final $Res Function(EssentialExpenses) _then;

/// Create a copy of EssentialExpenses
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? items = null,Object? grandTotal = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<EssentialExpenseItem>,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EssentialExpenses].
extension EssentialExpensesPatterns on EssentialExpenses {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EssentialExpenses value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EssentialExpenses() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EssentialExpenses value)  $default,){
final _that = this;
switch (_that) {
case _EssentialExpenses():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EssentialExpenses value)?  $default,){
final _that = this;
switch (_that) {
case _EssentialExpenses() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> categories,  List<EssentialExpenseItem> items, @JsonKey(fromJson: parseJsonMoneyAmount)  int grandTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EssentialExpenses() when $default != null:
return $default(_that.categories,_that.items,_that.grandTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> categories,  List<EssentialExpenseItem> items, @JsonKey(fromJson: parseJsonMoneyAmount)  int grandTotal)  $default,) {final _that = this;
switch (_that) {
case _EssentialExpenses():
return $default(_that.categories,_that.items,_that.grandTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> categories,  List<EssentialExpenseItem> items, @JsonKey(fromJson: parseJsonMoneyAmount)  int grandTotal)?  $default,) {final _that = this;
switch (_that) {
case _EssentialExpenses() when $default != null:
return $default(_that.categories,_that.items,_that.grandTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EssentialExpenses implements EssentialExpenses {
  const _EssentialExpenses({final  List<String> categories = const [], final  List<EssentialExpenseItem> items = const [], @JsonKey(fromJson: parseJsonMoneyAmount) required this.grandTotal}): _categories = categories,_items = items;
  factory _EssentialExpenses.fromJson(Map<String, dynamic> json) => _$EssentialExpensesFromJson(json);

 final  List<String> _categories;
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<EssentialExpenseItem> _items;
@override@JsonKey() List<EssentialExpenseItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int grandTotal;

/// Create a copy of EssentialExpenses
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EssentialExpensesCopyWith<_EssentialExpenses> get copyWith => __$EssentialExpensesCopyWithImpl<_EssentialExpenses>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EssentialExpensesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EssentialExpenses&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_items),grandTotal);

@override
String toString() {
  return 'EssentialExpenses(categories: $categories, items: $items, grandTotal: $grandTotal)';
}


}

/// @nodoc
abstract mixin class _$EssentialExpensesCopyWith<$Res> implements $EssentialExpensesCopyWith<$Res> {
  factory _$EssentialExpensesCopyWith(_EssentialExpenses value, $Res Function(_EssentialExpenses) _then) = __$EssentialExpensesCopyWithImpl;
@override @useResult
$Res call({
 List<String> categories, List<EssentialExpenseItem> items,@JsonKey(fromJson: parseJsonMoneyAmount) int grandTotal
});




}
/// @nodoc
class __$EssentialExpensesCopyWithImpl<$Res>
    implements _$EssentialExpensesCopyWith<$Res> {
  __$EssentialExpensesCopyWithImpl(this._self, this._then);

  final _EssentialExpenses _self;
  final $Res Function(_EssentialExpenses) _then;

/// Create a copy of EssentialExpenses
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? items = null,Object? grandTotal = null,}) {
  return _then(_EssentialExpenses(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<EssentialExpenseItem>,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
