// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dream_goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DreamGoal {

 String get id; String get namaGoal; String? get accountId;@JsonKey(fromJson: parseJsonMoneyAmount) int get targetNominal;@JsonKey(fromJson: parseJsonMoneyAmount) int get saldoSaatIni;@JsonKey(fromJson: parseJsonDoubleOrString) double get persentase; bool get tercapai;@JsonKey(fromJson: parseJsonMoneyAmount) int get sisaMenujuTarget;
/// Create a copy of DreamGoal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DreamGoalCopyWith<DreamGoal> get copyWith => _$DreamGoalCopyWithImpl<DreamGoal>(this as DreamGoal, _$identity);

  /// Serializes this DreamGoal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DreamGoal&&(identical(other.id, id) || other.id == id)&&(identical(other.namaGoal, namaGoal) || other.namaGoal == namaGoal)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.targetNominal, targetNominal) || other.targetNominal == targetNominal)&&(identical(other.saldoSaatIni, saldoSaatIni) || other.saldoSaatIni == saldoSaatIni)&&(identical(other.persentase, persentase) || other.persentase == persentase)&&(identical(other.tercapai, tercapai) || other.tercapai == tercapai)&&(identical(other.sisaMenujuTarget, sisaMenujuTarget) || other.sisaMenujuTarget == sisaMenujuTarget));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,namaGoal,accountId,targetNominal,saldoSaatIni,persentase,tercapai,sisaMenujuTarget);

@override
String toString() {
  return 'DreamGoal(id: $id, namaGoal: $namaGoal, accountId: $accountId, targetNominal: $targetNominal, saldoSaatIni: $saldoSaatIni, persentase: $persentase, tercapai: $tercapai, sisaMenujuTarget: $sisaMenujuTarget)';
}


}

