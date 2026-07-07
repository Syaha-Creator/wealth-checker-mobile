// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BudgetPlan {

 String get id; String get userId; String get householdId;@JsonKey(fromJson: parseJsonMoneyAmount) int get rencanaPemasukanBulanan; String get bulanTahun; String get createdAt;
/// Create a copy of BudgetPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetPlanCopyWith<BudgetPlan> get copyWith => _$BudgetPlanCopyWithImpl<BudgetPlan>(this as BudgetPlan, _$identity);

  /// Serializes this BudgetPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.householdId, householdId) || other.householdId == householdId)&&(identical(other.rencanaPemasukanBulanan, rencanaPemasukanBulanan) || other.rencanaPemasukanBulanan == rencanaPemasukanBulanan)&&(identical(other.bulanTahun, bulanTahun) || other.bulanTahun == bulanTahun)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,householdId,rencanaPemasukanBulanan,bulanTahun,createdAt);

@override
String toString() {
  return 'BudgetPlan(id: $id, userId: $userId, householdId: $householdId, rencanaPemasukanBulanan: $rencanaPemasukanBulanan, bulanTahun: $bulanTahun, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BudgetPlanCopyWith<$Res>  {
  factory $BudgetPlanCopyWith(BudgetPlan value, $Res Function(BudgetPlan) _then) = _$BudgetPlanCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String householdId,@JsonKey(fromJson: parseJsonMoneyAmount) int rencanaPemasukanBulanan, String bulanTahun, String createdAt
});




}
/// @nodoc
class _$BudgetPlanCopyWithImpl<$Res>
    implements $BudgetPlanCopyWith<$Res> {
  _$BudgetPlanCopyWithImpl(this._self, this._then);

  final BudgetPlan _self;
  final $Res Function(BudgetPlan) _then;

/// Create a copy of BudgetPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? householdId = null,Object? rencanaPemasukanBulanan = null,Object? bulanTahun = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,householdId: null == householdId ? _self.householdId : householdId // ignore: cast_nullable_to_non_nullable
as String,rencanaPemasukanBulanan: null == rencanaPemasukanBulanan ? _self.rencanaPemasukanBulanan : rencanaPemasukanBulanan // ignore: cast_nullable_to_non_nullable
as int,bulanTahun: null == bulanTahun ? _self.bulanTahun : bulanTahun // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetPlan].
extension BudgetPlanPatterns on BudgetPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetPlan value)  $default,){
final _that = this;
switch (_that) {
case _BudgetPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetPlan value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String householdId, @JsonKey(fromJson: parseJsonMoneyAmount)  int rencanaPemasukanBulanan,  String bulanTahun,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetPlan() when $default != null:
return $default(_that.id,_that.userId,_that.householdId,_that.rencanaPemasukanBulanan,_that.bulanTahun,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String householdId, @JsonKey(fromJson: parseJsonMoneyAmount)  int rencanaPemasukanBulanan,  String bulanTahun,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _BudgetPlan():
return $default(_that.id,_that.userId,_that.householdId,_that.rencanaPemasukanBulanan,_that.bulanTahun,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String householdId, @JsonKey(fromJson: parseJsonMoneyAmount)  int rencanaPemasukanBulanan,  String bulanTahun,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BudgetPlan() when $default != null:
return $default(_that.id,_that.userId,_that.householdId,_that.rencanaPemasukanBulanan,_that.bulanTahun,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BudgetPlan extends BudgetPlan {
  const _BudgetPlan({required this.id, required this.userId, required this.householdId, @JsonKey(fromJson: parseJsonMoneyAmount) required this.rencanaPemasukanBulanan, required this.bulanTahun, required this.createdAt}): super._();
  factory _BudgetPlan.fromJson(Map<String, dynamic> json) => _$BudgetPlanFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String householdId;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int rencanaPemasukanBulanan;
@override final  String bulanTahun;
@override final  String createdAt;

/// Create a copy of BudgetPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetPlanCopyWith<_BudgetPlan> get copyWith => __$BudgetPlanCopyWithImpl<_BudgetPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BudgetPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.householdId, householdId) || other.householdId == householdId)&&(identical(other.rencanaPemasukanBulanan, rencanaPemasukanBulanan) || other.rencanaPemasukanBulanan == rencanaPemasukanBulanan)&&(identical(other.bulanTahun, bulanTahun) || other.bulanTahun == bulanTahun)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,householdId,rencanaPemasukanBulanan,bulanTahun,createdAt);

@override
String toString() {
  return 'BudgetPlan(id: $id, userId: $userId, householdId: $householdId, rencanaPemasukanBulanan: $rencanaPemasukanBulanan, bulanTahun: $bulanTahun, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BudgetPlanCopyWith<$Res> implements $BudgetPlanCopyWith<$Res> {
  factory _$BudgetPlanCopyWith(_BudgetPlan value, $Res Function(_BudgetPlan) _then) = __$BudgetPlanCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String householdId,@JsonKey(fromJson: parseJsonMoneyAmount) int rencanaPemasukanBulanan, String bulanTahun, String createdAt
});




}
/// @nodoc
class __$BudgetPlanCopyWithImpl<$Res>
    implements _$BudgetPlanCopyWith<$Res> {
  __$BudgetPlanCopyWithImpl(this._self, this._then);

  final _BudgetPlan _self;
  final $Res Function(_BudgetPlan) _then;

/// Create a copy of BudgetPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? householdId = null,Object? rencanaPemasukanBulanan = null,Object? bulanTahun = null,Object? createdAt = null,}) {
  return _then(_BudgetPlan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,householdId: null == householdId ? _self.householdId : householdId // ignore: cast_nullable_to_non_nullable
as String,rencanaPemasukanBulanan: null == rencanaPemasukanBulanan ? _self.rencanaPemasukanBulanan : rencanaPemasukanBulanan // ignore: cast_nullable_to_non_nullable
as int,bulanTahun: null == bulanTahun ? _self.bulanTahun : bulanTahun // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
