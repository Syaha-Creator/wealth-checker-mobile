// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budgeting_advice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BudgetAllocation {

 String get kategori;@JsonKey(fromJson: parseJsonInt) int get persen;@JsonKey(fromJson: parseJsonInt) int get nominal;
/// Create a copy of BudgetAllocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetAllocationCopyWith<BudgetAllocation> get copyWith => _$BudgetAllocationCopyWithImpl<BudgetAllocation>(this as BudgetAllocation, _$identity);

  /// Serializes this BudgetAllocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetAllocation&&(identical(other.kategori, kategori) || other.kategori == kategori)&&(identical(other.persen, persen) || other.persen == persen)&&(identical(other.nominal, nominal) || other.nominal == nominal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kategori,persen,nominal);

@override
String toString() {
  return 'BudgetAllocation(kategori: $kategori, persen: $persen, nominal: $nominal)';
}


}

/// @nodoc
abstract mixin class $BudgetAllocationCopyWith<$Res>  {
  factory $BudgetAllocationCopyWith(BudgetAllocation value, $Res Function(BudgetAllocation) _then) = _$BudgetAllocationCopyWithImpl;
@useResult
$Res call({
 String kategori,@JsonKey(fromJson: parseJsonInt) int persen,@JsonKey(fromJson: parseJsonInt) int nominal
});




}
/// @nodoc
class _$BudgetAllocationCopyWithImpl<$Res>
    implements $BudgetAllocationCopyWith<$Res> {
  _$BudgetAllocationCopyWithImpl(this._self, this._then);

  final BudgetAllocation _self;
  final $Res Function(BudgetAllocation) _then;

/// Create a copy of BudgetAllocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kategori = null,Object? persen = null,Object? nominal = null,}) {
  return _then(_self.copyWith(
kategori: null == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String,persen: null == persen ? _self.persen : persen // ignore: cast_nullable_to_non_nullable
as int,nominal: null == nominal ? _self.nominal : nominal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetAllocation].
extension BudgetAllocationPatterns on BudgetAllocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetAllocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetAllocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetAllocation value)  $default,){
final _that = this;
switch (_that) {
case _BudgetAllocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetAllocation value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetAllocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String kategori, @JsonKey(fromJson: parseJsonInt)  int persen, @JsonKey(fromJson: parseJsonInt)  int nominal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetAllocation() when $default != null:
return $default(_that.kategori,_that.persen,_that.nominal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String kategori, @JsonKey(fromJson: parseJsonInt)  int persen, @JsonKey(fromJson: parseJsonInt)  int nominal)  $default,) {final _that = this;
switch (_that) {
case _BudgetAllocation():
return $default(_that.kategori,_that.persen,_that.nominal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String kategori, @JsonKey(fromJson: parseJsonInt)  int persen, @JsonKey(fromJson: parseJsonInt)  int nominal)?  $default,) {final _that = this;
switch (_that) {
case _BudgetAllocation() when $default != null:
return $default(_that.kategori,_that.persen,_that.nominal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BudgetAllocation implements BudgetAllocation {
  const _BudgetAllocation({required this.kategori, @JsonKey(fromJson: parseJsonInt) required this.persen, @JsonKey(fromJson: parseJsonInt) required this.nominal});
  factory _BudgetAllocation.fromJson(Map<String, dynamic> json) => _$BudgetAllocationFromJson(json);

@override final  String kategori;
@override@JsonKey(fromJson: parseJsonInt) final  int persen;
@override@JsonKey(fromJson: parseJsonInt) final  int nominal;

/// Create a copy of BudgetAllocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetAllocationCopyWith<_BudgetAllocation> get copyWith => __$BudgetAllocationCopyWithImpl<_BudgetAllocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BudgetAllocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetAllocation&&(identical(other.kategori, kategori) || other.kategori == kategori)&&(identical(other.persen, persen) || other.persen == persen)&&(identical(other.nominal, nominal) || other.nominal == nominal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kategori,persen,nominal);

@override
String toString() {
  return 'BudgetAllocation(kategori: $kategori, persen: $persen, nominal: $nominal)';
}


}

/// @nodoc
abstract mixin class _$BudgetAllocationCopyWith<$Res> implements $BudgetAllocationCopyWith<$Res> {
  factory _$BudgetAllocationCopyWith(_BudgetAllocation value, $Res Function(_BudgetAllocation) _then) = __$BudgetAllocationCopyWithImpl;
@override @useResult
$Res call({
 String kategori,@JsonKey(fromJson: parseJsonInt) int persen,@JsonKey(fromJson: parseJsonInt) int nominal
});




}
/// @nodoc
class __$BudgetAllocationCopyWithImpl<$Res>
    implements _$BudgetAllocationCopyWith<$Res> {
  __$BudgetAllocationCopyWithImpl(this._self, this._then);

  final _BudgetAllocation _self;
  final $Res Function(_BudgetAllocation) _then;

/// Create a copy of BudgetAllocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kategori = null,Object? persen = null,Object? nominal = null,}) {
  return _then(_BudgetAllocation(
kategori: null == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String,persen: null == persen ? _self.persen : persen // ignore: cast_nullable_to_non_nullable
as int,nominal: null == nominal ? _self.nominal : nominal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BudgetingAdvice {

@JsonKey(fromJson: parseJsonInt) int get wealthLevel; bool get hasPlan;@JsonKey(fromJson: parseJsonInt) int get rencanaPemasukanBulanan; List<BudgetAllocation> get alokasi;@JsonKey(fromJson: parseJsonInt) int get totalPersen;@JsonKey(fromJson: parseJsonInt) int get sisaTidakTeralokasi;
/// Create a copy of BudgetingAdvice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetingAdviceCopyWith<BudgetingAdvice> get copyWith => _$BudgetingAdviceCopyWithImpl<BudgetingAdvice>(this as BudgetingAdvice, _$identity);

  /// Serializes this BudgetingAdvice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetingAdvice&&(identical(other.wealthLevel, wealthLevel) || other.wealthLevel == wealthLevel)&&(identical(other.hasPlan, hasPlan) || other.hasPlan == hasPlan)&&(identical(other.rencanaPemasukanBulanan, rencanaPemasukanBulanan) || other.rencanaPemasukanBulanan == rencanaPemasukanBulanan)&&const DeepCollectionEquality().equals(other.alokasi, alokasi)&&(identical(other.totalPersen, totalPersen) || other.totalPersen == totalPersen)&&(identical(other.sisaTidakTeralokasi, sisaTidakTeralokasi) || other.sisaTidakTeralokasi == sisaTidakTeralokasi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wealthLevel,hasPlan,rencanaPemasukanBulanan,const DeepCollectionEquality().hash(alokasi),totalPersen,sisaTidakTeralokasi);

@override
String toString() {
  return 'BudgetingAdvice(wealthLevel: $wealthLevel, hasPlan: $hasPlan, rencanaPemasukanBulanan: $rencanaPemasukanBulanan, alokasi: $alokasi, totalPersen: $totalPersen, sisaTidakTeralokasi: $sisaTidakTeralokasi)';
}


}

/// @nodoc
abstract mixin class $BudgetingAdviceCopyWith<$Res>  {
  factory $BudgetingAdviceCopyWith(BudgetingAdvice value, $Res Function(BudgetingAdvice) _then) = _$BudgetingAdviceCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: parseJsonInt) int wealthLevel, bool hasPlan,@JsonKey(fromJson: parseJsonInt) int rencanaPemasukanBulanan, List<BudgetAllocation> alokasi,@JsonKey(fromJson: parseJsonInt) int totalPersen,@JsonKey(fromJson: parseJsonInt) int sisaTidakTeralokasi
});




}
/// @nodoc
class _$BudgetingAdviceCopyWithImpl<$Res>
    implements $BudgetingAdviceCopyWith<$Res> {
  _$BudgetingAdviceCopyWithImpl(this._self, this._then);

  final BudgetingAdvice _self;
  final $Res Function(BudgetingAdvice) _then;

/// Create a copy of BudgetingAdvice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wealthLevel = null,Object? hasPlan = null,Object? rencanaPemasukanBulanan = null,Object? alokasi = null,Object? totalPersen = null,Object? sisaTidakTeralokasi = null,}) {
  return _then(_self.copyWith(
wealthLevel: null == wealthLevel ? _self.wealthLevel : wealthLevel // ignore: cast_nullable_to_non_nullable
as int,hasPlan: null == hasPlan ? _self.hasPlan : hasPlan // ignore: cast_nullable_to_non_nullable
as bool,rencanaPemasukanBulanan: null == rencanaPemasukanBulanan ? _self.rencanaPemasukanBulanan : rencanaPemasukanBulanan // ignore: cast_nullable_to_non_nullable
as int,alokasi: null == alokasi ? _self.alokasi : alokasi // ignore: cast_nullable_to_non_nullable
as List<BudgetAllocation>,totalPersen: null == totalPersen ? _self.totalPersen : totalPersen // ignore: cast_nullable_to_non_nullable
as int,sisaTidakTeralokasi: null == sisaTidakTeralokasi ? _self.sisaTidakTeralokasi : sisaTidakTeralokasi // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetingAdvice].
extension BudgetingAdvicePatterns on BudgetingAdvice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetingAdvice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetingAdvice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetingAdvice value)  $default,){
final _that = this;
switch (_that) {
case _BudgetingAdvice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetingAdvice value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetingAdvice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonInt)  int wealthLevel,  bool hasPlan, @JsonKey(fromJson: parseJsonInt)  int rencanaPemasukanBulanan,  List<BudgetAllocation> alokasi, @JsonKey(fromJson: parseJsonInt)  int totalPersen, @JsonKey(fromJson: parseJsonInt)  int sisaTidakTeralokasi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetingAdvice() when $default != null:
return $default(_that.wealthLevel,_that.hasPlan,_that.rencanaPemasukanBulanan,_that.alokasi,_that.totalPersen,_that.sisaTidakTeralokasi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseJsonInt)  int wealthLevel,  bool hasPlan, @JsonKey(fromJson: parseJsonInt)  int rencanaPemasukanBulanan,  List<BudgetAllocation> alokasi, @JsonKey(fromJson: parseJsonInt)  int totalPersen, @JsonKey(fromJson: parseJsonInt)  int sisaTidakTeralokasi)  $default,) {final _that = this;
switch (_that) {
case _BudgetingAdvice():
return $default(_that.wealthLevel,_that.hasPlan,_that.rencanaPemasukanBulanan,_that.alokasi,_that.totalPersen,_that.sisaTidakTeralokasi);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: parseJsonInt)  int wealthLevel,  bool hasPlan, @JsonKey(fromJson: parseJsonInt)  int rencanaPemasukanBulanan,  List<BudgetAllocation> alokasi, @JsonKey(fromJson: parseJsonInt)  int totalPersen, @JsonKey(fromJson: parseJsonInt)  int sisaTidakTeralokasi)?  $default,) {final _that = this;
switch (_that) {
case _BudgetingAdvice() when $default != null:
return $default(_that.wealthLevel,_that.hasPlan,_that.rencanaPemasukanBulanan,_that.alokasi,_that.totalPersen,_that.sisaTidakTeralokasi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BudgetingAdvice extends BudgetingAdvice {
  const _BudgetingAdvice({@JsonKey(fromJson: parseJsonInt) required this.wealthLevel, required this.hasPlan, @JsonKey(fromJson: parseJsonInt) required this.rencanaPemasukanBulanan, final  List<BudgetAllocation> alokasi = const [], @JsonKey(fromJson: parseJsonInt) required this.totalPersen, @JsonKey(fromJson: parseJsonInt) required this.sisaTidakTeralokasi}): _alokasi = alokasi,super._();
  factory _BudgetingAdvice.fromJson(Map<String, dynamic> json) => _$BudgetingAdviceFromJson(json);

@override@JsonKey(fromJson: parseJsonInt) final  int wealthLevel;
@override final  bool hasPlan;
@override@JsonKey(fromJson: parseJsonInt) final  int rencanaPemasukanBulanan;
 final  List<BudgetAllocation> _alokasi;
@override@JsonKey() List<BudgetAllocation> get alokasi {
  if (_alokasi is EqualUnmodifiableListView) return _alokasi;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alokasi);
}

@override@JsonKey(fromJson: parseJsonInt) final  int totalPersen;
@override@JsonKey(fromJson: parseJsonInt) final  int sisaTidakTeralokasi;

/// Create a copy of BudgetingAdvice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetingAdviceCopyWith<_BudgetingAdvice> get copyWith => __$BudgetingAdviceCopyWithImpl<_BudgetingAdvice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BudgetingAdviceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetingAdvice&&(identical(other.wealthLevel, wealthLevel) || other.wealthLevel == wealthLevel)&&(identical(other.hasPlan, hasPlan) || other.hasPlan == hasPlan)&&(identical(other.rencanaPemasukanBulanan, rencanaPemasukanBulanan) || other.rencanaPemasukanBulanan == rencanaPemasukanBulanan)&&const DeepCollectionEquality().equals(other._alokasi, _alokasi)&&(identical(other.totalPersen, totalPersen) || other.totalPersen == totalPersen)&&(identical(other.sisaTidakTeralokasi, sisaTidakTeralokasi) || other.sisaTidakTeralokasi == sisaTidakTeralokasi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wealthLevel,hasPlan,rencanaPemasukanBulanan,const DeepCollectionEquality().hash(_alokasi),totalPersen,sisaTidakTeralokasi);

@override
String toString() {
  return 'BudgetingAdvice(wealthLevel: $wealthLevel, hasPlan: $hasPlan, rencanaPemasukanBulanan: $rencanaPemasukanBulanan, alokasi: $alokasi, totalPersen: $totalPersen, sisaTidakTeralokasi: $sisaTidakTeralokasi)';
}


}

/// @nodoc
abstract mixin class _$BudgetingAdviceCopyWith<$Res> implements $BudgetingAdviceCopyWith<$Res> {
  factory _$BudgetingAdviceCopyWith(_BudgetingAdvice value, $Res Function(_BudgetingAdvice) _then) = __$BudgetingAdviceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: parseJsonInt) int wealthLevel, bool hasPlan,@JsonKey(fromJson: parseJsonInt) int rencanaPemasukanBulanan, List<BudgetAllocation> alokasi,@JsonKey(fromJson: parseJsonInt) int totalPersen,@JsonKey(fromJson: parseJsonInt) int sisaTidakTeralokasi
});




}
/// @nodoc
class __$BudgetingAdviceCopyWithImpl<$Res>
    implements _$BudgetingAdviceCopyWith<$Res> {
  __$BudgetingAdviceCopyWithImpl(this._self, this._then);

  final _BudgetingAdvice _self;
  final $Res Function(_BudgetingAdvice) _then;

/// Create a copy of BudgetingAdvice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wealthLevel = null,Object? hasPlan = null,Object? rencanaPemasukanBulanan = null,Object? alokasi = null,Object? totalPersen = null,Object? sisaTidakTeralokasi = null,}) {
  return _then(_BudgetingAdvice(
wealthLevel: null == wealthLevel ? _self.wealthLevel : wealthLevel // ignore: cast_nullable_to_non_nullable
as int,hasPlan: null == hasPlan ? _self.hasPlan : hasPlan // ignore: cast_nullable_to_non_nullable
as bool,rencanaPemasukanBulanan: null == rencanaPemasukanBulanan ? _self.rencanaPemasukanBulanan : rencanaPemasukanBulanan // ignore: cast_nullable_to_non_nullable
as int,alokasi: null == alokasi ? _self._alokasi : alokasi // ignore: cast_nullable_to_non_nullable
as List<BudgetAllocation>,totalPersen: null == totalPersen ? _self.totalPersen : totalPersen // ignore: cast_nullable_to_non_nullable
as int,sisaTidakTeralokasi: null == sisaTidakTeralokasi ? _self.sisaTidakTeralokasi : sisaTidakTeralokasi // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
