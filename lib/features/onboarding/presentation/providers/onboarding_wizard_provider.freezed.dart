// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_wizard_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingWizardState {

 int get currentStepIndex; OnboardingSubmitStatus get submitStatus; String? get errorMessage; List<OnboardingAccountEntry> get accountEntries; List<OnboardingAssetEntry> get liquidAssetEntries; List<OnboardingAssetEntry> get fixedAssetEntries; List<OnboardingDebtEntry> get debtEntries; List<OnboardingReceivableEntry> get receivableEntries; List<OnboardingDebtEntry> get creditCardEntries; OnboardingProfileEntry? get profileEntry;
/// Create a copy of OnboardingWizardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingWizardStateCopyWith<OnboardingWizardState> get copyWith => _$OnboardingWizardStateCopyWithImpl<OnboardingWizardState>(this as OnboardingWizardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingWizardState&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.accountEntries, accountEntries)&&const DeepCollectionEquality().equals(other.liquidAssetEntries, liquidAssetEntries)&&const DeepCollectionEquality().equals(other.fixedAssetEntries, fixedAssetEntries)&&const DeepCollectionEquality().equals(other.debtEntries, debtEntries)&&const DeepCollectionEquality().equals(other.receivableEntries, receivableEntries)&&const DeepCollectionEquality().equals(other.creditCardEntries, creditCardEntries)&&(identical(other.profileEntry, profileEntry) || other.profileEntry == profileEntry));
}


@override
int get hashCode => Object.hash(runtimeType,currentStepIndex,submitStatus,errorMessage,const DeepCollectionEquality().hash(accountEntries),const DeepCollectionEquality().hash(liquidAssetEntries),const DeepCollectionEquality().hash(fixedAssetEntries),const DeepCollectionEquality().hash(debtEntries),const DeepCollectionEquality().hash(receivableEntries),const DeepCollectionEquality().hash(creditCardEntries),profileEntry);

@override
String toString() {
  return 'OnboardingWizardState(currentStepIndex: $currentStepIndex, submitStatus: $submitStatus, errorMessage: $errorMessage, accountEntries: $accountEntries, liquidAssetEntries: $liquidAssetEntries, fixedAssetEntries: $fixedAssetEntries, debtEntries: $debtEntries, receivableEntries: $receivableEntries, creditCardEntries: $creditCardEntries, profileEntry: $profileEntry)';
}


}