/// @nodoc
abstract mixin class $DreamGoalCopyWith<$Res>  {
  factory $DreamGoalCopyWith(DreamGoal value, $Res Function(DreamGoal) _then) = _$DreamGoalCopyWithImpl;
@useResult
$Res call({
 String id, String namaGoal, String? accountId,@JsonKey(fromJson: parseJsonMoneyAmount) int targetNominal,@JsonKey(fromJson: parseJsonMoneyAmount) int saldoSaatIni,@JsonKey(fromJson: parseJsonDoubleOrString) double persentase, bool tercapai,@JsonKey(fromJson: parseJsonMoneyAmount) int sisaMenujuTarget
});




}
/// @nodoc
class _$DreamGoalCopyWithImpl<$Res>
    implements $DreamGoalCopyWith<$Res> {
  _$DreamGoalCopyWithImpl(this._self, this._then);

  final DreamGoal _self;
  final $Res Function(DreamGoal) _then;

/// Create a copy of DreamGoal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? namaGoal = null,Object? accountId = freezed,Object? targetNominal = null,Object? saldoSaatIni = null,Object? persentase = null,Object? tercapai = null,Object? sisaMenujuTarget = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,namaGoal: null == namaGoal ? _self.namaGoal : namaGoal // ignore: cast_nullable_to_non_nullable
as String,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,targetNominal: null == targetNominal ? _self.targetNominal : targetNominal // ignore: cast_nullable_to_non_nullable
as int,saldoSaatIni: null == saldoSaatIni ? _self.saldoSaatIni : saldoSaatIni // ignore: cast_nullable_to_non_nullable
as int,persentase: null == persentase ? _self.persentase : persentase // ignore: cast_nullable_to_non_nullable
as double,tercapai: null == tercapai ? _self.tercapai : tercapai // ignore: cast_nullable_to_non_nullable
as bool,sisaMenujuTarget: null == sisaMenujuTarget ? _self.sisaMenujuTarget : sisaMenujuTarget // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DreamGoal].
extension DreamGoalPatterns on DreamGoal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DreamGoal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DreamGoal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DreamGoal value)  $default,){
final _that = this;
switch (_that) {
case _DreamGoal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DreamGoal value)?  $default,){
final _that = this;
switch (_that) {
case _DreamGoal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String namaGoal,  String? accountId, @JsonKey(fromJson: parseJsonMoneyAmount)  int targetNominal, @JsonKey(fromJson: parseJsonMoneyAmount)  int saldoSaatIni, @JsonKey(fromJson: parseJsonDoubleOrString)  double persentase,  bool tercapai, @JsonKey(fromJson: parseJsonMoneyAmount)  int sisaMenujuTarget)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DreamGoal() when $default != null:
return $default(_that.id,_that.namaGoal,_that.accountId,_that.targetNominal,_that.saldoSaatIni,_that.persentase,_that.tercapai,_that.sisaMenujuTarget);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String namaGoal,  String? accountId, @JsonKey(fromJson: parseJsonMoneyAmount)  int targetNominal, @JsonKey(fromJson: parseJsonMoneyAmount)  int saldoSaatIni, @JsonKey(fromJson: parseJsonDoubleOrString)  double persentase,  bool tercapai, @JsonKey(fromJson: parseJsonMoneyAmount)  int sisaMenujuTarget)  $default,) {final _that = this;
switch (_that) {
case _DreamGoal():
return $default(_that.id,_that.namaGoal,_that.accountId,_that.targetNominal,_that.saldoSaatIni,_that.persentase,_that.tercapai,_that.sisaMenujuTarget);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String namaGoal,  String? accountId, @JsonKey(fromJson: parseJsonMoneyAmount)  int targetNominal, @JsonKey(fromJson: parseJsonMoneyAmount)  int saldoSaatIni, @JsonKey(fromJson: parseJsonDoubleOrString)  double persentase,  bool tercapai, @JsonKey(fromJson: parseJsonMoneyAmount)  int sisaMenujuTarget)?  $default,) {final _that = this;
switch (_that) {
case _DreamGoal() when $default != null:
return $default(_that.id,_that.namaGoal,_that.accountId,_that.targetNominal,_that.saldoSaatIni,_that.persentase,_that.tercapai,_that.sisaMenujuTarget);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DreamGoal extends DreamGoal {
  const _DreamGoal({required this.id, required this.namaGoal, this.accountId, @JsonKey(fromJson: parseJsonMoneyAmount) required this.targetNominal, @JsonKey(fromJson: parseJsonMoneyAmount) required this.saldoSaatIni, @JsonKey(fromJson: parseJsonDoubleOrString) required this.persentase, required this.tercapai, @JsonKey(fromJson: parseJsonMoneyAmount) required this.sisaMenujuTarget}): super._();
  factory _DreamGoal.fromJson(Map<String, dynamic> json) => _$DreamGoalFromJson(json);

@override final  String id;
@override final  String namaGoal;
@override final  String? accountId;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int targetNominal;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int saldoSaatIni;
@override@JsonKey(fromJson: parseJsonDoubleOrString) final  double persentase;
@override final  bool tercapai;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int sisaMenujuTarget;

/// Create a copy of DreamGoal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DreamGoalCopyWith<_DreamGoal> get copyWith => __$DreamGoalCopyWithImpl<_DreamGoal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DreamGoalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DreamGoal&&(identical(other.id, id) || other.id == id)&&(identical(other.namaGoal, namaGoal) || other.namaGoal == namaGoal)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.targetNominal, targetNominal) || other.targetNominal == targetNominal)&&(identical(other.saldoSaatIni, saldoSaatIni) || other.saldoSaatIni == saldoSaatIni)&&(identical(other.persentase, persentase) || other.persentase == persentase)&&(identical(other.tercapai, tercapai) || other.tercapai == tercapai)&&(identical(other.sisaMenujuTarget, sisaMenujuTarget) || other.sisaMenujuTarget == sisaMenujuTarget));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,namaGoal,accountId,targetNominal,saldoSaatIni,persentase,tercapai,sisaMenujuTarget);

@override
String toString() {
  return 'DreamGoal(id: $id, namaGoal: $namaGoal, accountId: $accountId, targetNominal: $targetNominal, saldoSaatIni: $saldoSaatIni, persentase: $persentase, tercapai: $tercapai, sisaMenujuTarget: $sisaMenujuTarget)';
}


}

/// @nodoc
abstract mixin class _$DreamGoalCopyWith<$Res> implements $DreamGoalCopyWith<$Res> {
  factory _$DreamGoalCopyWith(_DreamGoal value, $Res Function(_DreamGoal) _then) = __$DreamGoalCopyWithImpl;
@override @useResult
$Res call({
 String id, String namaGoal, String? accountId,@JsonKey(fromJson: parseJsonMoneyAmount) int targetNominal,@JsonKey(fromJson: parseJsonMoneyAmount) int saldoSaatIni,@JsonKey(fromJson: parseJsonDoubleOrString) double persentase, bool tercapai,@JsonKey(fromJson: parseJsonMoneyAmount) int sisaMenujuTarget
});




}
/// @nodoc
class __$DreamGoalCopyWithImpl<$Res>
    implements _$DreamGoalCopyWith<$Res> {
  __$DreamGoalCopyWithImpl(this._self, this._then);

  final _DreamGoal _self;
  final $Res Function(_DreamGoal) _then;

/// Create a copy of DreamGoal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? namaGoal = null,Object? accountId = freezed,Object? targetNominal = null,Object? saldoSaatIni = null,Object? persentase = null,Object? tercapai = null,Object? sisaMenujuTarget = null,}) {
  return _then(_DreamGoal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,namaGoal: null == namaGoal ? _self.namaGoal : namaGoal // ignore: cast_nullable_to_non_nullable
as String,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,targetNominal: null == targetNominal ? _self.targetNominal : targetNominal // ignore: cast_nullable_to_non_nullable
as int,saldoSaatIni: null == saldoSaatIni ? _self.saldoSaatIni : saldoSaatIni // ignore: cast_nullable_to_non_nullable
as int,persentase: null == persentase ? _self.persentase : persentase // ignore: cast_nullable_to_non_nullable
as double,tercapai: null == tercapai ? _self.tercapai : tercapai // ignore: cast_nullable_to_non_nullable
as bool,sisaMenujuTarget: null == sisaMenujuTarget ? _self.sisaMenujuTarget : sisaMenujuTarget // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DreamGoalRecord {

 String get id; String get namaGoal;@JsonKey(fromJson: parseJsonMoneyAmount) int get targetNominal; String? get accountId;@JsonKey(fromJson: parseJsonDoubleOrStringNullable) double? get saldoManual; String? get userId; String? get createdAt; String? get updatedAt;
/// Create a copy of DreamGoalRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DreamGoalRecordCopyWith<DreamGoalRecord> get copyWith => _$DreamGoalRecordCopyWithImpl<DreamGoalRecord>(this as DreamGoalRecord, _$identity);

  /// Serializes this DreamGoalRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DreamGoalRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.namaGoal, namaGoal) || other.namaGoal == namaGoal)&&(identical(other.targetNominal, targetNominal) || other.targetNominal == targetNominal)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.saldoManual, saldoManual) || other.saldoManual == saldoManual)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,namaGoal,targetNominal,accountId,saldoManual,userId,createdAt,updatedAt);

@override
String toString() {
  return 'DreamGoalRecord(id: $id, namaGoal: $namaGoal, targetNominal: $targetNominal, accountId: $accountId, saldoManual: $saldoManual, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DreamGoalRecordCopyWith<$Res>  {
  factory $DreamGoalRecordCopyWith(DreamGoalRecord value, $Res Function(DreamGoalRecord) _then) = _$DreamGoalRecordCopyWithImpl;
@useResult
$Res call({
 String id, String namaGoal,@JsonKey(fromJson: parseJsonMoneyAmount) int targetNominal, String? accountId,@JsonKey(fromJson: parseJsonDoubleOrStringNullable) double? saldoManual, String? userId, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$DreamGoalRecordCopyWithImpl<$Res>
    implements $DreamGoalRecordCopyWith<$Res> {
  _$DreamGoalRecordCopyWithImpl(this._self, this._then);

  final DreamGoalRecord _self;
  final $Res Function(DreamGoalRecord) _then;

/// Create a copy of DreamGoalRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? namaGoal = null,Object? targetNominal = null,Object? accountId = freezed,Object? saldoManual = freezed,Object? userId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,namaGoal: null == namaGoal ? _self.namaGoal : namaGoal // ignore: cast_nullable_to_non_nullable
as String,targetNominal: null == targetNominal ? _self.targetNominal : targetNominal // ignore: cast_nullable_to_non_nullable
as int,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,saldoManual: freezed == saldoManual ? _self.saldoManual : saldoManual // ignore: cast_nullable_to_non_nullable
as double?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DreamGoalRecord].
extension DreamGoalRecordPatterns on DreamGoalRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DreamGoalRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DreamGoalRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DreamGoalRecord value)  $default,){
final _that = this;
switch (_that) {
case _DreamGoalRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DreamGoalRecord value)?  $default,){
final _that = this;
switch (_that) {
case _DreamGoalRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String namaGoal, @JsonKey(fromJson: parseJsonMoneyAmount)  int targetNominal,  String? accountId, @JsonKey(fromJson: parseJsonDoubleOrStringNullable)  double? saldoManual,  String? userId,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DreamGoalRecord() when $default != null:
return $default(_that.id,_that.namaGoal,_that.targetNominal,_that.accountId,_that.saldoManual,_that.userId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String namaGoal, @JsonKey(fromJson: parseJsonMoneyAmount)  int targetNominal,  String? accountId, @JsonKey(fromJson: parseJsonDoubleOrStringNullable)  double? saldoManual,  String? userId,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DreamGoalRecord():
return $default(_that.id,_that.namaGoal,_that.targetNominal,_that.accountId,_that.saldoManual,_that.userId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String namaGoal, @JsonKey(fromJson: parseJsonMoneyAmount)  int targetNominal,  String? accountId, @JsonKey(fromJson: parseJsonDoubleOrStringNullable)  double? saldoManual,  String? userId,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DreamGoalRecord() when $default != null:
return $default(_that.id,_that.namaGoal,_that.targetNominal,_that.accountId,_that.saldoManual,_that.userId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DreamGoalRecord implements DreamGoalRecord {
  const _DreamGoalRecord({required this.id, required this.namaGoal, @JsonKey(fromJson: parseJsonMoneyAmount) required this.targetNominal, this.accountId, @JsonKey(fromJson: parseJsonDoubleOrStringNullable) this.saldoManual, this.userId, this.createdAt, this.updatedAt});
  factory _DreamGoalRecord.fromJson(Map<String, dynamic> json) => _$DreamGoalRecordFromJson(json);

@override final  String id;
@override final  String namaGoal;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int targetNominal;
@override final  String? accountId;
@override@JsonKey(fromJson: parseJsonDoubleOrStringNullable) final  double? saldoManual;
@override final  String? userId;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of DreamGoalRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DreamGoalRecordCopyWith<_DreamGoalRecord> get copyWith => __$DreamGoalRecordCopyWithImpl<_DreamGoalRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DreamGoalRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DreamGoalRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.namaGoal, namaGoal) || other.namaGoal == namaGoal)&&(identical(other.targetNominal, targetNominal) || other.targetNominal == targetNominal)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.saldoManual, saldoManual) || other.saldoManual == saldoManual)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,namaGoal,targetNominal,accountId,saldoManual,userId,createdAt,updatedAt);

@override
String toString() {
  return 'DreamGoalRecord(id: $id, namaGoal: $namaGoal, targetNominal: $targetNominal, accountId: $accountId, saldoManual: $saldoManual, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DreamGoalRecordCopyWith<$Res> implements $DreamGoalRecordCopyWith<$Res> {
  factory _$DreamGoalRecordCopyWith(_DreamGoalRecord value, $Res Function(_DreamGoalRecord) _then) = __$DreamGoalRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String namaGoal,@JsonKey(fromJson: parseJsonMoneyAmount) int targetNominal, String? accountId,@JsonKey(fromJson: parseJsonDoubleOrStringNullable) double? saldoManual, String? userId, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$DreamGoalRecordCopyWithImpl<$Res>
    implements _$DreamGoalRecordCopyWith<$Res> {
  __$DreamGoalRecordCopyWithImpl(this._self, this._then);

  final _DreamGoalRecord _self;
  final $Res Function(_DreamGoalRecord) _then;

/// Create a copy of DreamGoalRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? namaGoal = null,Object? targetNominal = null,Object? accountId = freezed,Object? saldoManual = freezed,Object? userId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DreamGoalRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,namaGoal: null == namaGoal ? _self.namaGoal : namaGoal // ignore: cast_nullable_to_non_nullable
as String,targetNominal: null == targetNominal ? _self.targetNominal : targetNominal // ignore: cast_nullable_to_non_nullable
as int,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,saldoManual: freezed == saldoManual ? _self.saldoManual : saldoManual // ignore: cast_nullable_to_non_nullable
as double?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
