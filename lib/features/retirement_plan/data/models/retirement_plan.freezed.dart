// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'retirement_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RetirementPlanDetails {

/// Can be negative when the planned age has already passed.
 int get tahunMenujuPensiun; int get tahunMenujuWarisan;@JsonKey(fromJson: parseJsonMoneyAmount) int get danaDibutuhkanSebelumPensiun;@JsonKey(fromJson: parseJsonMoneyAmount) int get danaDibutuhkanSelamaPensiun;@JsonKey(fromJson: parseJsonMoneyAmount) int get totalDanaPensiunWarisan;
/// Create a copy of RetirementPlanDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RetirementPlanDetailsCopyWith<RetirementPlanDetails> get copyWith => _$RetirementPlanDetailsCopyWithImpl<RetirementPlanDetails>(this as RetirementPlanDetails, _$identity);

  /// Serializes this RetirementPlanDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RetirementPlanDetails&&(identical(other.tahunMenujuPensiun, tahunMenujuPensiun) || other.tahunMenujuPensiun == tahunMenujuPensiun)&&(identical(other.tahunMenujuWarisan, tahunMenujuWarisan) || other.tahunMenujuWarisan == tahunMenujuWarisan)&&(identical(other.danaDibutuhkanSebelumPensiun, danaDibutuhkanSebelumPensiun) || other.danaDibutuhkanSebelumPensiun == danaDibutuhkanSebelumPensiun)&&(identical(other.danaDibutuhkanSelamaPensiun, danaDibutuhkanSelamaPensiun) || other.danaDibutuhkanSelamaPensiun == danaDibutuhkanSelamaPensiun)&&(identical(other.totalDanaPensiunWarisan, totalDanaPensiunWarisan) || other.totalDanaPensiunWarisan == totalDanaPensiunWarisan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tahunMenujuPensiun,tahunMenujuWarisan,danaDibutuhkanSebelumPensiun,danaDibutuhkanSelamaPensiun,totalDanaPensiunWarisan);

@override
String toString() {
  return 'RetirementPlanDetails(tahunMenujuPensiun: $tahunMenujuPensiun, tahunMenujuWarisan: $tahunMenujuWarisan, danaDibutuhkanSebelumPensiun: $danaDibutuhkanSebelumPensiun, danaDibutuhkanSelamaPensiun: $danaDibutuhkanSelamaPensiun, totalDanaPensiunWarisan: $totalDanaPensiunWarisan)';
}


}