/// @nodoc
abstract mixin class $OnboardingWizardStateCopyWith<$Res>  {
  factory $OnboardingWizardStateCopyWith(OnboardingWizardState value, $Res Function(OnboardingWizardState) _then) = _$OnboardingWizardStateCopyWithImpl;
@useResult
$Res call({
 int currentStepIndex, OnboardingSubmitStatus submitStatus, String? errorMessage, List<OnboardingAccountEntry> accountEntries, List<OnboardingAssetEntry> liquidAssetEntries, List<OnboardingAssetEntry> fixedAssetEntries, List<OnboardingDebtEntry> debtEntries, List<OnboardingReceivableEntry> receivableEntries, List<OnboardingDebtEntry> creditCardEntries, OnboardingProfileEntry? profileEntry
});




}
/// @nodoc
class _$OnboardingWizardStateCopyWithImpl<$Res>
    implements $OnboardingWizardStateCopyWith<$Res> {
  _$OnboardingWizardStateCopyWithImpl(this._self, this._then);

  final OnboardingWizardState _self;
  final $Res Function(OnboardingWizardState) _then;

/// Create a copy of OnboardingWizardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStepIndex = null,Object? submitStatus = null,Object? errorMessage = freezed,Object? accountEntries = null,Object? liquidAssetEntries = null,Object? fixedAssetEntries = null,Object? debtEntries = null,Object? receivableEntries = null,Object? creditCardEntries = null,Object? profileEntry = freezed,}) {
  return _then(_self.copyWith(
currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
as int,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as OnboardingSubmitStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,accountEntries: null == accountEntries ? _self.accountEntries : accountEntries // ignore: cast_nullable_to_non_nullable
as List<OnboardingAccountEntry>,liquidAssetEntries: null == liquidAssetEntries ? _self.liquidAssetEntries : liquidAssetEntries // ignore: cast_nullable_to_non_nullable
as List<OnboardingAssetEntry>,fixedAssetEntries: null == fixedAssetEntries ? _self.fixedAssetEntries : fixedAssetEntries // ignore: cast_nullable_to_non_nullable
as List<OnboardingAssetEntry>,debtEntries: null == debtEntries ? _self.debtEntries : debtEntries // ignore: cast_nullable_to_non_nullable
as List<OnboardingDebtEntry>,receivableEntries: null == receivableEntries ? _self.receivableEntries : receivableEntries // ignore: cast_nullable_to_non_nullable
as List<OnboardingReceivableEntry>,creditCardEntries: null == creditCardEntries ? _self.creditCardEntries : creditCardEntries // ignore: cast_nullable_to_non_nullable
as List<OnboardingDebtEntry>,profileEntry: freezed == profileEntry ? _self.profileEntry : profileEntry // ignore: cast_nullable_to_non_nullable
as OnboardingProfileEntry?,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingWizardState].
extension OnboardingWizardStatePatterns on OnboardingWizardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingWizardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingWizardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingWizardState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingWizardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingWizardState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingWizardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStepIndex,  OnboardingSubmitStatus submitStatus,  String? errorMessage,  List<OnboardingAccountEntry> accountEntries,  List<OnboardingAssetEntry> liquidAssetEntries,  List<OnboardingAssetEntry> fixedAssetEntries,  List<OnboardingDebtEntry> debtEntries,  List<OnboardingReceivableEntry> receivableEntries,  List<OnboardingDebtEntry> creditCardEntries,  OnboardingProfileEntry? profileEntry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingWizardState() when $default != null:
return $default(_that.currentStepIndex,_that.submitStatus,_that.errorMessage,_that.accountEntries,_that.liquidAssetEntries,_that.fixedAssetEntries,_that.debtEntries,_that.receivableEntries,_that.creditCardEntries,_that.profileEntry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStepIndex,  OnboardingSubmitStatus submitStatus,  String? errorMessage,  List<OnboardingAccountEntry> accountEntries,  List<OnboardingAssetEntry> liquidAssetEntries,  List<OnboardingAssetEntry> fixedAssetEntries,  List<OnboardingDebtEntry> debtEntries,  List<OnboardingReceivableEntry> receivableEntries,  List<OnboardingDebtEntry> creditCardEntries,  OnboardingProfileEntry? profileEntry)  $default,) {final _that = this;
switch (_that) {
case _OnboardingWizardState():
return $default(_that.currentStepIndex,_that.submitStatus,_that.errorMessage,_that.accountEntries,_that.liquidAssetEntries,_that.fixedAssetEntries,_that.debtEntries,_that.receivableEntries,_that.creditCardEntries,_that.profileEntry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStepIndex,  OnboardingSubmitStatus submitStatus,  String? errorMessage,  List<OnboardingAccountEntry> accountEntries,  List<OnboardingAssetEntry> liquidAssetEntries,  List<OnboardingAssetEntry> fixedAssetEntries,  List<OnboardingDebtEntry> debtEntries,  List<OnboardingReceivableEntry> receivableEntries,  List<OnboardingDebtEntry> creditCardEntries,  OnboardingProfileEntry? profileEntry)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingWizardState() when $default != null:
return $default(_that.currentStepIndex,_that.submitStatus,_that.errorMessage,_that.accountEntries,_that.liquidAssetEntries,_that.fixedAssetEntries,_that.debtEntries,_that.receivableEntries,_that.creditCardEntries,_that.profileEntry);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingWizardState implements OnboardingWizardState {
  const _OnboardingWizardState({this.currentStepIndex = 0, this.submitStatus = OnboardingSubmitStatus.idle, this.errorMessage, final  List<OnboardingAccountEntry> accountEntries = const [], final  List<OnboardingAssetEntry> liquidAssetEntries = const [], final  List<OnboardingAssetEntry> fixedAssetEntries = const [], final  List<OnboardingDebtEntry> debtEntries = const [], final  List<OnboardingReceivableEntry> receivableEntries = const [], final  List<OnboardingDebtEntry> creditCardEntries = const [], this.profileEntry}): _accountEntries = accountEntries,_liquidAssetEntries = liquidAssetEntries,_fixedAssetEntries = fixedAssetEntries,_debtEntries = debtEntries,_receivableEntries = receivableEntries,_creditCardEntries = creditCardEntries;
  

@override@JsonKey() final  int currentStepIndex;
@override@JsonKey() final  OnboardingSubmitStatus submitStatus;
@override final  String? errorMessage;
 final  List<OnboardingAccountEntry> _accountEntries;
@override@JsonKey() List<OnboardingAccountEntry> get accountEntries {
  if (_accountEntries is EqualUnmodifiableListView) return _accountEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accountEntries);
}

 final  List<OnboardingAssetEntry> _liquidAssetEntries;
@override@JsonKey() List<OnboardingAssetEntry> get liquidAssetEntries {
  if (_liquidAssetEntries is EqualUnmodifiableListView) return _liquidAssetEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_liquidAssetEntries);
}

 final  List<OnboardingAssetEntry> _fixedAssetEntries;
@override@JsonKey() List<OnboardingAssetEntry> get fixedAssetEntries {
  if (_fixedAssetEntries is EqualUnmodifiableListView) return _fixedAssetEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fixedAssetEntries);
}

 final  List<OnboardingDebtEntry> _debtEntries;
@override@JsonKey() List<OnboardingDebtEntry> get debtEntries {
  if (_debtEntries is EqualUnmodifiableListView) return _debtEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_debtEntries);
}

 final  List<OnboardingReceivableEntry> _receivableEntries;
@override@JsonKey() List<OnboardingReceivableEntry> get receivableEntries {
  if (_receivableEntries is EqualUnmodifiableListView) return _receivableEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_receivableEntries);
}

 final  List<OnboardingDebtEntry> _creditCardEntries;
