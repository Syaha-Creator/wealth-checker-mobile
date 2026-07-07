// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_fund.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmergencyFund {

@JsonKey(fromJson: parseJsonMoneyAmount) int get danaDarurat; String get status;/// `null` when `pengeluaranBulananRataRata` is not set in the profile.
@JsonKey(fromJson: parseJsonDoubleOrStringNullable) double? get bulanTertanggung;
/// Create a copy of EmergencyFund
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmergencyFundCopyWith<EmergencyFund> get copyWith => _$EmergencyFundCopyWithImpl<EmergencyFund>(this as EmergencyFund, _$identity);

  /// Serializes this EmergencyFund to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyFund&&(identical(other.danaDarurat, danaDarurat) || other.danaDarurat == danaDarurat)&&(identical(other.status, status) || other.status == status)&&(identical(other.bulanTertanggung, bulanTertanggung) || other.bulanTertanggung == bulanTertanggung));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,danaDarurat,status,bulanTertanggung);

@override
String toString() {
  return 'EmergencyFund(danaDarurat: $danaDarurat, status: $status, bulanTertanggung: $bulanTertanggung)';
}


}

/// @nodoc
abstract mixin class $EmergencyFundCopyWith<$Res>  {
  factory $EmergencyFundCopyWith(EmergencyFund value, $Res Function(EmergencyFund) _then) = _$EmergencyFundCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: parseJsonMoneyAmount) int danaDarurat, String status,@JsonKey(fromJson: parseJsonDoubleOrStringNullable) double? bulanTertanggung
});




}
/// @nodoc
class _$EmergencyFundCopyWithImpl<$Res>
    implements $EmergencyFundCopyWith<$Res> {
  _$EmergencyFundCopyWithImpl(this._self, this._then);

  final EmergencyFund _self;
  final $Res Function(EmergencyFund) _then;

/// Create a copy of EmergencyFund
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? danaDarurat = null,Object? status = null,Object? bulanTertanggung = freezed,}) {
  return _then(_self.copyWith(
danaDarurat: null == danaDarurat ? _self.danaDarurat : danaDarurat // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,bulanTertanggung: freezed == bulanTertanggung ? _self.bulanTertanggung : bulanTertanggung // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmergencyFund].
extension EmergencyFundPatterns on EmergencyFund {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmergencyFund value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmergencyFund() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmergencyFund value)  $default,){
final _that = this;
switch (_that) {
case _EmergencyFund():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmergencyFund value)?  $default,){
final _that = this;
switch (_that) {
case _EmergencyFund() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonMoneyAmount)  int danaDarurat,  String status, @JsonKey(fromJson: parseJsonDoubleOrStringNullable)  double? bulanTertanggung)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmergencyFund() when $default != null:
return $default(_that.danaDarurat,_that.status,_that.bulanTertanggung);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonMoneyAmount)  int danaDarurat,  String status, @JsonKey(fromJson: parseJsonDoubleOrStringNullable)  double? bulanTertanggung)  $default,) {final _that = this;
switch (_that) {
case _EmergencyFund():
return $default(_that.danaDarurat,_that.status,_that.bulanTertanggung);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: parseJsonMoneyAmount)  int danaDarurat,  String status, @JsonKey(fromJson: parseJsonDoubleOrStringNullable)  double? bulanTertanggung)?  $default,) {final _that = this;
switch (_that) {
case _EmergencyFund() when $default != null:
return $default(_that.danaDarurat,_that.status,_that.bulanTertanggung);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmergencyFund extends EmergencyFund {
  const _EmergencyFund({@JsonKey(fromJson: parseJsonMoneyAmount) required this.danaDarurat, required this.status, @JsonKey(fromJson: parseJsonDoubleOrStringNullable) this.bulanTertanggung}): super._();
  factory _EmergencyFund.fromJson(Map<String, dynamic> json) => _$EmergencyFundFromJson(json);

@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int danaDarurat;
@override final  String status;
/// `null` when `pengeluaranBulananRataRata` is not set in the profile.
@override@JsonKey(fromJson: parseJsonDoubleOrStringNullable) final  double? bulanTertanggung;

/// Create a copy of EmergencyFund
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmergencyFundCopyWith<_EmergencyFund> get copyWith => __$EmergencyFundCopyWithImpl<_EmergencyFund>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmergencyFundToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmergencyFund&&(identical(other.danaDarurat, danaDarurat) || other.danaDarurat == danaDarurat)&&(identical(other.status, status) || other.status == status)&&(identical(other.bulanTertanggung, bulanTertanggung) || other.bulanTertanggung == bulanTertanggung));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,danaDarurat,status,bulanTertanggung);

@override
String toString() {
  return 'EmergencyFund(danaDarurat: $danaDarurat, status: $status, bulanTertanggung: $bulanTertanggung)';
}


}

/// @nodoc
abstract mixin class _$EmergencyFundCopyWith<$Res> implements $EmergencyFundCopyWith<$Res> {
  factory _$EmergencyFundCopyWith(_EmergencyFund value, $Res Function(_EmergencyFund) _then) = __$EmergencyFundCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: parseJsonMoneyAmount) int danaDarurat, String status,@JsonKey(fromJson: parseJsonDoubleOrStringNullable) double? bulanTertanggung
});




}
/// @nodoc
class __$EmergencyFundCopyWithImpl<$Res>
    implements _$EmergencyFundCopyWith<$Res> {
  __$EmergencyFundCopyWithImpl(this._self, this._then);

  final _EmergencyFund _self;
  final $Res Function(_EmergencyFund) _then;

/// Create a copy of EmergencyFund
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? danaDarurat = null,Object? status = null,Object? bulanTertanggung = freezed,}) {
  return _then(_EmergencyFund(
danaDarurat: null == danaDarurat ? _self.danaDarurat : danaDarurat // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,bulanTertanggung: freezed == bulanTertanggung ? _self.bulanTertanggung : bulanTertanggung // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
