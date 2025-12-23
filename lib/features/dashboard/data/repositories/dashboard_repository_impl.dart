import '../../domain/entities/summary_entity.dart';
import '../../domain/entities/subscription_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_local_datasource.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardLocalDataSource localDataSource;

  DashboardRepositoryImpl({required this.localDataSource});

  @override
  List<SummaryEntity> getSummaryData() {
    final models = localDataSource.getSummaryData();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  List<SubscriptionEntity> getSubscriptions() {
    final models = localDataSource.getSubscriptions();
    return models.map((model) => model.toEntity()).toList();
  }
}
