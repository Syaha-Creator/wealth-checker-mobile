import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wealth_checker_mobile/shared/providers/analytics_date_filter_provider.dart';

void main() {
  group('AnalyticsDateFilter.build', () {
    test('defaults to bulan ini with non-null from and to', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final range = container.read(analyticsDateFilterProvider);
      final now = DateTime.now();

      expect(range.from, DateTime(now.year, now.month, 1));
      expect(range.to, DateTime(now.year, now.month, now.day));
    });

    test('setBulanIni matches initial build range logic', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final initial = container.read(analyticsDateFilterProvider);
      container.read(analyticsDateFilterProvider.notifier).setBulanIni();
      final afterPreset = container.read(analyticsDateFilterProvider);

      expect(afterPreset.from, initial.from);
      expect(afterPreset.to.day, initial.to.day);
      expect(afterPreset.to.month, initial.to.month);
      expect(afterPreset.to.year, initial.to.year);
    });
  });
}
