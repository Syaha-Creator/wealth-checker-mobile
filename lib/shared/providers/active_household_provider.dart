import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_household_provider.g.dart';

/// Active household context for API requests.
///
/// `null` means the backend falls back to the user's default household.
@riverpod
class ActiveHouseholdId extends _$ActiveHouseholdId {
  @override
  String? build() => null;

  void switchTo(String householdId) {
    state = householdId;
  }
}
