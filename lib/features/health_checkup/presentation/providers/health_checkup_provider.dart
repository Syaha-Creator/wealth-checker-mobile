import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/health_checkup_repository.dart';
import '../../data/models/health_checkup.dart';

part 'health_checkup_provider.g.dart';

@riverpod
Future<HealthCheckup> healthCheckup(Ref ref) {
  return ref.watch(healthCheckupRepositoryProvider).getHealthCheckup();
}
