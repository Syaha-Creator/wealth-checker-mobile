// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_categories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionCategories {

 List<String> get pendapatan; List<String> get pengeluaran;
/// Create a copy of TransactionCategories
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCategoriesCopyWith<TransactionCategories> get copyWith => _$TransactionCategoriesCopyWithImpl<TransactionCategories>(this as TransactionCategories, _$identity);

  /// Serializes this TransactionCategories to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionCategories&&const DeepCollectionEquality().equals(other.pendapatan, pendapatan)&&const DeepCollectionEquality().equals(other.pengeluaran, pengeluaran));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pendapatan),const DeepCollectionEquality().hash(pengeluaran));

@override
String toString() {
  return 'TransactionCategories(pendapatan: $pendapatan, pengeluaran: $pengeluaran)';
}


}

/// @nodoc
abstract mixin class $TransactionCategoriesCopyWith<$Res>  {
  factory $TransactionCategoriesCopyWith(TransactionCategories value, $Res Function(TransactionCategories) _then) = _$TransactionCategoriesCopyWithImpl;
@useResult
$Res call({
 List<String> pendapatan, List<String> pengeluaran
});




}
/// @nodoc
class _$TransactionCategoriesCopyWithImpl<$Res>
    implements $TransactionCategoriesCopyWith<$Res> {
  _$TransactionCategoriesCopyWithImpl(this._self, this._then);

  final TransactionCategories _self;
  final $Res Function(TransactionCategories) _then;

/// Create a copy of TransactionCategories
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pendapatan = null,Object? pengeluaran = null,}) {
  return _then(_self.copyWith(
pendapatan: null == pendapatan ? _self.pendapatan : pendapatan // ignore: cast_nullable_to_non_nullable
as List<String>,pengeluaran: null == pengeluaran ? _self.pengeluaran : pengeluaran // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionCategories].
extension TransactionCategoriesPatterns on TransactionCategories {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionCategories value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionCategories() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionCategories value)  $default,){
final _that = this;
switch (_that) {
case _TransactionCategories():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionCategories value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionCategories() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> pendapatan,  List<String> pengeluaran)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionCategories() when $default != null:
return $default(_that.pendapatan,_that.pengeluaran);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> pendapatan,  List<String> pengeluaran)  $default,) {final _that = this;
switch (_that) {
case _TransactionCategories():
return $default(_that.pendapatan,_that.pengeluaran);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> pendapatan,  List<String> pengeluaran)?  $default,) {final _that = this;
switch (_that) {
case _TransactionCategories() when $default != null:
return $default(_that.pendapatan,_that.pengeluaran);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionCategories extends TransactionCategories {
  const _TransactionCategories({final  List<String> pendapatan = const [], final  List<String> pengeluaran = const []}): _pendapatan = pendapatan,_pengeluaran = pengeluaran,super._();
  factory _TransactionCategories.fromJson(Map<String, dynamic> json) => _$TransactionCategoriesFromJson(json);

 final  List<String> _pendapatan;
@override@JsonKey() List<String> get pendapatan {
  if (_pendapatan is EqualUnmodifiableListView) return _pendapatan;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendapatan);
}

 final  List<String> _pengeluaran;
@override@JsonKey() List<String> get pengeluaran {
  if (_pengeluaran is EqualUnmodifiableListView) return _pengeluaran;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pengeluaran);
}


/// Create a copy of TransactionCategories
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCategoriesCopyWith<_TransactionCategories> get copyWith => __$TransactionCategoriesCopyWithImpl<_TransactionCategories>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionCategoriesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionCategories&&const DeepCollectionEquality().equals(other._pendapatan, _pendapatan)&&const DeepCollectionEquality().equals(other._pengeluaran, _pengeluaran));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pendapatan),const DeepCollectionEquality().hash(_pengeluaran));

@override
String toString() {
  return 'TransactionCategories(pendapatan: $pendapatan, pengeluaran: $pengeluaran)';
}


}

/// @nodoc
abstract mixin class _$TransactionCategoriesCopyWith<$Res> implements $TransactionCategoriesCopyWith<$Res> {
  factory _$TransactionCategoriesCopyWith(_TransactionCategories value, $Res Function(_TransactionCategories) _then) = __$TransactionCategoriesCopyWithImpl;
@override @useResult
$Res call({
 List<String> pendapatan, List<String> pengeluaran
});




}
/// @nodoc
class __$TransactionCategoriesCopyWithImpl<$Res>
    implements _$TransactionCategoriesCopyWith<$Res> {
  __$TransactionCategoriesCopyWithImpl(this._self, this._then);

  final _TransactionCategories _self;
  final $Res Function(_TransactionCategories) _then;

/// Create a copy of TransactionCategories
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pendapatan = null,Object? pengeluaran = null,}) {
  return _then(_TransactionCategories(
pendapatan: null == pendapatan ? _self._pendapatan : pendapatan // ignore: cast_nullable_to_non_nullable
as List<String>,pengeluaran: null == pengeluaran ? _self._pengeluaran : pengeluaran // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
