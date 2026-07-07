// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_mutation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountMutation {

 AccountMutationAccount get account;@JsonKey(fromJson: parseJsonIntOrString) int get saldoAwalTurunan;@JsonKey(fromJson: parseJsonIntOrString) int get saldoSebelumPeriode; bool get konsisten; List<MutationEntry> get mutasi;
/// Create a copy of AccountMutation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountMutationCopyWith<AccountMutation> get copyWith => _$AccountMutationCopyWithImpl<AccountMutation>(this as AccountMutation, _$identity);

  /// Serializes this AccountMutation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountMutation&&(identical(other.account, account) || other.account == account)&&(identical(other.saldoAwalTurunan, saldoAwalTurunan) || other.saldoAwalTurunan == saldoAwalTurunan)&&(identical(other.saldoSebelumPeriode, saldoSebelumPeriode) || other.saldoSebelumPeriode == saldoSebelumPeriode)&&(identical(other.konsisten, konsisten) || other.konsisten == konsisten)&&const DeepCollectionEquality().equals(other.mutasi, mutasi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,account,saldoAwalTurunan,saldoSebelumPeriode,konsisten,const DeepCollectionEquality().hash(mutasi));

@override
String toString() {
  return 'AccountMutation(account: $account, saldoAwalTurunan: $saldoAwalTurunan, saldoSebelumPeriode: $saldoSebelumPeriode, konsisten: $konsisten, mutasi: $mutasi)';
}


}

/// @nodoc
abstract mixin class $AccountMutationCopyWith<$Res>  {
  factory $AccountMutationCopyWith(AccountMutation value, $Res Function(AccountMutation) _then) = _$AccountMutationCopyWithImpl;
@useResult
$Res call({
 AccountMutationAccount account,@JsonKey(fromJson: parseJsonIntOrString) int saldoAwalTurunan,@JsonKey(fromJson: parseJsonIntOrString) int saldoSebelumPeriode, bool konsisten, List<MutationEntry> mutasi
});


$AccountMutationAccountCopyWith<$Res> get account;

}
/// @nodoc
class _$AccountMutationCopyWithImpl<$Res>
    implements $AccountMutationCopyWith<$Res> {
  _$AccountMutationCopyWithImpl(this._self, this._then);

  final AccountMutation _self;
  final $Res Function(AccountMutation) _then;

/// Create a copy of AccountMutation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? account = null,Object? saldoAwalTurunan = null,Object? saldoSebelumPeriode = null,Object? konsisten = null,Object? mutasi = null,}) {
  return _then(_self.copyWith(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountMutationAccount,saldoAwalTurunan: null == saldoAwalTurunan ? _self.saldoAwalTurunan : saldoAwalTurunan // ignore: cast_nullable_to_non_nullable
as int,saldoSebelumPeriode: null == saldoSebelumPeriode ? _self.saldoSebelumPeriode : saldoSebelumPeriode // ignore: cast_nullable_to_non_nullable
as int,konsisten: null == konsisten ? _self.konsisten : konsisten // ignore: cast_nullable_to_non_nullable
as bool,mutasi: null == mutasi ? _self.mutasi : mutasi // ignore: cast_nullable_to_non_nullable
as List<MutationEntry>,
  ));
}
/// Create a copy of AccountMutation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountMutationAccountCopyWith<$Res> get account {
  
  return $AccountMutationAccountCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountMutation].
