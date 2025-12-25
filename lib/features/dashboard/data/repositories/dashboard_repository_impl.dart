import 'package:erpmax_client/features/dashboard/data/datasources/dashboard_local_datasource.dart';
import 'package:erpmax_client/features/dashboard/domain/entities/subscription_entity.dart';
import 'package:erpmax_client/features/dashboard/domain/entities/summary_entity.dart';
import 'package:erpmax_client/features/dashboard/domain/repositories/dashboard_repository.dart';

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
