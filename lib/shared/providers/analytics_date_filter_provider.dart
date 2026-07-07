import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_date_filter_provider.g.dart';

/// Shared date range for all analytics reports (Sprint 9+).
class AnalyticsDateRange {
  const AnalyticsDateRange({
    required this.from,
    required this.to,
  });

  final DateTime from;
  final DateTime to;

  AnalyticsDateRange copyWith({
    DateTime? from,
    DateTime? to,
  }) {
    return AnalyticsDateRange(
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }
}

DateTime _dateOnly(DateTime value) =>
    DateTime(value.year, value.month, value.day);

AnalyticsDateRange _bulanIniRange(DateTime now) {
  final start = DateTime(now.year, now.month, 1);
  return AnalyticsDateRange(from: start, to: _dateOnly(now));
}

AnalyticsDateRange _monthsBackRange(DateTime now, int months) {
  final startMonth = DateTime(now.year, now.month - (months - 1), 1);
  return AnalyticsDateRange(from: startMonth, to: _dateOnly(now));
}

AnalyticsDateRange _tahunIniRange(DateTime now) {
  final start = DateTime(now.year, 1, 1);
  return AnalyticsDateRange(from: start, to: _dateOnly(now));
}

@riverpod
class AnalyticsDateFilter extends _$AnalyticsDateFilter {
  @override
  AnalyticsDateRange build() => _bulanIniRange(DateTime.now());

  void setCustomRange(DateTime from, DateTime to) {
    state = AnalyticsDateRange(
      from: _dateOnly(from),
      to: _dateOnly(to),
    );
  }

  void setBulanIni() {
    state = _bulanIniRange(DateTime.now());
  }

  void set3BulanTerakhir() {
    state = _monthsBackRange(DateTime.now(), 3);
  }

  void set6BulanTerakhir() {
    state = _monthsBackRange(DateTime.now(), 6);
  }

  void setTahunIni() {
    state = _tahunIniRange(DateTime.now());
  }
}
