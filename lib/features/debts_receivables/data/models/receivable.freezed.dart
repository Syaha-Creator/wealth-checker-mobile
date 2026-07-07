// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receivable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Receivable {

 String get id; String get userId; String get peminjam;@JsonKey(fromJson: parseJsonIntOrString) int get saldoAwal;@JsonKey(fromJson: parseJsonIntOrString) int get sisaSaldo; String get createdAt;
/// Create a copy of Receivable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceivableCopyWith<Receivable> get copyWith => _$ReceivableCopyWithImpl<Receivable>(this as Receivable, _$identity);

  /// Serializes this Receivable to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Receivable&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.peminjam, peminjam) || other.peminjam == peminjam)&&(identical(other.saldoAwal, saldoAwal) || other.saldoAwal == saldoAwal)&&(identical(other.sisaSaldo, sisaSaldo) || other.sisaSaldo == sisaSaldo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,peminjam,saldoAwal,sisaSaldo,createdAt);

@override
String toString() {
  return 'Receivable(id: $id, userId: $userId, peminjam: $peminjam, saldoAwal: $saldoAwal, sisaSaldo: $sisaSaldo, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ReceivableCopyWith<$Res>  {
  factory $ReceivableCopyWith(Receivable value, $Res Function(Receivable) _then) = _$ReceivableCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String peminjam,@JsonKey(fromJson: parseJsonIntOrString) int saldoAwal,@JsonKey(fromJson: parseJsonIntOrString) int sisaSaldo, String createdAt
});




}
/// @nodoc
class _$ReceivableCopyWithImpl<$Res>
    implements $ReceivableCopyWith<$Res> {
  _$ReceivableCopyWithImpl(this._self, this._then);

  final Receivable _self;
  final $Res Function(Receivable) _then;

/// Create a copy of Receivable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? peminjam = null,Object? saldoAwal = null,Object? sisaSaldo = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,peminjam: null == peminjam ? _self.peminjam : peminjam // ignore: cast_nullable_to_non_nullable
as String,saldoAwal: null == saldoAwal ? _self.saldoAwal : saldoAwal // ignore: cast_nullable_to_non_nullable
as int,sisaSaldo: null == sisaSaldo ? _self.sisaSaldo : sisaSaldo // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Receivable].
extension ReceivablePatterns on Receivable {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Receivable value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Receivable() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Receivable value)  $default,){
final _that = this;
switch (_that) {
case _Receivable():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Receivable value)?  $default,){
final _that = this;
switch (_that) {
case _Receivable() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String peminjam, @JsonKey(fromJson: parseJsonIntOrString)  int saldoAwal, @JsonKey(fromJson: parseJsonIntOrString)  int sisaSaldo,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Receivable() when $default != null:
return $default(_that.id,_that.userId,_that.peminjam,_that.saldoAwal,_that.sisaSaldo,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String peminjam, @JsonKey(fromJson: parseJsonIntOrString)  int saldoAwal, @JsonKey(fromJson: parseJsonIntOrString)  int sisaSaldo,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _Receivable():
return $default(_that.id,_that.userId,_that.peminjam,_that.saldoAwal,_that.sisaSaldo,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String peminjam, @JsonKey(fromJson: parseJsonIntOrString)  int saldoAwal, @JsonKey(fromJson: parseJsonIntOrString)  int sisaSaldo,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Receivable() when $default != null:
return $default(_that.id,_that.userId,_that.peminjam,_that.saldoAwal,_that.sisaSaldo,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Receivable extends Receivable {
  const _Receivable({required this.id, required this.userId, required this.peminjam, @JsonKey(fromJson: parseJsonIntOrString) required this.saldoAwal, @JsonKey(fromJson: parseJsonIntOrString) required this.sisaSaldo, required this.createdAt}): super._();
  factory _Receivable.fromJson(Map<String, dynamic> json) => _$ReceivableFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String peminjam;
@override@JsonKey(fromJson: parseJsonIntOrString) final  int saldoAwal;
@override@JsonKey(fromJson: parseJsonIntOrString) final  int sisaSaldo;
@override final  String createdAt;

/// Create a copy of Receivable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceivableCopyWith<_Receivable> get copyWith => __$ReceivableCopyWithImpl<_Receivable>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceivableToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Receivable&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.peminjam, peminjam) || other.peminjam == peminjam)&&(identical(other.saldoAwal, saldoAwal) || other.saldoAwal == saldoAwal)&&(identical(other.sisaSaldo, sisaSaldo) || other.sisaSaldo == sisaSaldo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,peminjam,saldoAwal,sisaSaldo,createdAt);

@override
String toString() {
  return 'Receivable(id: $id, userId: $userId, peminjam: $peminjam, saldoAwal: $saldoAwal, sisaSaldo: $sisaSaldo, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReceivableCopyWith<$Res> implements $ReceivableCopyWith<$Res> {
  factory _$ReceivableCopyWith(_Receivable value, $Res Function(_Receivable) _then) = __$ReceivableCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String peminjam,@JsonKey(fromJson: parseJsonIntOrString) int saldoAwal,@JsonKey(fromJson: parseJsonIntOrString) int sisaSaldo, String createdAt
});




}
/// @nodoc
class __$ReceivableCopyWithImpl<$Res>
    implements _$ReceivableCopyWith<$Res> {
  __$ReceivableCopyWithImpl(this._self, this._then);

  final _Receivable _self;
  final $Res Function(_Receivable) _then;

/// Create a copy of Receivable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? peminjam = null,Object? saldoAwal = null,Object? sisaSaldo = null,Object? createdAt = null,}) {
  return _then(_Receivable(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,peminjam: null == peminjam ? _self.peminjam : peminjam // ignore: cast_nullable_to_non_nullable
as String,saldoAwal: null == saldoAwal ? _self.saldoAwal : saldoAwal // ignore: cast_nullable_to_non_nullable
as int,sisaSaldo: null == sisaSaldo ? _self.sisaSaldo : sisaSaldo // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
