// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Transaction {

 String get id; String get userId; String get tanggal; TransactionType get type; String? get kategori; String? get rincian; String? get accountId; String? get relatedEntityId;@JsonKey(name: 'toAccountId') String? get toAccountId;@JsonKey(fromJson: parseJsonIntOrString) int get nominal; String get createdAt;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tanggal, tanggal) || other.tanggal == tanggal)&&(identical(other.type, type) || other.type == type)&&(identical(other.kategori, kategori) || other.kategori == kategori)&&(identical(other.rincian, rincian) || other.rincian == rincian)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.relatedEntityId, relatedEntityId) || other.relatedEntityId == relatedEntityId)&&(identical(other.toAccountId, toAccountId) || other.toAccountId == toAccountId)&&(identical(other.nominal, nominal) || other.nominal == nominal)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,tanggal,type,kategori,rincian,accountId,relatedEntityId,toAccountId,nominal,createdAt);

@override
String toString() {
  return 'Transaction(id: $id, userId: $userId, tanggal: $tanggal, type: $type, kategori: $kategori, rincian: $rincian, accountId: $accountId, relatedEntityId: $relatedEntityId, toAccountId: $toAccountId, nominal: $nominal, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String tanggal, TransactionType type, String? kategori, String? rincian, String? accountId, String? relatedEntityId,@JsonKey(name: 'toAccountId') String? toAccountId,@JsonKey(fromJson: parseJsonIntOrString) int nominal, String createdAt
});




}
/// @nodoc
class _$TransactionCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? tanggal = null,Object? type = null,Object? kategori = freezed,Object? rincian = freezed,Object? accountId = freezed,Object? relatedEntityId = freezed,Object? toAccountId = freezed,Object? nominal = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,tanggal: null == tanggal ? _self.tanggal : tanggal // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,kategori: freezed == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String?,rincian: freezed == rincian ? _self.rincian : rincian // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,relatedEntityId: freezed == relatedEntityId ? _self.relatedEntityId : relatedEntityId // ignore: cast_nullable_to_non_nullable
as String?,toAccountId: freezed == toAccountId ? _self.toAccountId : toAccountId // ignore: cast_nullable_to_non_nullable
as String?,nominal: null == nominal ? _self.nominal : nominal // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Transaction].
extension TransactionPatterns on Transaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transaction value)  $default,){
final _that = this;
switch (_that) {
case _Transaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transaction value)?  $default,){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String tanggal,  TransactionType type,  String? kategori,  String? rincian,  String? accountId,  String? relatedEntityId, @JsonKey(name: 'toAccountId')  String? toAccountId, @JsonKey(fromJson: parseJsonIntOrString)  int nominal,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.userId,_that.tanggal,_that.type,_that.kategori,_that.rincian,_that.accountId,_that.relatedEntityId,_that.toAccountId,_that.nominal,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String tanggal,  TransactionType type,  String? kategori,  String? rincian,  String? accountId,  String? relatedEntityId, @JsonKey(name: 'toAccountId')  String? toAccountId, @JsonKey(fromJson: parseJsonIntOrString)  int nominal,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _Transaction():
return $default(_that.id,_that.userId,_that.tanggal,_that.type,_that.kategori,_that.rincian,_that.accountId,_that.relatedEntityId,_that.toAccountId,_that.nominal,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String tanggal,  TransactionType type,  String? kategori,  String? rincian,  String? accountId,  String? relatedEntityId, @JsonKey(name: 'toAccountId')  String? toAccountId, @JsonKey(fromJson: parseJsonIntOrString)  int nominal,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.userId,_that.tanggal,_that.type,_that.kategori,_that.rincian,_that.accountId,_that.relatedEntityId,_that.toAccountId,_that.nominal,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Transaction extends Transaction {
  const _Transaction({required this.id, required this.userId, required this.tanggal, required this.type, this.kategori, this.rincian, this.accountId, this.relatedEntityId, @JsonKey(name: 'toAccountId') this.toAccountId, @JsonKey(fromJson: parseJsonIntOrString) required this.nominal, required this.createdAt}): super._();
  factory _Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String tanggal;
@override final  TransactionType type;
@override final  String? kategori;
@override final  String? rincian;
@override final  String? accountId;
@override final  String? relatedEntityId;
@override@JsonKey(name: 'toAccountId') final  String? toAccountId;
@override@JsonKey(fromJson: parseJsonIntOrString) final  int nominal;
@override final  String createdAt;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCopyWith<_Transaction> get copyWith => __$TransactionCopyWithImpl<_Transaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.tanggal, tanggal) || other.tanggal == tanggal)&&(identical(other.type, type) || other.type == type)&&(identical(other.kategori, kategori) || other.kategori == kategori)&&(identical(other.rincian, rincian) || other.rincian == rincian)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.relatedEntityId, relatedEntityId) || other.relatedEntityId == relatedEntityId)&&(identical(other.toAccountId, toAccountId) || other.toAccountId == toAccountId)&&(identical(other.nominal, nominal) || other.nominal == nominal)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,tanggal,type,kategori,rincian,accountId,relatedEntityId,toAccountId,nominal,createdAt);

@override
String toString() {
  return 'Transaction(id: $id, userId: $userId, tanggal: $tanggal, type: $type, kategori: $kategori, rincian: $rincian, accountId: $accountId, relatedEntityId: $relatedEntityId, toAccountId: $toAccountId, nominal: $nominal, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(_Transaction value, $Res Function(_Transaction) _then) = __$TransactionCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String tanggal, TransactionType type, String? kategori, String? rincian, String? accountId, String? relatedEntityId,@JsonKey(name: 'toAccountId') String? toAccountId,@JsonKey(fromJson: parseJsonIntOrString) int nominal, String createdAt
});




}
/// @nodoc
class __$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? tanggal = null,Object? type = null,Object? kategori = freezed,Object? rincian = freezed,Object? accountId = freezed,Object? relatedEntityId = freezed,Object? toAccountId = freezed,Object? nominal = null,Object? createdAt = null,}) {
  return _then(_Transaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,tanggal: null == tanggal ? _self.tanggal : tanggal // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,kategori: freezed == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String?,rincian: freezed == rincian ? _self.rincian : rincian // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,relatedEntityId: freezed == relatedEntityId ? _self.relatedEntityId : relatedEntityId // ignore: cast_nullable_to_non_nullable
as String?,toAccountId: freezed == toAccountId ? _self.toAccountId : toAccountId // ignore: cast_nullable_to_non_nullable
as String?,nominal: null == nominal ? _self.nominal : nominal // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
