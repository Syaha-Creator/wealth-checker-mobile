// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'debt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Debt {

 String get id; String get userId; String get pemberiUtang; DebtType get tipe;@JsonKey(fromJson: parseJsonIntOrString) int get saldoAwal;@JsonKey(fromJson: parseJsonIntOrString) int get sisaSaldo; String get createdAt;
/// Create a copy of Debt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DebtCopyWith<Debt> get copyWith => _$DebtCopyWithImpl<Debt>(this as Debt, _$identity);

  /// Serializes this Debt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Debt&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pemberiUtang, pemberiUtang) || other.pemberiUtang == pemberiUtang)&&(identical(other.tipe, tipe) || other.tipe == tipe)&&(identical(other.saldoAwal, saldoAwal) || other.saldoAwal == saldoAwal)&&(identical(other.sisaSaldo, sisaSaldo) || other.sisaSaldo == sisaSaldo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,pemberiUtang,tipe,saldoAwal,sisaSaldo,createdAt);

@override
String toString() {
  return 'Debt(id: $id, userId: $userId, pemberiUtang: $pemberiUtang, tipe: $tipe, saldoAwal: $saldoAwal, sisaSaldo: $sisaSaldo, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DebtCopyWith<$Res>  {
  factory $DebtCopyWith(Debt value, $Res Function(Debt) _then) = _$DebtCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String pemberiUtang, DebtType tipe,@JsonKey(fromJson: parseJsonIntOrString) int saldoAwal,@JsonKey(fromJson: parseJsonIntOrString) int sisaSaldo, String createdAt
});




}
/// @nodoc
class _$DebtCopyWithImpl<$Res>
    implements $DebtCopyWith<$Res> {
  _$DebtCopyWithImpl(this._self, this._then);

  final Debt _self;
  final $Res Function(Debt) _then;

/// Create a copy of Debt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? pemberiUtang = null,Object? tipe = null,Object? saldoAwal = null,Object? sisaSaldo = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,pemberiUtang: null == pemberiUtang ? _self.pemberiUtang : pemberiUtang // ignore: cast_nullable_to_non_nullable
as String,tipe: null == tipe ? _self.tipe : tipe // ignore: cast_nullable_to_non_nullable
as DebtType,saldoAwal: null == saldoAwal ? _self.saldoAwal : saldoAwal // ignore: cast_nullable_to_non_nullable
as int,sisaSaldo: null == sisaSaldo ? _self.sisaSaldo : sisaSaldo // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Debt].
extension DebtPatterns on Debt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Debt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Debt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Debt value)  $default,){
final _that = this;
switch (_that) {
case _Debt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Debt value)?  $default,){
final _that = this;
switch (_that) {
case _Debt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String pemberiUtang,  DebtType tipe, @JsonKey(fromJson: parseJsonIntOrString)  int saldoAwal, @JsonKey(fromJson: parseJsonIntOrString)  int sisaSaldo,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Debt() when $default != null:
return $default(_that.id,_that.userId,_that.pemberiUtang,_that.tipe,_that.saldoAwal,_that.sisaSaldo,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String pemberiUtang,  DebtType tipe, @JsonKey(fromJson: parseJsonIntOrString)  int saldoAwal, @JsonKey(fromJson: parseJsonIntOrString)  int sisaSaldo,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _Debt():
return $default(_that.id,_that.userId,_that.pemberiUtang,_that.tipe,_that.saldoAwal,_that.sisaSaldo,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String pemberiUtang,  DebtType tipe, @JsonKey(fromJson: parseJsonIntOrString)  int saldoAwal, @JsonKey(fromJson: parseJsonIntOrString)  int sisaSaldo,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Debt() when $default != null:
return $default(_that.id,_that.userId,_that.pemberiUtang,_that.tipe,_that.saldoAwal,_that.sisaSaldo,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Debt extends Debt {
  const _Debt({required this.id, required this.userId, required this.pemberiUtang, required this.tipe, @JsonKey(fromJson: parseJsonIntOrString) required this.saldoAwal, @JsonKey(fromJson: parseJsonIntOrString) required this.sisaSaldo, required this.createdAt}): super._();
  factory _Debt.fromJson(Map<String, dynamic> json) => _$DebtFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String pemberiUtang;
@override final  DebtType tipe;
@override@JsonKey(fromJson: parseJsonIntOrString) final  int saldoAwal;
@override@JsonKey(fromJson: parseJsonIntOrString) final  int sisaSaldo;
@override final  String createdAt;

/// Create a copy of Debt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DebtCopyWith<_Debt> get copyWith => __$DebtCopyWithImpl<_Debt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DebtToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Debt&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pemberiUtang, pemberiUtang) || other.pemberiUtang == pemberiUtang)&&(identical(other.tipe, tipe) || other.tipe == tipe)&&(identical(other.saldoAwal, saldoAwal) || other.saldoAwal == saldoAwal)&&(identical(other.sisaSaldo, sisaSaldo) || other.sisaSaldo == sisaSaldo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,pemberiUtang,tipe,saldoAwal,sisaSaldo,createdAt);

@override
String toString() {
  return 'Debt(id: $id, userId: $userId, pemberiUtang: $pemberiUtang, tipe: $tipe, saldoAwal: $saldoAwal, sisaSaldo: $sisaSaldo, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DebtCopyWith<$Res> implements $DebtCopyWith<$Res> {
  factory _$DebtCopyWith(_Debt value, $Res Function(_Debt) _then) = __$DebtCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String pemberiUtang, DebtType tipe,@JsonKey(fromJson: parseJsonIntOrString) int saldoAwal,@JsonKey(fromJson: parseJsonIntOrString) int sisaSaldo, String createdAt
});




}
/// @nodoc
class __$DebtCopyWithImpl<$Res>
    implements _$DebtCopyWith<$Res> {
  __$DebtCopyWithImpl(this._self, this._then);

  final _Debt _self;
  final $Res Function(_Debt) _then;

/// Create a copy of Debt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? pemberiUtang = null,Object? tipe = null,Object? saldoAwal = null,Object? sisaSaldo = null,Object? createdAt = null,}) {
  return _then(_Debt(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,pemberiUtang: null == pemberiUtang ? _self.pemberiUtang : pemberiUtang // ignore: cast_nullable_to_non_nullable
as String,tipe: null == tipe ? _self.tipe : tipe // ignore: cast_nullable_to_non_nullable
as DebtType,saldoAwal: null == saldoAwal ? _self.saldoAwal : saldoAwal // ignore: cast_nullable_to_non_nullable
as int,sisaSaldo: null == sisaSaldo ? _self.sisaSaldo : sisaSaldo // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
