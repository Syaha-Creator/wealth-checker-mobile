// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_mutation_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountMutationQuery {

 String get accountId; DateTime? get from; DateTime? get to;
/// Create a copy of AccountMutationQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountMutationQueryCopyWith<AccountMutationQuery> get copyWith => _$AccountMutationQueryCopyWithImpl<AccountMutationQuery>(this as AccountMutationQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountMutationQuery&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,from,to);

@override
String toString() {
  return 'AccountMutationQuery(accountId: $accountId, from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class $AccountMutationQueryCopyWith<$Res>  {
  factory $AccountMutationQueryCopyWith(AccountMutationQuery value, $Res Function(AccountMutationQuery) _then) = _$AccountMutationQueryCopyWithImpl;
@useResult
$Res call({
 String accountId, DateTime? from, DateTime? to
});




}
/// @nodoc
class _$AccountMutationQueryCopyWithImpl<$Res>
    implements $AccountMutationQueryCopyWith<$Res> {
  _$AccountMutationQueryCopyWithImpl(this._self, this._then);

  final AccountMutationQuery _self;
  final $Res Function(AccountMutationQuery) _then;

/// Create a copy of AccountMutationQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? from = freezed,Object? to = freezed,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountMutationQuery].
extension AccountMutationQueryPatterns on AccountMutationQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountMutationQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountMutationQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountMutationQuery value)  $default,){
final _that = this;
switch (_that) {
case _AccountMutationQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountMutationQuery value)?  $default,){
final _that = this;
switch (_that) {
case _AccountMutationQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accountId,  DateTime? from,  DateTime? to)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountMutationQuery() when $default != null:
return $default(_that.accountId,_that.from,_that.to);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accountId,  DateTime? from,  DateTime? to)  $default,) {final _that = this;
switch (_that) {
case _AccountMutationQuery():
return $default(_that.accountId,_that.from,_that.to);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accountId,  DateTime? from,  DateTime? to)?  $default,) {final _that = this;
switch (_that) {
case _AccountMutationQuery() when $default != null:
return $default(_that.accountId,_that.from,_that.to);case _:
  return null;

}
}

}

/// @nodoc


class _AccountMutationQuery implements AccountMutationQuery {
  const _AccountMutationQuery({required this.accountId, this.from, this.to});
  

@override final  String accountId;
@override final  DateTime? from;
@override final  DateTime? to;

/// Create a copy of AccountMutationQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountMutationQueryCopyWith<_AccountMutationQuery> get copyWith => __$AccountMutationQueryCopyWithImpl<_AccountMutationQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountMutationQuery&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,from,to);

@override
String toString() {
  return 'AccountMutationQuery(accountId: $accountId, from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class _$AccountMutationQueryCopyWith<$Res> implements $AccountMutationQueryCopyWith<$Res> {
  factory _$AccountMutationQueryCopyWith(_AccountMutationQuery value, $Res Function(_AccountMutationQuery) _then) = __$AccountMutationQueryCopyWithImpl;
@override @useResult
$Res call({
 String accountId, DateTime? from, DateTime? to
});




}
/// @nodoc
class __$AccountMutationQueryCopyWithImpl<$Res>
    implements _$AccountMutationQueryCopyWith<$Res> {
  __$AccountMutationQueryCopyWithImpl(this._self, this._then);

  final _AccountMutationQuery _self;
  final $Res Function(_AccountMutationQuery) _then;

/// Create a copy of AccountMutationQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? from = freezed,Object? to = freezed,}) {
  return _then(_AccountMutationQuery(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