@override@JsonKey() List<OnboardingDebtEntry> get creditCardEntries {
  if (_creditCardEntries is EqualUnmodifiableListView) return _creditCardEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_creditCardEntries);
}

@override final  OnboardingProfileEntry? profileEntry;

/// Create a copy of OnboardingWizardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingWizardStateCopyWith<_OnboardingWizardState> get copyWith => __$OnboardingWizardStateCopyWithImpl<_OnboardingWizardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingWizardState&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._accountEntries, _accountEntries)&&const DeepCollectionEquality().equals(other._liquidAssetEntries, _liquidAssetEntries)&&const DeepCollectionEquality().equals(other._fixedAssetEntries, _fixedAssetEntries)&&const DeepCollectionEquality().equals(other._debtEntries, _debtEntries)&&const DeepCollectionEquality().equals(other._receivableEntries, _receivableEntries)&&const DeepCollectionEquality().equals(other._creditCardEntries, _creditCardEntries)&&(identical(other.profileEntry, profileEntry) || other.profileEntry == profileEntry));
}


@override
int get hashCode => Object.hash(runtimeType,currentStepIndex,submitStatus,errorMessage,const DeepCollectionEquality().hash(_accountEntries),const DeepCollectionEquality().hash(_liquidAssetEntries),const DeepCollectionEquality().hash(_fixedAssetEntries),const DeepCollectionEquality().hash(_debtEntries),const DeepCollectionEquality().hash(_receivableEntries),const DeepCollectionEquality().hash(_creditCardEntries),profileEntry);

@override
String toString() {
  return 'OnboardingWizardState(currentStepIndex: $currentStepIndex, submitStatus: $submitStatus, errorMessage: $errorMessage, accountEntries: $accountEntries, liquidAssetEntries: $liquidAssetEntries, fixedAssetEntries: $fixedAssetEntries, debtEntries: $debtEntries, receivableEntries: $receivableEntries, creditCardEntries: $creditCardEntries, profileEntry: $profileEntry)';
}


}

/// @nodoc
abstract mixin class _$OnboardingWizardStateCopyWith<$Res> implements $OnboardingWizardStateCopyWith<$Res> {
  factory _$OnboardingWizardStateCopyWith(_OnboardingWizardState value, $Res Function(_OnboardingWizardState) _then) = __$OnboardingWizardStateCopyWithImpl;
@override @useResult
$Res call({
 int currentStepIndex, OnboardingSubmitStatus submitStatus, String? errorMessage, List<OnboardingAccountEntry> accountEntries, List<OnboardingAssetEntry> liquidAssetEntries, List<OnboardingAssetEntry> fixedAssetEntries, List<OnboardingDebtEntry> debtEntries, List<OnboardingReceivableEntry> receivableEntries, List<OnboardingDebtEntry> creditCardEntries, OnboardingProfileEntry? profileEntry
});




}
/// @nodoc
class __$OnboardingWizardStateCopyWithImpl<$Res>
    implements _$OnboardingWizardStateCopyWith<$Res> {
  __$OnboardingWizardStateCopyWithImpl(this._self, this._then);

  final _OnboardingWizardState _self;
  final $Res Function(_OnboardingWizardState) _then;

/// Create a copy of OnboardingWizardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStepIndex = null,Object? submitStatus = null,Object? errorMessage = freezed,Object? accountEntries = null,Object? liquidAssetEntries = null,Object? fixedAssetEntries = null,Object? debtEntries = null,Object? receivableEntries = null,Object? creditCardEntries = null,Object? profileEntry = freezed,}) {
  return _then(_OnboardingWizardState(
currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
as int,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as OnboardingSubmitStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,accountEntries: null == accountEntries ? _self._accountEntries : accountEntries // ignore: cast_nullable_to_non_nullable
as List<OnboardingAccountEntry>,liquidAssetEntries: null == liquidAssetEntries ? _self._liquidAssetEntries : liquidAssetEntries // ignore: cast_nullable_to_non_nullable
as List<OnboardingAssetEntry>,fixedAssetEntries: null == fixedAssetEntries ? _self._fixedAssetEntries : fixedAssetEntries // ignore: cast_nullable_to_non_nullable
as List<OnboardingAssetEntry>,debtEntries: null == debtEntries ? _self._debtEntries : debtEntries // ignore: cast_nullable_to_non_nullable
as List<OnboardingDebtEntry>,receivableEntries: null == receivableEntries ? _self._receivableEntries : receivableEntries // ignore: cast_nullable_to_non_nullable
as List<OnboardingReceivableEntry>,creditCardEntries: null == creditCardEntries ? _self._creditCardEntries : creditCardEntries // ignore: cast_nullable_to_non_nullable
as List<OnboardingDebtEntry>,profileEntry: freezed == profileEntry ? _self.profileEntry : profileEntry // ignore: cast_nullable_to_non_nullable
as OnboardingProfileEntry?,
  ));
}


}

// dart format on
