// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fixed_asset_holding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FixedAssetHolding {

 String get id; String get userId; String get namaAset;@JsonKey(fromJson: parseJsonDoubleOrString) double get jumlah;@JsonKey(fromJson: parseJsonDoubleOrString) double get hargaBeliRataRata; String get updatedAt;
/// Create a copy of FixedAssetHolding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FixedAssetHoldingCopyWith<FixedAssetHolding> get copyWith => _$FixedAssetHoldingCopyWithImpl<FixedAssetHolding>(this as FixedAssetHolding, _$identity);

  /// Serializes this FixedAssetHolding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FixedAssetHolding&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.namaAset, namaAset) || other.namaAset == namaAset)&&(identical(other.jumlah, jumlah) || other.jumlah == jumlah)&&(identical(other.hargaBeliRataRata, hargaBeliRataRata) || other.hargaBeliRataRata == hargaBeliRataRata)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,namaAset,jumlah,hargaBeliRataRata,updatedAt);

@override
String toString() {
  return 'FixedAssetHolding(id: $id, userId: $userId, namaAset: $namaAset, jumlah: $jumlah, hargaBeliRataRata: $hargaBeliRataRata, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FixedAssetHoldingCopyWith<$Res>  {
  factory $FixedAssetHoldingCopyWith(FixedAssetHolding value, $Res Function(FixedAssetHolding) _then) = _$FixedAssetHoldingCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String namaAset,@JsonKey(fromJson: parseJsonDoubleOrString) double jumlah,@JsonKey(fromJson: parseJsonDoubleOrString) double hargaBeliRataRata, String updatedAt
});




}
/// @nodoc
class _$FixedAssetHoldingCopyWithImpl<$Res>
    implements $FixedAssetHoldingCopyWith<$Res> {
  _$FixedAssetHoldingCopyWithImpl(this._self, this._then);

  final FixedAssetHolding _self;
  final $Res Function(FixedAssetHolding) _then;

/// Create a copy of FixedAssetHolding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? namaAset = null,Object? jumlah = null,Object? hargaBeliRataRata = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,namaAset: null == namaAset ? _self.namaAset : namaAset // ignore: cast_nullable_to_non_nullable
as String,jumlah: null == jumlah ? _self.jumlah : jumlah // ignore: cast_nullable_to_non_nullable
as double,hargaBeliRataRata: null == hargaBeliRataRata ? _self.hargaBeliRataRata : hargaBeliRataRata // ignore: cast_nullable_to_non_nullable
as double,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FixedAssetHolding].
extension FixedAssetHoldingPatterns on FixedAssetHolding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FixedAssetHolding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FixedAssetHolding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FixedAssetHolding value)  $default,){
final _that = this;
switch (_that) {
case _FixedAssetHolding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FixedAssetHolding value)?  $default,){
final _that = this;
switch (_that) {
case _FixedAssetHolding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String namaAset, @JsonKey(fromJson: parseJsonDoubleOrString)  double jumlah, @JsonKey(fromJson: parseJsonDoubleOrString)  double hargaBeliRataRata,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FixedAssetHolding() when $default != null:
return $default(_that.id,_that.userId,_that.namaAset,_that.jumlah,_that.hargaBeliRataRata,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String namaAset, @JsonKey(fromJson: parseJsonDoubleOrString)  double jumlah, @JsonKey(fromJson: parseJsonDoubleOrString)  double hargaBeliRataRata,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _FixedAssetHolding():
return $default(_that.id,_that.userId,_that.namaAset,_that.jumlah,_that.hargaBeliRataRata,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String namaAset, @JsonKey(fromJson: parseJsonDoubleOrString)  double jumlah, @JsonKey(fromJson: parseJsonDoubleOrString)  double hargaBeliRataRata,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _FixedAssetHolding() when $default != null:
return $default(_that.id,_that.userId,_that.namaAset,_that.jumlah,_that.hargaBeliRataRata,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FixedAssetHolding extends FixedAssetHolding {
  const _FixedAssetHolding({required this.id, required this.userId, required this.namaAset, @JsonKey(fromJson: parseJsonDoubleOrString) required this.jumlah, @JsonKey(fromJson: parseJsonDoubleOrString) required this.hargaBeliRataRata, required this.updatedAt}): super._();
  factory _FixedAssetHolding.fromJson(Map<String, dynamic> json) => _$FixedAssetHoldingFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String namaAset;
@override@JsonKey(fromJson: parseJsonDoubleOrString) final  double jumlah;
@override@JsonKey(fromJson: parseJsonDoubleOrString) final  double hargaBeliRataRata;
@override final  String updatedAt;

/// Create a copy of FixedAssetHolding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FixedAssetHoldingCopyWith<_FixedAssetHolding> get copyWith => __$FixedAssetHoldingCopyWithImpl<_FixedAssetHolding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FixedAssetHoldingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FixedAssetHolding&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.namaAset, namaAset) || other.namaAset == namaAset)&&(identical(other.jumlah, jumlah) || other.jumlah == jumlah)&&(identical(other.hargaBeliRataRata, hargaBeliRataRata) || other.hargaBeliRataRata == hargaBeliRataRata)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,namaAset,jumlah,hargaBeliRataRata,updatedAt);

@override
String toString() {
  return 'FixedAssetHolding(id: $id, userId: $userId, namaAset: $namaAset, jumlah: $jumlah, hargaBeliRataRata: $hargaBeliRataRata, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FixedAssetHoldingCopyWith<$Res> implements $FixedAssetHoldingCopyWith<$Res> {
  factory _$FixedAssetHoldingCopyWith(_FixedAssetHolding value, $Res Function(_FixedAssetHolding) _then) = __$FixedAssetHoldingCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String namaAset,@JsonKey(fromJson: parseJsonDoubleOrString) double jumlah,@JsonKey(fromJson: parseJsonDoubleOrString) double hargaBeliRataRata, String updatedAt
});




}
/// @nodoc
class __$FixedAssetHoldingCopyWithImpl<$Res>
    implements _$FixedAssetHoldingCopyWith<$Res> {
  __$FixedAssetHoldingCopyWithImpl(this._self, this._then);

  final _FixedAssetHolding _self;
  final $Res Function(_FixedAssetHolding) _then;

/// Create a copy of FixedAssetHolding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? namaAset = null,Object? jumlah = null,Object? hargaBeliRataRata = null,Object? updatedAt = null,}) {
  return _then(_FixedAssetHolding(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,namaAset: null == namaAset ? _self.namaAset : namaAset // ignore: cast_nullable_to_non_nullable
as String,jumlah: null == jumlah ? _self.jumlah : jumlah // ignore: cast_nullable_to_non_nullable
as double,hargaBeliRataRata: null == hargaBeliRataRata ? _self.hargaBeliRataRata : hargaBeliRataRata // ignore: cast_nullable_to_non_nullable
as double,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
