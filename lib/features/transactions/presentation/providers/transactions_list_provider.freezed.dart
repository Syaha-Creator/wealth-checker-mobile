// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionsFilter {

 DateTime? get from; DateTime? get to; String? get kategori; String? get accountId;
/// Create a copy of TransactionsFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsFilterCopyWith<TransactionsFilter> get copyWith => _$TransactionsFilterCopyWithImpl<TransactionsFilter>(this as TransactionsFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsFilter&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.kategori, kategori) || other.kategori == kategori)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}


@override
int get hashCode => Object.hash(runtimeType,from,to,kategori,accountId);

@override
String toString() {
  return 'TransactionsFilter(from: $from, to: $to, kategori: $kategori, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $TransactionsFilterCopyWith<$Res>  {
  factory $TransactionsFilterCopyWith(TransactionsFilter value, $Res Function(TransactionsFilter) _then) = _$TransactionsFilterCopyWithImpl;
@useResult
$Res call({
 DateTime? from, DateTime? to, String? kategori, String? accountId
});




}
/// @nodoc
class _$TransactionsFilterCopyWithImpl<$Res>
    implements $TransactionsFilterCopyWith<$Res> {
  _$TransactionsFilterCopyWithImpl(this._self, this._then);

  final TransactionsFilter _self;
  final $Res Function(TransactionsFilter) _then;

/// Create a copy of TransactionsFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = freezed,Object? to = freezed,Object? kategori = freezed,Object? accountId = freezed,}) {
  return _then(_self.copyWith(
from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,kategori: freezed == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionsFilter].
extension TransactionsFilterPatterns on TransactionsFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionsFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionsFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionsFilter value)  $default,){
final _that = this;
switch (_that) {
case _TransactionsFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionsFilter value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionsFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? from,  DateTime? to,  String? kategori,  String? accountId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionsFilter() when $default != null:
return $default(_that.from,_that.to,_that.kategori,_that.accountId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? from,  DateTime? to,  String? kategori,  String? accountId)  $default,) {final _that = this;
switch (_that) {
case _TransactionsFilter():
return $default(_that.from,_that.to,_that.kategori,_that.accountId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? from,  DateTime? to,  String? kategori,  String? accountId)?  $default,) {final _that = this;
switch (_that) {
case _TransactionsFilter() when $default != null:
return $default(_that.from,_that.to,_that.kategori,_that.accountId);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionsFilter implements TransactionsFilter {
  const _TransactionsFilter({this.from, this.to, this.kategori, this.accountId});
  

@override final  DateTime? from;
@override final  DateTime? to;
@override final  String? kategori;
@override final  String? accountId;

/// Create a copy of TransactionsFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionsFilterCopyWith<_TransactionsFilter> get copyWith => __$TransactionsFilterCopyWithImpl<_TransactionsFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionsFilter&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.kategori, kategori) || other.kategori == kategori)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}


@override
int get hashCode => Object.hash(runtimeType,from,to,kategori,accountId);

@override
String toString() {
  return 'TransactionsFilter(from: $from, to: $to, kategori: $kategori, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class _$TransactionsFilterCopyWith<$Res> implements $TransactionsFilterCopyWith<$Res> {
  factory _$TransactionsFilterCopyWith(_TransactionsFilter value, $Res Function(_TransactionsFilter) _then) = __$TransactionsFilterCopyWithImpl;
@override @useResult
$Res call({
 DateTime? from, DateTime? to, String? kategori, String? accountId
});




}
/// @nodoc
class __$TransactionsFilterCopyWithImpl<$Res>
    implements _$TransactionsFilterCopyWith<$Res> {
  __$TransactionsFilterCopyWithImpl(this._self, this._then);

  final _TransactionsFilter _self;
  final $Res Function(_TransactionsFilter) _then;

/// Create a copy of TransactionsFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = freezed,Object? to = freezed,Object? kategori = freezed,Object? accountId = freezed,}) {
  return _then(_TransactionsFilter(
from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,kategori: freezed == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