/// @nodoc
abstract mixin class $RetirementPlanDetailsCopyWith<$Res>  {
  factory $RetirementPlanDetailsCopyWith(RetirementPlanDetails value, $Res Function(RetirementPlanDetails) _then) = _$RetirementPlanDetailsCopyWithImpl;
@useResult
$Res call({
 int tahunMenujuPensiun, int tahunMenujuWarisan,@JsonKey(fromJson: parseJsonMoneyAmount) int danaDibutuhkanSebelumPensiun,@JsonKey(fromJson: parseJsonMoneyAmount) int danaDibutuhkanSelamaPensiun,@JsonKey(fromJson: parseJsonMoneyAmount) int totalDanaPensiunWarisan
});




}
/// @nodoc
class _$RetirementPlanDetailsCopyWithImpl<$Res>
    implements $RetirementPlanDetailsCopyWith<$Res> {
  _$RetirementPlanDetailsCopyWithImpl(this._self, this._then);

  final RetirementPlanDetails _self;
  final $Res Function(RetirementPlanDetails) _then;

/// Create a copy of RetirementPlanDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tahunMenujuPensiun = null,Object? tahunMenujuWarisan = null,Object? danaDibutuhkanSebelumPensiun = null,Object? danaDibutuhkanSelamaPensiun = null,Object? totalDanaPensiunWarisan = null,}) {
  return _then(_self.copyWith(
tahunMenujuPensiun: null == tahunMenujuPensiun ? _self.tahunMenujuPensiun : tahunMenujuPensiun // ignore: cast_nullable_to_non_nullable
as int,tahunMenujuWarisan: null == tahunMenujuWarisan ? _self.tahunMenujuWarisan : tahunMenujuWarisan // ignore: cast_nullable_to_non_nullable
as int,danaDibutuhkanSebelumPensiun: null == danaDibutuhkanSebelumPensiun ? _self.danaDibutuhkanSebelumPensiun : danaDibutuhkanSebelumPensiun // ignore: cast_nullable_to_non_nullable
as int,danaDibutuhkanSelamaPensiun: null == danaDibutuhkanSelamaPensiun ? _self.danaDibutuhkanSelamaPensiun : danaDibutuhkanSelamaPensiun // ignore: cast_nullable_to_non_nullable
as int,totalDanaPensiunWarisan: null == totalDanaPensiunWarisan ? _self.totalDanaPensiunWarisan : totalDanaPensiunWarisan // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RetirementPlanDetails].
extension RetirementPlanDetailsPatterns on RetirementPlanDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RetirementPlanDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RetirementPlanDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RetirementPlanDetails value)  $default,){
final _that = this;
switch (_that) {
case _RetirementPlanDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RetirementPlanDetails value)?  $default,){
final _that = this;
switch (_that) {
case _RetirementPlanDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tahunMenujuPensiun,  int tahunMenujuWarisan, @JsonKey(fromJson: parseJsonMoneyAmount)  int danaDibutuhkanSebelumPensiun, @JsonKey(fromJson: parseJsonMoneyAmount)  int danaDibutuhkanSelamaPensiun, @JsonKey(fromJson: parseJsonMoneyAmount)  int totalDanaPensiunWarisan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RetirementPlanDetails() when $default != null:
return $default(_that.tahunMenujuPensiun,_that.tahunMenujuWarisan,_that.danaDibutuhkanSebelumPensiun,_that.danaDibutuhkanSelamaPensiun,_that.totalDanaPensiunWarisan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tahunMenujuPensiun,  int tahunMenujuWarisan, @JsonKey(fromJson: parseJsonMoneyAmount)  int danaDibutuhkanSebelumPensiun, @JsonKey(fromJson: parseJsonMoneyAmount)  int danaDibutuhkanSelamaPensiun, @JsonKey(fromJson: parseJsonMoneyAmount)  int totalDanaPensiunWarisan)  $default,) {final _that = this;
switch (_that) {
case _RetirementPlanDetails():
return $default(_that.tahunMenujuPensiun,_that.tahunMenujuWarisan,_that.danaDibutuhkanSebelumPensiun,_that.danaDibutuhkanSelamaPensiun,_that.totalDanaPensiunWarisan);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tahunMenujuPensiun,  int tahunMenujuWarisan, @JsonKey(fromJson: parseJsonMoneyAmount)  int danaDibutuhkanSebelumPensiun, @JsonKey(fromJson: parseJsonMoneyAmount)  int danaDibutuhkanSelamaPensiun, @JsonKey(fromJson: parseJsonMoneyAmount)  int totalDanaPensiunWarisan)?  $default,) {final _that = this;
switch (_that) {
case _RetirementPlanDetails() when $default != null:
return $default(_that.tahunMenujuPensiun,_that.tahunMenujuWarisan,_that.danaDibutuhkanSebelumPensiun,_that.danaDibutuhkanSelamaPensiun,_that.totalDanaPensiunWarisan);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RetirementPlanDetails implements RetirementPlanDetails {
  const _RetirementPlanDetails({required this.tahunMenujuPensiun, required this.tahunMenujuWarisan, @JsonKey(fromJson: parseJsonMoneyAmount) required this.danaDibutuhkanSebelumPensiun, @JsonKey(fromJson: parseJsonMoneyAmount) required this.danaDibutuhkanSelamaPensiun, @JsonKey(fromJson: parseJsonMoneyAmount) required this.totalDanaPensiunWarisan});
  factory _RetirementPlanDetails.fromJson(Map<String, dynamic> json) => _$RetirementPlanDetailsFromJson(json);

/// Can be negative when the planned age has already passed.
@override final  int tahunMenujuPensiun;
@override final  int tahunMenujuWarisan;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int danaDibutuhkanSebelumPensiun;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int danaDibutuhkanSelamaPensiun;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int totalDanaPensiunWarisan;

/// Create a copy of RetirementPlanDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetirementPlanDetailsCopyWith<_RetirementPlanDetails> get copyWith => __$RetirementPlanDetailsCopyWithImpl<_RetirementPlanDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RetirementPlanDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetirementPlanDetails&&(identical(other.tahunMenujuPensiun, tahunMenujuPensiun) || other.tahunMenujuPensiun == tahunMenujuPensiun)&&(identical(other.tahunMenujuWarisan, tahunMenujuWarisan) || other.tahunMenujuWarisan == tahunMenujuWarisan)&&(identical(other.danaDibutuhkanSebelumPensiun, danaDibutuhkanSebelumPensiun) || other.danaDibutuhkanSebelumPensiun == danaDibutuhkanSebelumPensiun)&&(identical(other.danaDibutuhkanSelamaPensiun, danaDibutuhkanSelamaPensiun) || other.danaDibutuhkanSelamaPensiun == danaDibutuhkanSelamaPensiun)&&(identical(other.totalDanaPensiunWarisan, totalDanaPensiunWarisan) || other.totalDanaPensiunWarisan == totalDanaPensiunWarisan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tahunMenujuPensiun,tahunMenujuWarisan,danaDibutuhkanSebelumPensiun,danaDibutuhkanSelamaPensiun,totalDanaPensiunWarisan);

@override
String toString() {
  return 'RetirementPlanDetails(tahunMenujuPensiun: $tahunMenujuPensiun, tahunMenujuWarisan: $tahunMenujuWarisan, danaDibutuhkanSebelumPensiun: $danaDibutuhkanSebelumPensiun, danaDibutuhkanSelamaPensiun: $danaDibutuhkanSelamaPensiun, totalDanaPensiunWarisan: $totalDanaPensiunWarisan)';
}


}

/// @nodoc
abstract mixin class _$RetirementPlanDetailsCopyWith<$Res> implements $RetirementPlanDetailsCopyWith<$Res> {
  factory _$RetirementPlanDetailsCopyWith(_RetirementPlanDetails value, $Res Function(_RetirementPlanDetails) _then) = __$RetirementPlanDetailsCopyWithImpl;
@override @useResult
$Res call({
 int tahunMenujuPensiun, int tahunMenujuWarisan,@JsonKey(fromJson: parseJsonMoneyAmount) int danaDibutuhkanSebelumPensiun,@JsonKey(fromJson: parseJsonMoneyAmount) int danaDibutuhkanSelamaPensiun,@JsonKey(fromJson: parseJsonMoneyAmount) int totalDanaPensiunWarisan
});




}
/// @nodoc
class __$RetirementPlanDetailsCopyWithImpl<$Res>
    implements _$RetirementPlanDetailsCopyWith<$Res> {
  __$RetirementPlanDetailsCopyWithImpl(this._self, this._then);

  final _RetirementPlanDetails _self;
  final $Res Function(_RetirementPlanDetails) _then;

/// Create a copy of RetirementPlanDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tahunMenujuPensiun = null,Object? tahunMenujuWarisan = null,Object? danaDibutuhkanSebelumPensiun = null,Object? danaDibutuhkanSelamaPensiun = null,Object? totalDanaPensiunWarisan = null,}) {
  return _then(_RetirementPlanDetails(
tahunMenujuPensiun: null == tahunMenujuPensiun ? _self.tahunMenujuPensiun : tahunMenujuPensiun // ignore: cast_nullable_to_non_nullable
as int,tahunMenujuWarisan: null == tahunMenujuWarisan ? _self.tahunMenujuWarisan : tahunMenujuWarisan // ignore: cast_nullable_to_non_nullable
as int,danaDibutuhkanSebelumPensiun: null == danaDibutuhkanSebelumPensiun ? _self.danaDibutuhkanSebelumPensiun : danaDibutuhkanSebelumPensiun // ignore: cast_nullable_to_non_nullable
as int,danaDibutuhkanSelamaPensiun: null == danaDibutuhkanSelamaPensiun ? _self.danaDibutuhkanSelamaPensiun : danaDibutuhkanSelamaPensiun // ignore: cast_nullable_to_non_nullable
as int,totalDanaPensiunWarisan: null == totalDanaPensiunWarisan ? _self.totalDanaPensiunWarisan : totalDanaPensiunWarisan // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RetirementCollectedFunds {

@JsonKey(fromJson: parseJsonMoneyAmount) int get danaDaruratTerkumpul;@JsonKey(fromJson: parseJsonMoneyAmount) int get danaPensiunTerkumpul;@JsonKey(fromJson: parseJsonMoneyAmount) int get danaWarisanTerkumpul;
/// Create a copy of RetirementCollectedFunds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RetirementCollectedFundsCopyWith<RetirementCollectedFunds> get copyWith => _$RetirementCollectedFundsCopyWithImpl<RetirementCollectedFunds>(this as RetirementCollectedFunds, _$identity);

  /// Serializes this RetirementCollectedFunds to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RetirementCollectedFunds&&(identical(other.danaDaruratTerkumpul, danaDaruratTerkumpul) || other.danaDaruratTerkumpul == danaDaruratTerkumpul)&&(identical(other.danaPensiunTerkumpul, danaPensiunTerkumpul) || other.danaPensiunTerkumpul == danaPensiunTerkumpul)&&(identical(other.danaWarisanTerkumpul, danaWarisanTerkumpul) || other.danaWarisanTerkumpul == danaWarisanTerkumpul));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,danaDaruratTerkumpul,danaPensiunTerkumpul,danaWarisanTerkumpul);

@override
String toString() {
  return 'RetirementCollectedFunds(danaDaruratTerkumpul: $danaDaruratTerkumpul, danaPensiunTerkumpul: $danaPensiunTerkumpul, danaWarisanTerkumpul: $danaWarisanTerkumpul)';
}


}

/// @nodoc
abstract mixin class $RetirementCollectedFundsCopyWith<$Res>  {
  factory $RetirementCollectedFundsCopyWith(RetirementCollectedFunds value, $Res Function(RetirementCollectedFunds) _then) = _$RetirementCollectedFundsCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: parseJsonMoneyAmount) int danaDaruratTerkumpul,@JsonKey(fromJson: parseJsonMoneyAmount) int danaPensiunTerkumpul,@JsonKey(fromJson: parseJsonMoneyAmount) int danaWarisanTerkumpul
});




}
/// @nodoc
class _$RetirementCollectedFundsCopyWithImpl<$Res>
    implements $RetirementCollectedFundsCopyWith<$Res> {
  _$RetirementCollectedFundsCopyWithImpl(this._self, this._then);

  final RetirementCollectedFunds _self;
  final $Res Function(RetirementCollectedFunds) _then;

/// Create a copy of RetirementCollectedFunds
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? danaDaruratTerkumpul = null,Object? danaPensiunTerkumpul = null,Object? danaWarisanTerkumpul = null,}) {
  return _then(_self.copyWith(
danaDaruratTerkumpul: null == danaDaruratTerkumpul ? _self.danaDaruratTerkumpul : danaDaruratTerkumpul // ignore: cast_nullable_to_non_nullable
as int,danaPensiunTerkumpul: null == danaPensiunTerkumpul ? _self.danaPensiunTerkumpul : danaPensiunTerkumpul // ignore: cast_nullable_to_non_nullable
as int,danaWarisanTerkumpul: null == danaWarisanTerkumpul ? _self.danaWarisanTerkumpul : danaWarisanTerkumpul // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RetirementCollectedFunds].
extension RetirementCollectedFundsPatterns on RetirementCollectedFunds {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RetirementCollectedFunds value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RetirementCollectedFunds() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RetirementCollectedFunds value)  $default,){
final _that = this;
switch (_that) {
case _RetirementCollectedFunds():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RetirementCollectedFunds value)?  $default,){
final _that = this;
switch (_that) {
case _RetirementCollectedFunds() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonMoneyAmount)  int danaDaruratTerkumpul, @JsonKey(fromJson: parseJsonMoneyAmount)  int danaPensiunTerkumpul, @JsonKey(fromJson: parseJsonMoneyAmount)  int danaWarisanTerkumpul)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RetirementCollectedFunds() when $default != null:
return $default(_that.danaDaruratTerkumpul,_that.danaPensiunTerkumpul,_that.danaWarisanTerkumpul);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonMoneyAmount)  int danaDaruratTerkumpul, @JsonKey(fromJson: parseJsonMoneyAmount)  int danaPensiunTerkumpul, @JsonKey(fromJson: parseJsonMoneyAmount)  int danaWarisanTerkumpul)  $default,) {final _that = this;
switch (_that) {
case _RetirementCollectedFunds():
return $default(_that.danaDaruratTerkumpul,_that.danaPensiunTerkumpul,_that.danaWarisanTerkumpul);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: parseJsonMoneyAmount)  int danaDaruratTerkumpul, @JsonKey(fromJson: parseJsonMoneyAmount)  int danaPensiunTerkumpul, @JsonKey(fromJson: parseJsonMoneyAmount)  int danaWarisanTerkumpul)?  $default,) {final _that = this;
switch (_that) {
case _RetirementCollectedFunds() when $default != null:
return $default(_that.danaDaruratTerkumpul,_that.danaPensiunTerkumpul,_that.danaWarisanTerkumpul);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RetirementCollectedFunds implements RetirementCollectedFunds {
  const _RetirementCollectedFunds({@JsonKey(fromJson: parseJsonMoneyAmount) required this.danaDaruratTerkumpul, @JsonKey(fromJson: parseJsonMoneyAmount) required this.danaPensiunTerkumpul, @JsonKey(fromJson: parseJsonMoneyAmount) required this.danaWarisanTerkumpul});
  factory _RetirementCollectedFunds.fromJson(Map<String, dynamic> json) => _$RetirementCollectedFundsFromJson(json);

@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int danaDaruratTerkumpul;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int danaPensiunTerkumpul;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int danaWarisanTerkumpul;

/// Create a copy of RetirementCollectedFunds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetirementCollectedFundsCopyWith<_RetirementCollectedFunds> get copyWith => __$RetirementCollectedFundsCopyWithImpl<_RetirementCollectedFunds>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RetirementCollectedFundsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetirementCollectedFunds&&(identical(other.danaDaruratTerkumpul, danaDaruratTerkumpul) || other.danaDaruratTerkumpul == danaDaruratTerkumpul)&&(identical(other.danaPensiunTerkumpul, danaPensiunTerkumpul) || other.danaPensiunTerkumpul == danaPensiunTerkumpul)&&(identical(other.danaWarisanTerkumpul, danaWarisanTerkumpul) || other.danaWarisanTerkumpul == danaWarisanTerkumpul));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,danaDaruratTerkumpul,danaPensiunTerkumpul,danaWarisanTerkumpul);

@override
String toString() {
  return 'RetirementCollectedFunds(danaDaruratTerkumpul: $danaDaruratTerkumpul, danaPensiunTerkumpul: $danaPensiunTerkumpul, danaWarisanTerkumpul: $danaWarisanTerkumpul)';
}


}

/// @nodoc
abstract mixin class _$RetirementCollectedFundsCopyWith<$Res> implements $RetirementCollectedFundsCopyWith<$Res> {
  factory _$RetirementCollectedFundsCopyWith(_RetirementCollectedFunds value, $Res Function(_RetirementCollectedFunds) _then) = __$RetirementCollectedFundsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: parseJsonMoneyAmount) int danaDaruratTerkumpul,@JsonKey(fromJson: parseJsonMoneyAmount) int danaPensiunTerkumpul,@JsonKey(fromJson: parseJsonMoneyAmount) int danaWarisanTerkumpul
});




}
/// @nodoc
class __$RetirementCollectedFundsCopyWithImpl<$Res>
    implements _$RetirementCollectedFundsCopyWith<$Res> {
  __$RetirementCollectedFundsCopyWithImpl(this._self, this._then);

  final _RetirementCollectedFunds _self;
  final $Res Function(_RetirementCollectedFunds) _then;

/// Create a copy of RetirementCollectedFunds
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? danaDaruratTerkumpul = null,Object? danaPensiunTerkumpul = null,Object? danaWarisanTerkumpul = null,}) {
  return _then(_RetirementCollectedFunds(
danaDaruratTerkumpul: null == danaDaruratTerkumpul ? _self.danaDaruratTerkumpul : danaDaruratTerkumpul // ignore: cast_nullable_to_non_nullable
as int,danaPensiunTerkumpul: null == danaPensiunTerkumpul ? _self.danaPensiunTerkumpul : danaPensiunTerkumpul // ignore: cast_nullable_to_non_nullable
as int,danaWarisanTerkumpul: null == danaWarisanTerkumpul ? _self.danaWarisanTerkumpul : danaWarisanTerkumpul // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RetirementDebtPayoff {

 bool get bisaLunasSekarang;/// `null` when payoff cannot be computed (e.g. `sisaUangBulanan <= 0`).
 int? get bulanLunasDenganKas;/// `null` when payoff cannot be computed (e.g. `sisaUangBulanan <= 0`).
 int? get bulanLunasDenganSisaGaji;
/// Create a copy of RetirementDebtPayoff
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RetirementDebtPayoffCopyWith<RetirementDebtPayoff> get copyWith => _$RetirementDebtPayoffCopyWithImpl<RetirementDebtPayoff>(this as RetirementDebtPayoff, _$identity);

  /// Serializes this RetirementDebtPayoff to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RetirementDebtPayoff&&(identical(other.bisaLunasSekarang, bisaLunasSekarang) || other.bisaLunasSekarang == bisaLunasSekarang)&&(identical(other.bulanLunasDenganKas, bulanLunasDenganKas) || other.bulanLunasDenganKas == bulanLunasDenganKas)&&(identical(other.bulanLunasDenganSisaGaji, bulanLunasDenganSisaGaji) || other.bulanLunasDenganSisaGaji == bulanLunasDenganSisaGaji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bisaLunasSekarang,bulanLunasDenganKas,bulanLunasDenganSisaGaji);

@override
String toString() {
  return 'RetirementDebtPayoff(bisaLunasSekarang: $bisaLunasSekarang, bulanLunasDenganKas: $bulanLunasDenganKas, bulanLunasDenganSisaGaji: $bulanLunasDenganSisaGaji)';
}


}

/// @nodoc
abstract mixin class $RetirementDebtPayoffCopyWith<$Res>  {
  factory $RetirementDebtPayoffCopyWith(RetirementDebtPayoff value, $Res Function(RetirementDebtPayoff) _then) = _$RetirementDebtPayoffCopyWithImpl;
@useResult
$Res call({
 bool bisaLunasSekarang, int? bulanLunasDenganKas, int? bulanLunasDenganSisaGaji
});




}
/// @nodoc
class _$RetirementDebtPayoffCopyWithImpl<$Res>
    implements $RetirementDebtPayoffCopyWith<$Res> {
  _$RetirementDebtPayoffCopyWithImpl(this._self, this._then);

  final RetirementDebtPayoff _self;
  final $Res Function(RetirementDebtPayoff) _then;

/// Create a copy of RetirementDebtPayoff
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bisaLunasSekarang = null,Object? bulanLunasDenganKas = freezed,Object? bulanLunasDenganSisaGaji = freezed,}) {
  return _then(_self.copyWith(
bisaLunasSekarang: null == bisaLunasSekarang ? _self.bisaLunasSekarang : bisaLunasSekarang // ignore: cast_nullable_to_non_nullable
as bool,bulanLunasDenganKas: freezed == bulanLunasDenganKas ? _self.bulanLunasDenganKas : bulanLunasDenganKas // ignore: cast_nullable_to_non_nullable
as int?,bulanLunasDenganSisaGaji: freezed == bulanLunasDenganSisaGaji ? _self.bulanLunasDenganSisaGaji : bulanLunasDenganSisaGaji // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RetirementDebtPayoff].
extension RetirementDebtPayoffPatterns on RetirementDebtPayoff {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RetirementDebtPayoff value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RetirementDebtPayoff() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RetirementDebtPayoff value)  $default,){
final _that = this;
switch (_that) {
case _RetirementDebtPayoff():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RetirementDebtPayoff value)?  $default,){
final _that = this;
switch (_that) {
case _RetirementDebtPayoff() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool bisaLunasSekarang,  int? bulanLunasDenganKas,  int? bulanLunasDenganSisaGaji)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RetirementDebtPayoff() when $default != null:
return $default(_that.bisaLunasSekarang,_that.bulanLunasDenganKas,_that.bulanLunasDenganSisaGaji);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool bisaLunasSekarang,  int? bulanLunasDenganKas,  int? bulanLunasDenganSisaGaji)  $default,) {final _that = this;
switch (_that) {
case _RetirementDebtPayoff():
return $default(_that.bisaLunasSekarang,_that.bulanLunasDenganKas,_that.bulanLunasDenganSisaGaji);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool bisaLunasSekarang,  int? bulanLunasDenganKas,  int? bulanLunasDenganSisaGaji)?  $default,) {final _that = this;
switch (_that) {
case _RetirementDebtPayoff() when $default != null:
return $default(_that.bisaLunasSekarang,_that.bulanLunasDenganKas,_that.bulanLunasDenganSisaGaji);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RetirementDebtPayoff implements RetirementDebtPayoff {
  const _RetirementDebtPayoff({required this.bisaLunasSekarang, this.bulanLunasDenganKas, this.bulanLunasDenganSisaGaji});
  factory _RetirementDebtPayoff.fromJson(Map<String, dynamic> json) => _$RetirementDebtPayoffFromJson(json);

@override final  bool bisaLunasSekarang;
/// `null` when payoff cannot be computed (e.g. `sisaUangBulanan <= 0`).
@override final  int? bulanLunasDenganKas;
/// `null` when payoff cannot be computed (e.g. `sisaUangBulanan <= 0`).
@override final  int? bulanLunasDenganSisaGaji;

/// Create a copy of RetirementDebtPayoff
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetirementDebtPayoffCopyWith<_RetirementDebtPayoff> get copyWith => __$RetirementDebtPayoffCopyWithImpl<_RetirementDebtPayoff>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RetirementDebtPayoffToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetirementDebtPayoff&&(identical(other.bisaLunasSekarang, bisaLunasSekarang) || other.bisaLunasSekarang == bisaLunasSekarang)&&(identical(other.bulanLunasDenganKas, bulanLunasDenganKas) || other.bulanLunasDenganKas == bulanLunasDenganKas)&&(identical(other.bulanLunasDenganSisaGaji, bulanLunasDenganSisaGaji) || other.bulanLunasDenganSisaGaji == bulanLunasDenganSisaGaji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bisaLunasSekarang,bulanLunasDenganKas,bulanLunasDenganSisaGaji);

@override
String toString() {
  return 'RetirementDebtPayoff(bisaLunasSekarang: $bisaLunasSekarang, bulanLunasDenganKas: $bulanLunasDenganKas, bulanLunasDenganSisaGaji: $bulanLunasDenganSisaGaji)';
}


}

/// @nodoc
abstract mixin class _$RetirementDebtPayoffCopyWith<$Res> implements $RetirementDebtPayoffCopyWith<$Res> {
  factory _$RetirementDebtPayoffCopyWith(_RetirementDebtPayoff value, $Res Function(_RetirementDebtPayoff) _then) = __$RetirementDebtPayoffCopyWithImpl;
@override @useResult
$Res call({
 bool bisaLunasSekarang, int? bulanLunasDenganKas, int? bulanLunasDenganSisaGaji
});




}
/// @nodoc
class __$RetirementDebtPayoffCopyWithImpl<$Res>
    implements _$RetirementDebtPayoffCopyWith<$Res> {
  __$RetirementDebtPayoffCopyWithImpl(this._self, this._then);

  final _RetirementDebtPayoff _self;
  final $Res Function(_RetirementDebtPayoff) _then;

/// Create a copy of RetirementDebtPayoff
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bisaLunasSekarang = null,Object? bulanLunasDenganKas = freezed,Object? bulanLunasDenganSisaGaji = freezed,}) {
  return _then(_RetirementDebtPayoff(
bisaLunasSekarang: null == bisaLunasSekarang ? _self.bisaLunasSekarang : bisaLunasSekarang // ignore: cast_nullable_to_non_nullable
as bool,bulanLunasDenganKas: freezed == bulanLunasDenganKas ? _self.bulanLunasDenganKas : bulanLunasDenganKas // ignore: cast_nullable_to_non_nullable
as int?,bulanLunasDenganSisaGaji: freezed == bulanLunasDenganSisaGaji ? _self.bulanLunasDenganSisaGaji : bulanLunasDenganSisaGaji // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$RetirementRealizedPL {

@JsonKey(fromJson: parseJsonMoneyAmount) int get untungRugiJualBarang;@JsonKey(fromJson: parseJsonMoneyAmount) int get untungRugiInvestasi;
/// Create a copy of RetirementRealizedPL
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RetirementRealizedPLCopyWith<RetirementRealizedPL> get copyWith => _$RetirementRealizedPLCopyWithImpl<RetirementRealizedPL>(this as RetirementRealizedPL, _$identity);

  /// Serializes this RetirementRealizedPL to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RetirementRealizedPL&&(identical(other.untungRugiJualBarang, untungRugiJualBarang) || other.untungRugiJualBarang == untungRugiJualBarang)&&(identical(other.untungRugiInvestasi, untungRugiInvestasi) || other.untungRugiInvestasi == untungRugiInvestasi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,untungRugiJualBarang,untungRugiInvestasi);

@override
String toString() {
  return 'RetirementRealizedPL(untungRugiJualBarang: $untungRugiJualBarang, untungRugiInvestasi: $untungRugiInvestasi)';
}


}

/// @nodoc
abstract mixin class $RetirementRealizedPLCopyWith<$Res>  {
  factory $RetirementRealizedPLCopyWith(RetirementRealizedPL value, $Res Function(RetirementRealizedPL) _then) = _$RetirementRealizedPLCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: parseJsonMoneyAmount) int untungRugiJualBarang,@JsonKey(fromJson: parseJsonMoneyAmount) int untungRugiInvestasi
});




}
/// @nodoc
class _$RetirementRealizedPLCopyWithImpl<$Res>
    implements $RetirementRealizedPLCopyWith<$Res> {
  _$RetirementRealizedPLCopyWithImpl(this._self, this._then);

  final RetirementRealizedPL _self;
  final $Res Function(RetirementRealizedPL) _then;

/// Create a copy of RetirementRealizedPL
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? untungRugiJualBarang = null,Object? untungRugiInvestasi = null,}) {
  return _then(_self.copyWith(
untungRugiJualBarang: null == untungRugiJualBarang ? _self.untungRugiJualBarang : untungRugiJualBarang // ignore: cast_nullable_to_non_nullable
as int,untungRugiInvestasi: null == untungRugiInvestasi ? _self.untungRugiInvestasi : untungRugiInvestasi // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RetirementRealizedPL].
extension RetirementRealizedPLPatterns on RetirementRealizedPL {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RetirementRealizedPL value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RetirementRealizedPL() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RetirementRealizedPL value)  $default,){
final _that = this;
switch (_that) {
case _RetirementRealizedPL():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RetirementRealizedPL value)?  $default,){
final _that = this;
switch (_that) {
case _RetirementRealizedPL() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonMoneyAmount)  int untungRugiJualBarang, @JsonKey(fromJson: parseJsonMoneyAmount)  int untungRugiInvestasi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RetirementRealizedPL() when $default != null:
return $default(_that.untungRugiJualBarang,_that.untungRugiInvestasi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonMoneyAmount)  int untungRugiJualBarang, @JsonKey(fromJson: parseJsonMoneyAmount)  int untungRugiInvestasi)  $default,) {final _that = this;
switch (_that) {
case _RetirementRealizedPL():
return $default(_that.untungRugiJualBarang,_that.untungRugiInvestasi);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: parseJsonMoneyAmount)  int untungRugiJualBarang, @JsonKey(fromJson: parseJsonMoneyAmount)  int untungRugiInvestasi)?  $default,) {final _that = this;
switch (_that) {
case _RetirementRealizedPL() when $default != null:
return $default(_that.untungRugiJualBarang,_that.untungRugiInvestasi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RetirementRealizedPL implements RetirementRealizedPL {
  const _RetirementRealizedPL({@JsonKey(fromJson: parseJsonMoneyAmount) required this.untungRugiJualBarang, @JsonKey(fromJson: parseJsonMoneyAmount) required this.untungRugiInvestasi});
  factory _RetirementRealizedPL.fromJson(Map<String, dynamic> json) => _$RetirementRealizedPLFromJson(json);

@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int untungRugiJualBarang;
@override@JsonKey(fromJson: parseJsonMoneyAmount) final  int untungRugiInvestasi;

/// Create a copy of RetirementRealizedPL
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetirementRealizedPLCopyWith<_RetirementRealizedPL> get copyWith => __$RetirementRealizedPLCopyWithImpl<_RetirementRealizedPL>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RetirementRealizedPLToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetirementRealizedPL&&(identical(other.untungRugiJualBarang, untungRugiJualBarang) || other.untungRugiJualBarang == untungRugiJualBarang)&&(identical(other.untungRugiInvestasi, untungRugiInvestasi) || other.untungRugiInvestasi == untungRugiInvestasi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,untungRugiJualBarang,untungRugiInvestasi);

@override
String toString() {
  return 'RetirementRealizedPL(untungRugiJualBarang: $untungRugiJualBarang, untungRugiInvestasi: $untungRugiInvestasi)';
}


}

/// @nodoc
abstract mixin class _$RetirementRealizedPLCopyWith<$Res> implements $RetirementRealizedPLCopyWith<$Res> {
  factory _$RetirementRealizedPLCopyWith(_RetirementRealizedPL value, $Res Function(_RetirementRealizedPL) _then) = __$RetirementRealizedPLCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: parseJsonMoneyAmount) int untungRugiJualBarang,@JsonKey(fromJson: parseJsonMoneyAmount) int untungRugiInvestasi
});




}
/// @nodoc
class __$RetirementRealizedPLCopyWithImpl<$Res>
    implements _$RetirementRealizedPLCopyWith<$Res> {
  __$RetirementRealizedPLCopyWithImpl(this._self, this._then);

  final _RetirementRealizedPL _self;
  final $Res Function(_RetirementRealizedPL) _then;

/// Create a copy of RetirementRealizedPL
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? untungRugiJualBarang = null,Object? untungRugiInvestasi = null,}) {
  return _then(_RetirementRealizedPL(
untungRugiJualBarang: null == untungRugiJualBarang ? _self.untungRugiJualBarang : untungRugiJualBarang // ignore: cast_nullable_to_non_nullable
as int,untungRugiInvestasi: null == untungRugiInvestasi ? _self.untungRugiInvestasi : untungRugiInvestasi // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RetirementPlan {

 bool get hasProfile; String? get error; String? get mode; RetirementPlanDetails? get plan;@JsonKey(fromJson: parseJsonMoneyAmountNullable) int? get sisaUangBulanan;@JsonKey(fromJson: parseJsonMoneyAmountNullable) int? get danaTerkumpulSaatIni;@JsonKey(fromJson: parseJsonMoneyAmountNullable) int? get selisihMenujuTarget; RetirementCollectedFunds? get collectedFunds; RetirementDebtPayoff? get debtPayoff; RetirementRealizedPL? get realizedPL;
/// Create a copy of RetirementPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RetirementPlanCopyWith<RetirementPlan> get copyWith => _$RetirementPlanCopyWithImpl<RetirementPlan>(this as RetirementPlan, _$identity);

  /// Serializes this RetirementPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RetirementPlan&&(identical(other.hasProfile, hasProfile) || other.hasProfile == hasProfile)&&(identical(other.error, error) || other.error == error)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.sisaUangBulanan, sisaUangBulanan) || other.sisaUangBulanan == sisaUangBulanan)&&(identical(other.danaTerkumpulSaatIni, danaTerkumpulSaatIni) || other.danaTerkumpulSaatIni == danaTerkumpulSaatIni)&&(identical(other.selisihMenujuTarget, selisihMenujuTarget) || other.selisihMenujuTarget == selisihMenujuTarget)&&(identical(other.collectedFunds, collectedFunds) || other.collectedFunds == collectedFunds)&&(identical(other.debtPayoff, debtPayoff) || other.debtPayoff == debtPayoff)&&(identical(other.realizedPL, realizedPL) || other.realizedPL == realizedPL));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasProfile,error,mode,plan,sisaUangBulanan,danaTerkumpulSaatIni,selisihMenujuTarget,collectedFunds,debtPayoff,realizedPL);

@override
String toString() {
  return 'RetirementPlan(hasProfile: $hasProfile, error: $error, mode: $mode, plan: $plan, sisaUangBulanan: $sisaUangBulanan, danaTerkumpulSaatIni: $danaTerkumpulSaatIni, selisihMenujuTarget: $selisihMenujuTarget, collectedFunds: $collectedFunds, debtPayoff: $debtPayoff, realizedPL: $realizedPL)';
}


}

/// @nodoc
abstract mixin class $RetirementPlanCopyWith<$Res>  {
  factory $RetirementPlanCopyWith(RetirementPlan value, $Res Function(RetirementPlan) _then) = _$RetirementPlanCopyWithImpl;
@useResult
$Res call({
 bool hasProfile, String? error, String? mode, RetirementPlanDetails? plan,@JsonKey(fromJson: parseJsonMoneyAmountNullable) int? sisaUangBulanan,@JsonKey(fromJson: parseJsonMoneyAmountNullable) int? danaTerkumpulSaatIni,@JsonKey(fromJson: parseJsonMoneyAmountNullable) int? selisihMenujuTarget, RetirementCollectedFunds? collectedFunds, RetirementDebtPayoff? debtPayoff, RetirementRealizedPL? realizedPL
});


$RetirementPlanDetailsCopyWith<$Res>? get plan;$RetirementCollectedFundsCopyWith<$Res>? get collectedFunds;$RetirementDebtPayoffCopyWith<$Res>? get debtPayoff;$RetirementRealizedPLCopyWith<$Res>? get realizedPL;

}
/// @nodoc
class _$RetirementPlanCopyWithImpl<$Res>
    implements $RetirementPlanCopyWith<$Res> {
  _$RetirementPlanCopyWithImpl(this._self, this._then);

  final RetirementPlan _self;
  final $Res Function(RetirementPlan) _then;

/// Create a copy of RetirementPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasProfile = null,Object? error = freezed,Object? mode = freezed,Object? plan = freezed,Object? sisaUangBulanan = freezed,Object? danaTerkumpulSaatIni = freezed,Object? selisihMenujuTarget = freezed,Object? collectedFunds = freezed,Object? debtPayoff = freezed,Object? realizedPL = freezed,}) {
  return _then(_self.copyWith(
hasProfile: null == hasProfile ? _self.hasProfile : hasProfile // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as RetirementPlanDetails?,sisaUangBulanan: freezed == sisaUangBulanan ? _self.sisaUangBulanan : sisaUangBulanan // ignore: cast_nullable_to_non_nullable
as int?,danaTerkumpulSaatIni: freezed == danaTerkumpulSaatIni ? _self.danaTerkumpulSaatIni : danaTerkumpulSaatIni // ignore: cast_nullable_to_non_nullable
as int?,selisihMenujuTarget: freezed == selisihMenujuTarget ? _self.selisihMenujuTarget : selisihMenujuTarget // ignore: cast_nullable_to_non_nullable
as int?,collectedFunds: freezed == collectedFunds ? _self.collectedFunds : collectedFunds // ignore: cast_nullable_to_non_nullable
as RetirementCollectedFunds?,debtPayoff: freezed == debtPayoff ? _self.debtPayoff : debtPayoff // ignore: cast_nullable_to_non_nullable
as RetirementDebtPayoff?,realizedPL: freezed == realizedPL ? _self.realizedPL : realizedPL // ignore: cast_nullable_to_non_nullable
as RetirementRealizedPL?,
  ));
}
/// Create a copy of RetirementPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RetirementPlanDetailsCopyWith<$Res>? get plan {
    if (_self.plan == null) {
    return null;
  }

  return $RetirementPlanDetailsCopyWith<$Res>(_self.plan!, (value) {
    return _then(_self.copyWith(plan: value));
  });
}/// Create a copy of RetirementPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RetirementCollectedFundsCopyWith<$Res>? get collectedFunds {
    if (_self.collectedFunds == null) {
    return null;
  }

  return $RetirementCollectedFundsCopyWith<$Res>(_self.collectedFunds!, (value) {
    return _then(_self.copyWith(collectedFunds: value));
  });
}/// Create a copy of RetirementPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RetirementDebtPayoffCopyWith<$Res>? get debtPayoff {
    if (_self.debtPayoff == null) {
    return null;
  }

  return $RetirementDebtPayoffCopyWith<$Res>(_self.debtPayoff!, (value) {
    return _then(_self.copyWith(debtPayoff: value));
  });
}/// Create a copy of RetirementPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RetirementRealizedPLCopyWith<$Res>? get realizedPL {
    if (_self.realizedPL == null) {
    return null;
  }

  return $RetirementRealizedPLCopyWith<$Res>(_self.realizedPL!, (value) {
    return _then(_self.copyWith(realizedPL: value));
  });
}
}