extension AccountMutationPatterns on AccountMutation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountMutation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountMutation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountMutation value)  $default,){
final _that = this;
switch (_that) {
case _AccountMutation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountMutation value)?  $default,){
final _that = this;
switch (_that) {
case _AccountMutation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AccountMutationAccount account, @JsonKey(fromJson: parseJsonIntOrString)  int saldoAwalTurunan, @JsonKey(fromJson: parseJsonIntOrString)  int saldoSebelumPeriode,  bool konsisten,  List<MutationEntry> mutasi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountMutation() when $default != null:
return $default(_that.account,_that.saldoAwalTurunan,_that.saldoSebelumPeriode,_that.konsisten,_that.mutasi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AccountMutationAccount account, @JsonKey(fromJson: parseJsonIntOrString)  int saldoAwalTurunan, @JsonKey(fromJson: parseJsonIntOrString)  int saldoSebelumPeriode,  bool konsisten,  List<MutationEntry> mutasi)  $default,) {final _that = this;
switch (_that) {
case _AccountMutation():
return $default(_that.account,_that.saldoAwalTurunan,_that.saldoSebelumPeriode,_that.konsisten,_that.mutasi);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AccountMutationAccount account, @JsonKey(fromJson: parseJsonIntOrString)  int saldoAwalTurunan, @JsonKey(fromJson: parseJsonIntOrString)  int saldoSebelumPeriode,  bool konsisten,  List<MutationEntry> mutasi)?  $default,) {final _that = this;
switch (_that) {
case _AccountMutation() when $default != null:
return $default(_that.account,_that.saldoAwalTurunan,_that.saldoSebelumPeriode,_that.konsisten,_that.mutasi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountMutation implements AccountMutation {
  const _AccountMutation({required this.account, @JsonKey(fromJson: parseJsonIntOrString) required this.saldoAwalTurunan, @JsonKey(fromJson: parseJsonIntOrString) required this.saldoSebelumPeriode, required this.konsisten, final  List<MutationEntry> mutasi = const []}): _mutasi = mutasi;
  factory _AccountMutation.fromJson(Map<String, dynamic> json) => _$AccountMutationFromJson(json);

@override final  AccountMutationAccount account;
@override@JsonKey(fromJson: parseJsonIntOrString) final  int saldoAwalTurunan;
@override@JsonKey(fromJson: parseJsonIntOrString) final  int saldoSebelumPeriode;
@override final  bool konsisten;
 final  List<MutationEntry> _mutasi;
@override@JsonKey() List<MutationEntry> get mutasi {
  if (_mutasi is EqualUnmodifiableListView) return _mutasi;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mutasi);
}


/// Create a copy of AccountMutation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountMutationCopyWith<_AccountMutation> get copyWith => __$AccountMutationCopyWithImpl<_AccountMutation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountMutationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountMutation&&(identical(other.account, account) || other.account == account)&&(identical(other.saldoAwalTurunan, saldoAwalTurunan) || other.saldoAwalTurunan == saldoAwalTurunan)&&(identical(other.saldoSebelumPeriode, saldoSebelumPeriode) || other.saldoSebelumPeriode == saldoSebelumPeriode)&&(identical(other.konsisten, konsisten) || other.konsisten == konsisten)&&const DeepCollectionEquality().equals(other._mutasi, _mutasi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,account,saldoAwalTurunan,saldoSebelumPeriode,konsisten,const DeepCollectionEquality().hash(_mutasi));

@override
String toString() {
  return 'AccountMutation(account: $account, saldoAwalTurunan: $saldoAwalTurunan, saldoSebelumPeriode: $saldoSebelumPeriode, konsisten: $konsisten, mutasi: $mutasi)';
}


}

/// @nodoc
abstract mixin class _$AccountMutationCopyWith<$Res> implements $AccountMutationCopyWith<$Res> {
  factory _$AccountMutationCopyWith(_AccountMutation value, $Res Function(_AccountMutation) _then) = __$AccountMutationCopyWithImpl;
@override @useResult
$Res call({
 AccountMutationAccount account,@JsonKey(fromJson: parseJsonIntOrString) int saldoAwalTurunan,@JsonKey(fromJson: parseJsonIntOrString) int saldoSebelumPeriode, bool konsisten, List<MutationEntry> mutasi
});


@override $AccountMutationAccountCopyWith<$Res> get account;

}
/// @nodoc
class __$AccountMutationCopyWithImpl<$Res>
    implements _$AccountMutationCopyWith<$Res> {
  __$AccountMutationCopyWithImpl(this._self, this._then);

  final _AccountMutation _self;
  final $Res Function(_AccountMutation) _then;

/// Create a copy of AccountMutation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? account = null,Object? saldoAwalTurunan = null,Object? saldoSebelumPeriode = null,Object? konsisten = null,Object? mutasi = null,}) {
  return _then(_AccountMutation(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountMutationAccount,saldoAwalTurunan: null == saldoAwalTurunan ? _self.saldoAwalTurunan : saldoAwalTurunan // ignore: cast_nullable_to_non_nullable
as int,saldoSebelumPeriode: null == saldoSebelumPeriode ? _self.saldoSebelumPeriode : saldoSebelumPeriode // ignore: cast_nullable_to_non_nullable
as int,konsisten: null == konsisten ? _self.konsisten : konsisten // ignore: cast_nullable_to_non_nullable
as bool,mutasi: null == mutasi ? _self._mutasi : mutasi // ignore: cast_nullable_to_non_nullable
as List<MutationEntry>,
  ));
}

/// Create a copy of AccountMutation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountMutationAccountCopyWith<$Res> get account {
  
  return $AccountMutationAccountCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}


/// @nodoc
mixin _$AccountMutationAccount {

 String get id; String get nama;@JsonKey(fromJson: parseJsonIntOrString) int get saldoCache;
/// Create a copy of AccountMutationAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountMutationAccountCopyWith<AccountMutationAccount> get copyWith => _$AccountMutationAccountCopyWithImpl<AccountMutationAccount>(this as AccountMutationAccount, _$identity);

  /// Serializes this AccountMutationAccount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountMutationAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.nama, nama) || other.nama == nama)&&(identical(other.saldoCache, saldoCache) || other.saldoCache == saldoCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nama,saldoCache);

@override
String toString() {
  return 'AccountMutationAccount(id: $id, nama: $nama, saldoCache: $saldoCache)';
}


}

/// @nodoc
abstract mixin class $AccountMutationAccountCopyWith<$Res>  {
  factory $AccountMutationAccountCopyWith(AccountMutationAccount value, $Res Function(AccountMutationAccount) _then) = _$AccountMutationAccountCopyWithImpl;
@useResult
$Res call({
 String id, String nama,@JsonKey(fromJson: parseJsonIntOrString) int saldoCache
});




}
/// @nodoc
class _$AccountMutationAccountCopyWithImpl<$Res>
    implements $AccountMutationAccountCopyWith<$Res> {
  _$AccountMutationAccountCopyWithImpl(this._self, this._then);

  final AccountMutationAccount _self;
  final $Res Function(AccountMutationAccount) _then;

/// Create a copy of AccountMutationAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nama = null,Object? saldoCache = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nama: null == nama ? _self.nama : nama // ignore: cast_nullable_to_non_nullable
as String,saldoCache: null == saldoCache ? _self.saldoCache : saldoCache // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountMutationAccount].
extension AccountMutationAccountPatterns on AccountMutationAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountMutationAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountMutationAccount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountMutationAccount value)  $default,){
final _that = this;
switch (_that) {
case _AccountMutationAccount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountMutationAccount value)?  $default,){
final _that = this;
switch (_that) {
case _AccountMutationAccount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nama, @JsonKey(fromJson: parseJsonIntOrString)  int saldoCache)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountMutationAccount() when $default != null:
return $default(_that.id,_that.nama,_that.saldoCache);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nama, @JsonKey(fromJson: parseJsonIntOrString)  int saldoCache)  $default,) {final _that = this;
switch (_that) {
case _AccountMutationAccount():
return $default(_that.id,_that.nama,_that.saldoCache);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nama, @JsonKey(fromJson: parseJsonIntOrString)  int saldoCache)?  $default,) {final _that = this;
switch (_that) {
case _AccountMutationAccount() when $default != null:
return $default(_that.id,_that.nama,_that.saldoCache);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountMutationAccount implements AccountMutationAccount {
  const _AccountMutationAccount({required this.id, required this.nama, @JsonKey(fromJson: parseJsonIntOrString) required this.saldoCache});
  factory _AccountMutationAccount.fromJson(Map<String, dynamic> json) => _$AccountMutationAccountFromJson(json);

@override final  String id;
@override final  String nama;
@override@JsonKey(fromJson: parseJsonIntOrString) final  int saldoCache;

/// Create a copy of AccountMutationAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountMutationAccountCopyWith<_AccountMutationAccount> get copyWith => __$AccountMutationAccountCopyWithImpl<_AccountMutationAccount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountMutationAccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountMutationAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.nama, nama) || other.nama == nama)&&(identical(other.saldoCache, saldoCache) || other.saldoCache == saldoCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nama,saldoCache);

@override
String toString() {
  return 'AccountMutationAccount(id: $id, nama: $nama, saldoCache: $saldoCache)';
}


}

/// @nodoc
abstract mixin class _$AccountMutationAccountCopyWith<$Res> implements $AccountMutationAccountCopyWith<$Res> {
  factory _$AccountMutationAccountCopyWith(_AccountMutationAccount value, $Res Function(_AccountMutationAccount) _then) = __$AccountMutationAccountCopyWithImpl;
@override @useResult
$Res call({
 String id, String nama,@JsonKey(fromJson: parseJsonIntOrString) int saldoCache
});




}
/// @nodoc
class __$AccountMutationAccountCopyWithImpl<$Res>
    implements _$AccountMutationAccountCopyWith<$Res> {
  __$AccountMutationAccountCopyWithImpl(this._self, this._then);

  final _AccountMutationAccount _self;
  final $Res Function(_AccountMutationAccount) _then;

/// Create a copy of AccountMutationAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nama = null,Object? saldoCache = null,}) {
  return _then(_AccountMutationAccount(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nama: null == nama ? _self.nama : nama // ignore: cast_nullable_to_non_nullable
as String,saldoCache: null == saldoCache ? _self.saldoCache : saldoCache // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MutationEntry {

 String get id; String get tanggal; String get type; String get kategori; String get rincian;@JsonKey(fromJson: parseJsonIntOrString) int get nominal;@JsonKey(fromJson: parseJsonIntOrString) int get delta;@JsonKey(fromJson: parseJsonIntOrString) int get saldoSetelah;
/// Create a copy of MutationEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MutationEntryCopyWith<MutationEntry> get copyWith => _$MutationEntryCopyWithImpl<MutationEntry>(this as MutationEntry, _$identity);

  /// Serializes this MutationEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MutationEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.tanggal, tanggal) || other.tanggal == tanggal)&&(identical(other.type, type) || other.type == type)&&(identical(other.kategori, kategori) || other.kategori == kategori)&&(identical(other.rincian, rincian) || other.rincian == rincian)&&(identical(other.nominal, nominal) || other.nominal == nominal)&&(identical(other.delta, delta) || other.delta == delta)&&(identical(other.saldoSetelah, saldoSetelah) || other.saldoSetelah == saldoSetelah));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tanggal,type,kategori,rincian,nominal,delta,saldoSetelah);

@override
String toString() {
  return 'MutationEntry(id: $id, tanggal: $tanggal, type: $type, kategori: $kategori, rincian: $rincian, nominal: $nominal, delta: $delta, saldoSetelah: $saldoSetelah)';
}


}

/// @nodoc
abstract mixin class $MutationEntryCopyWith<$Res>  {
  factory $MutationEntryCopyWith(MutationEntry value, $Res Function(MutationEntry) _then) = _$MutationEntryCopyWithImpl;
@useResult
$Res call({
 String id, String tanggal, String type, String kategori, String rincian,@JsonKey(fromJson: parseJsonIntOrString) int nominal,@JsonKey(fromJson: parseJsonIntOrString) int delta,@JsonKey(fromJson: parseJsonIntOrString) int saldoSetelah
});




}
/// @nodoc
class _$MutationEntryCopyWithImpl<$Res>
    implements $MutationEntryCopyWith<$Res> {
  _$MutationEntryCopyWithImpl(this._self, this._then);

  final MutationEntry _self;
  final $Res Function(MutationEntry) _then;

/// Create a copy of MutationEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tanggal = null,Object? type = null,Object? kategori = null,Object? rincian = null,Object? nominal = null,Object? delta = null,Object? saldoSetelah = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tanggal: null == tanggal ? _self.tanggal : tanggal // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,kategori: null == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String,rincian: null == rincian ? _self.rincian : rincian // ignore: cast_nullable_to_non_nullable
as String,nominal: null == nominal ? _self.nominal : nominal // ignore: cast_nullable_to_non_nullable
as int,delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as int,saldoSetelah: null == saldoSetelah ? _self.saldoSetelah : saldoSetelah // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MutationEntry].
extension MutationEntryPatterns on MutationEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MutationEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MutationEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MutationEntry value)  $default,){
final _that = this;
switch (_that) {
case _MutationEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MutationEntry value)?  $default,){
final _that = this;
switch (_that) {
case _MutationEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tanggal,  String type,  String kategori,  String rincian, @JsonKey(fromJson: parseJsonIntOrString)  int nominal, @JsonKey(fromJson: parseJsonIntOrString)  int delta, @JsonKey(fromJson: parseJsonIntOrString)  int saldoSetelah)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MutationEntry() when $default != null:
return $default(_that.id,_that.tanggal,_that.type,_that.kategori,_that.rincian,_that.nominal,_that.delta,_that.saldoSetelah);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tanggal,  String type,  String kategori,  String rincian, @JsonKey(fromJson: parseJsonIntOrString)  int nominal, @JsonKey(fromJson: parseJsonIntOrString)  int delta, @JsonKey(fromJson: parseJsonIntOrString)  int saldoSetelah)  $default,) {final _that = this;
switch (_that) {
case _MutationEntry():
return $default(_that.id,_that.tanggal,_that.type,_that.kategori,_that.rincian,_that.nominal,_that.delta,_that.saldoSetelah);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tanggal,  String type,  String kategori,  String rincian, @JsonKey(fromJson: parseJsonIntOrString)  int nominal, @JsonKey(fromJson: parseJsonIntOrString)  int delta, @JsonKey(fromJson: parseJsonIntOrString)  int saldoSetelah)?  $default,) {final _that = this;
switch (_that) {
case _MutationEntry() when $default != null:
return $default(_that.id,_that.tanggal,_that.type,_that.kategori,_that.rincian,_that.nominal,_that.delta,_that.saldoSetelah);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MutationEntry implements MutationEntry {
  const _MutationEntry({required this.id, required this.tanggal, required this.type, required this.kategori, required this.rincian, @JsonKey(fromJson: parseJsonIntOrString) required this.nominal, @JsonKey(fromJson: parseJsonIntOrString) required this.delta, @JsonKey(fromJson: parseJsonIntOrString) required this.saldoSetelah});
  factory _MutationEntry.fromJson(Map<String, dynamic> json) => _$MutationEntryFromJson(json);

@override final  String id;
@override final  String tanggal;
@override final  String type;
@override final  String kategori;
@override final  String rincian;
@override@JsonKey(fromJson: parseJsonIntOrString) final  int nominal;
@override@JsonKey(fromJson: parseJsonIntOrString) final  int delta;
@override@JsonKey(fromJson: parseJsonIntOrString) final  int saldoSetelah;

/// Create a copy of MutationEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MutationEntryCopyWith<_MutationEntry> get copyWith => __$MutationEntryCopyWithImpl<_MutationEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MutationEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MutationEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.tanggal, tanggal) || other.tanggal == tanggal)&&(identical(other.type, type) || other.type == type)&&(identical(other.kategori, kategori) || other.kategori == kategori)&&(identical(other.rincian, rincian) || other.rincian == rincian)&&(identical(other.nominal, nominal) || other.nominal == nominal)&&(identical(other.delta, delta) || other.delta == delta)&&(identical(other.saldoSetelah, saldoSetelah) || other.saldoSetelah == saldoSetelah));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tanggal,type,kategori,rincian,nominal,delta,saldoSetelah);

@override
String toString() {
  return 'MutationEntry(id: $id, tanggal: $tanggal, type: $type, kategori: $kategori, rincian: $rincian, nominal: $nominal, delta: $delta, saldoSetelah: $saldoSetelah)';
}


}

/// @nodoc
abstract mixin class _$MutationEntryCopyWith<$Res> implements $MutationEntryCopyWith<$Res> {
  factory _$MutationEntryCopyWith(_MutationEntry value, $Res Function(_MutationEntry) _then) = __$MutationEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String tanggal, String type, String kategori, String rincian,@JsonKey(fromJson: parseJsonIntOrString) int nominal,@JsonKey(fromJson: parseJsonIntOrString) int delta,@JsonKey(fromJson: parseJsonIntOrString) int saldoSetelah
});




}
/// @nodoc
class __$MutationEntryCopyWithImpl<$Res>
    implements _$MutationEntryCopyWith<$Res> {
  __$MutationEntryCopyWithImpl(this._self, this._then);

  final _MutationEntry _self;
  final $Res Function(_MutationEntry) _then;

/// Create a copy of MutationEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tanggal = null,Object? type = null,Object? kategori = null,Object? rincian = null,Object? nominal = null,Object? delta = null,Object? saldoSetelah = null,}) {
  return _then(_MutationEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tanggal: null == tanggal ? _self.tanggal : tanggal // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,kategori: null == kategori ? _self.kategori : kategori // ignore: cast_nullable_to_non_nullable
as String,rincian: null == rincian ? _self.rincian : rincian // ignore: cast_nullable_to_non_nullable
as String,nominal: null == nominal ? _self.nominal : nominal // ignore: cast_nullable_to_non_nullable
as int,delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as int,saldoSetelah: null == saldoSetelah ? _self.saldoSetelah : saldoSetelah // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