/// Adds pattern-matching-related methods to [RetirementPlan].
extension RetirementPlanPatterns on RetirementPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RetirementPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RetirementPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RetirementPlan value)  $default,){
final _that = this;
switch (_that) {
case _RetirementPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RetirementPlan value)?  $default,){
final _that = this;
switch (_that) {
case _RetirementPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasProfile,  String? error,  String? mode,  RetirementPlanDetails? plan, @JsonKey(fromJson: parseJsonMoneyAmountNullable)  int? sisaUangBulanan, @JsonKey(fromJson: parseJsonMoneyAmountNullable)  int? danaTerkumpulSaatIni, @JsonKey(fromJson: parseJsonMoneyAmountNullable)  int? selisihMenujuTarget,  RetirementCollectedFunds? collectedFunds,  RetirementDebtPayoff? debtPayoff,  RetirementRealizedPL? realizedPL)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RetirementPlan() when $default != null:
return $default(_that.hasProfile,_that.error,_that.mode,_that.plan,_that.sisaUangBulanan,_that.danaTerkumpulSaatIni,_that.selisihMenujuTarget,_that.collectedFunds,_that.debtPayoff,_that.realizedPL);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasProfile,  String? error,  String? mode,  RetirementPlanDetails? plan, @JsonKey(fromJson: parseJsonMoneyAmountNullable)  int? sisaUangBulanan, @JsonKey(fromJson: parseJsonMoneyAmountNullable)  int? danaTerkumpulSaatIni, @JsonKey(fromJson: parseJsonMoneyAmountNullable)  int? selisihMenujuTarget,  RetirementCollectedFunds? collectedFunds,  RetirementDebtPayoff? debtPayoff,  RetirementRealizedPL? realizedPL)  $default,) {final _that = this;
switch (_that) {
case _RetirementPlan():
return $default(_that.hasProfile,_that.error,_that.mode,_that.plan,_that.sisaUangBulanan,_that.danaTerkumpulSaatIni,_that.selisihMenujuTarget,_that.collectedFunds,_that.debtPayoff,_that.realizedPL);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasProfile,  String? error,  String? mode,  RetirementPlanDetails? plan, @JsonKey(fromJson: parseJsonMoneyAmountNullable)  int? sisaUangBulanan, @JsonKey(fromJson: parseJsonMoneyAmountNullable)  int? danaTerkumpulSaatIni, @JsonKey(fromJson: parseJsonMoneyAmountNullable)  int? selisihMenujuTarget,  RetirementCollectedFunds? collectedFunds,  RetirementDebtPayoff? debtPayoff,  RetirementRealizedPL? realizedPL)?  $default,) {final _that = this;
switch (_that) {
case _RetirementPlan() when $default != null:
return $default(_that.hasProfile,_that.error,_that.mode,_that.plan,_that.sisaUangBulanan,_that.danaTerkumpulSaatIni,_that.selisihMenujuTarget,_that.collectedFunds,_that.debtPayoff,_that.realizedPL);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RetirementPlan extends RetirementPlan {
  const _RetirementPlan({required this.hasProfile, this.error, this.mode, this.plan, @JsonKey(fromJson: parseJsonMoneyAmountNullable) this.sisaUangBulanan, @JsonKey(fromJson: parseJsonMoneyAmountNullable) this.danaTerkumpulSaatIni, @JsonKey(fromJson: parseJsonMoneyAmountNullable) this.selisihMenujuTarget, this.collectedFunds, this.debtPayoff, this.realizedPL}): super._();
  factory _RetirementPlan.fromJson(Map<String, dynamic> json) => _$RetirementPlanFromJson(json);

@override final  bool hasProfile;
@override final  String? error;
@override final  String? mode;
@override final  RetirementPlanDetails? plan;
@override@JsonKey(fromJson: parseJsonMoneyAmountNullable) final  int? sisaUangBulanan;
@override@JsonKey(fromJson: parseJsonMoneyAmountNullable) final  int? danaTerkumpulSaatIni;
@override@JsonKey(fromJson: parseJsonMoneyAmountNullable) final  int? selisihMenujuTarget;
@override final  RetirementCollectedFunds? collectedFunds;
@override final  RetirementDebtPayoff? debtPayoff;
@override final  RetirementRealizedPL? realizedPL;

/// Create a copy of RetirementPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetirementPlanCopyWith<_RetirementPlan> get copyWith => __$RetirementPlanCopyWithImpl<_RetirementPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RetirementPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetirementPlan&&(identical(other.hasProfile, hasProfile) || other.hasProfile == hasProfile)&&(identical(other.error, error) || other.error == error)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.sisaUangBulanan, sisaUangBulanan) || other.sisaUangBulanan == sisaUangBulanan)&&(identical(other.danaTerkumpulSaatIni, danaTerkumpulSaatIni) || other.danaTerkumpulSaatIni == danaTerkumpulSaatIni)&&(identical(other.selisihMenujuTarget, selisihMenujuTarget) || other.selisihMenujuTarget == selisihMenujuTarget)&&(identical(other.collectedFunds, collectedFunds) || other.collectedFunds == collectedFunds)&&(identical(other.debtPayoff, debtPayoff) || other.debtPayoff == debtPayoff)&&(identical(other.realizedPL, realizedPL) || other.realizedPL == realizedPL));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasProfile,error,mode,plan,sisaUangBulanan,danaTerkumpulSaatIni,selisihMenujuTarget,collectedFunds,debtPayoff,realizedPL);

@override
String toString() {
  return 'RetirementPlan(hasProfile: $hasProfile, error: $error, mode: $mode, plan: $plan, sisaUangBulanan: $sisaUangBulanan, danaTerkumpulSaatIni: $danaTerkumpulSaatIni, selisihMenujuTarget: $selisihMenujuTarget, collectedFunds: $collectedFunds, debtPayoff: $debtPayoff, realizedPL: $realizedPL)';
}


}

/// @nodoc
abstract mixin class _$RetirementPlanCopyWith<$Res> implements $RetirementPlanCopyWith<$Res> {
  factory _$RetirementPlanCopyWith(_RetirementPlan value, $Res Function(_RetirementPlan) _then) = __$RetirementPlanCopyWithImpl;
@override @useResult
$Res call({
 bool hasProfile, String? error, String? mode, RetirementPlanDetails? plan,@JsonKey(fromJson: parseJsonMoneyAmountNullable) int? sisaUangBulanan,@JsonKey(fromJson: parseJsonMoneyAmountNullable) int? danaTerkumpulSaatIni,@JsonKey(fromJson: parseJsonMoneyAmountNullable) int? selisihMenujuTarget, RetirementCollectedFunds? collectedFunds, RetirementDebtPayoff? debtPayoff, RetirementRealizedPL? realizedPL
});


@override $RetirementPlanDetailsCopyWith<$Res>? get plan;@override $RetirementCollectedFundsCopyWith<$Res>? get collectedFunds;@override $RetirementDebtPayoffCopyWith<$Res>? get debtPayoff;@override $RetirementRealizedPLCopyWith<$Res>? get realizedPL;

}
/// @nodoc
class __$RetirementPlanCopyWithImpl<$Res>
    implements _$RetirementPlanCopyWith<$Res> {
  __$RetirementPlanCopyWithImpl(this._self, this._then);

  final _RetirementPlan _self;
  final $Res Function(_RetirementPlan) _then;

/// Create a copy of RetirementPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasProfile = null,Object? error = freezed,Object? mode = freezed,Object? plan = freezed,Object? sisaUangBulanan = freezed,Object? danaTerkumpulSaatIni = freezed,Object? selisihMenujuTarget = freezed,Object? collectedFunds = freezed,Object? debtPayoff = freezed,Object? realizedPL = freezed,}) {
  return _then(_RetirementPlan(
hasProfile: null == hasProfile ? _self.hasProfile : hasProfile // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as RetirementPlanDetails?,sisaUangBulanan: freezed == sisaUangBulanan ? _self.sisaUangBulanan : sisaUangBulanan // ignore: cast_nullable_to_non_nullable
as int?,danaTerkumpulSaatIni: freezed == danaTerkumpulSaatIni ? _self.danaTerkumpulSaatIni : danaTerkumpulSaatIni // ignore: cast_nullable_to_non_nullable
as int?,selisihMenujuTarget: freezed == selisihMenujuTarget ? _self.selisihMenujuTarget : selisihMenujuTarget // ignore: cast_nullable_to_non_nullable
as int?,collectedFunds: freezed == collectedFunds ? _self.collectedFunds : collectedFunds // ignore: cast_nullable_to_non_nullable
as RetirementCollectedFunds?,debtPayoff: freezed == debtPayoff ? _self.debtPayoff : debtPayoff // ignore: cast_nullable_to_non_nullable
as RetirementDebtPayoff?,realizedPL: freezed == realizedPL ? _self.realizedPL : realizedPL // ignore: cast_nullable_to_non_nullable
as RetirementRealizedPL?,
  ));
}

/// Create a copy of RetirementPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RetirementPlanDetailsCopyWith<$Res>? get plan {
    if (_self.plan == null) {
    return null;
  }

  return $RetirementPlanDetailsCopyWith<$Res>(_self.plan!, (value) {
    return _then(_self.copyWith(plan: value));
  });
}/// Create a copy of RetirementPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RetirementCollectedFundsCopyWith<$Res>? get collectedFunds {
    if (_self.collectedFunds == null) {
    return null;
  }

  return $RetirementCollectedFundsCopyWith<$Res>(_self.collectedFunds!, (value) {
    return _then(_self.copyWith(collectedFunds: value));
  });
}/// Create a copy of RetirementPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RetirementDebtPayoffCopyWith<$Res>? get debtPayoff {
    if (_self.debtPayoff == null) {
    return null;
  }

  return $RetirementDebtPayoffCopyWith<$Res>(_self.debtPayoff!, (value) {
    return _then(_self.copyWith(debtPayoff: value));
  });
}/// Create a copy of RetirementPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RetirementRealizedPLCopyWith<$Res>? get realizedPL {
    if (_self.realizedPL == null) {
    return null;
  }

  return $RetirementRealizedPLCopyWith<$Res>(_self.realizedPL!, (value) {
    return _then(_self.copyWith(realizedPL: value));
  });
}
}

// dart format on
